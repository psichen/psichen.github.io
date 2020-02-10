---
title: python爬取大学及博士后信息
date: 2020-02-10 19:22:38
tags: [python, crawler, postdoc]
---

2020年开年不利，天启四骑士war, pestilence, famine, death已经降临了前3个，大家都宅在家里无法出门，于是我便利用这段时间学习一下爬虫的用法。

其实以前也用过爬虫，不过后来放了很久，很多包也更新了，所以值得重新学一遍。记得在实习的时候，经理曾经给了我一个报价网，该网将市场上几乎所以药品的中标价格都放在了网上，而且网页似乎并没有做任何反爬处理，可惜我已经忘记了网址T T

言归正传，这次用python的bs4、requests包来爬取网页信息，获得最近几年世界各地大学的变化趋势，以及postdoc的发布信息。

## 大学排名
数据来源：[世界大学学术排名](http://www.zuihaodaxue.com/ARWU2019.html)

首先看综合排名，图中只画出了总体的相对变化率>60%的学校（像哈佛牛津这些每年都是100的，反正也申不上，刚好可以一并筛掉）。

![total_score.png](https://i.loli.net/2020/02/10/1SWRxUrfwkhPoY8.png)

可以看出，有三所大学这些年涨势迅猛，其中university of Copenhagen尤为瞩目。而university of California, Davis越来越疲软。

接下来看看大学发表的nature&science的论文数（我就是很俗），以相对增长率>27%来筛选。

![paper_of_NS.png](https://i.loli.net/2020/02/10/yRVXsbuj4Yr8iTL.png)

Wow，University of Copenhagen又吸引了眼球，看来这所大学这些年开始great again了。联想到量子力学发展的那段历史，哥本哈根确实令人神往。

## postdoc信息

接下来找找postdoc的信息。

数据来源：[nature careers](https://www.nature.com/naturecareers/jobs/science-jobs), [science careers](https://jobs.sciencecareers.org/jobs/postdoc/)

nature和science的官网上有postdoc的招聘信息，然而很多招聘信息其实是无效的，因为美国的老板常常是已经有了postdoc的人选后，再放出招聘信息，来走一个程序。所以在nature上主要爬取放出postdoc位置的国家，看看目前哪个国家对postdoc的需求最旺盛。

![postdoc_coun.png](https://i.loli.net/2020/02/10/f41WmVl9onLURjK.png)

毫无疑问还是美国。然而其实这里的数据有一点问题，因为招聘postdoc并不是仅有nature
这一个渠道，然后欧美可能会更加倾向于在nature、science等杂志上发表招聘信息，而如中国则不会，所以数据源存在一定的偏见。

然后在science上看看招聘postdoc的学科都有哪些。

![postdoc_disc.png](https://i.loli.net/2020/02/10/FioMQB6yCnGsK7J.png)

果然生命科学仍是最大赢家。前十里面有九个都跟生命科学有关，唯一一个physical sciences恐怕也会和biology有诸多交叉。

## 结论

这篇文章的内容只是一个简单的爬虫应用，结果似乎告诉了我们找university of Copenhagen的life science的postdoc是最优的结果。

然而大学排名的数据是来自于国内的网站，它的排名是否权威尚待商榷。nature、science上的postdoc信息也并不全面。

人的一生当然要靠自我奋斗，当然也要考虑历史的进程，而个人的发展和学校有关，但也不完全取决于学校。

### 相关代码

```python
### crawler for university
import requests
from bs4 import BeautifulSoup
import pandas as pd
import numpy as np
import re

def crawler(url):
    info = []
    r = requests.get(url)
    r.encoding = "utf-8"
    web = BeautifulSoup(r.text, 'html.parser')
    for tr in web.tbody('tr', limit=100): # university of top 100
        tds = tr('td')
        _t = tds[1].a.get('href')
        name = re.findall(r'/(.+).html', _t)[0]
        info.append(
            [
                name,
                float(tds[4].string),
                float(tds[5].string),
                float(tds[6].string),
                float(tds[7].string),
                float(tds[8].string),
                float(tds[9].string),
                float(tds[10].string)
            ]
        )
    return info

def wash(info, data):
    temp = pd.DataFrame(info, columns=['univ', 'total', 'alumni', 'teaching', 'cited', 'N&S', 'international', 'avg'])
    data = data.append(temp)
    return data

data = pd.DataFrame()
for year in 2005+np.arange(15):
    url = "http://www.zuihaodaxue.com/ARWU"+str(year)+".html"
    _data = pd.DataFrame()
    info = crawler(url)
    _d = wash(info, _data)
    _d['year'] = year
    data = data.append(_d)
    print('data of '+str(year))

# replace alternative name of university
data.loc[data['univ']=='The-Johns-Hopkins-University','univ'] = 'Johns-Hopkins-University'
data.loc[data['univ']=='Washington-University-in-St.-Louis','univ'] = 'Washington-University-in-St-Louis'
data.loc[data['univ']=='The-Imperial-College-of-Science-Technology-and-Medicine','univ'] = 'Imperial-College-London'
data.loc[data['univ']=='University-of-Wisconsin---Madison','univ'] = 'University-of-Wisconsin-Madison'
data.to_pickle('./univ_data.pk1')
```

```python
# crawler for postdoc countries in Nature
from bs4 import BeautifulSoup
import requests
import pandas as pd
from time import sleep

URL = 'https://www.nature.com/naturecareers/jobs/science-jobs?location_range=25&sort=newest&page=1'
PAGES = 66
data = pd.DataFrame()
seen = set()

def get_data(url):
    global seen
    _d = pd.DataFrame()
    web = BeautifulSoup(requests.get(url).text, 'html.parser')
    for div in web('div', class_='p-card__info'):
        title = str(div.h3.string).lower()
        link = div.h3.a.get('href')
        if link not in seen:
            seen.add(link)
            if title.find('postdoc')+1 or title.find('doctoral')+1:
                location = str(div.select('p.p-card__info-location')[0].get_text())
                location_ = location[::-1]
                _loc = location_.find(',')
                country = location_[:_loc][::-1]
                city = location_[_loc:][::-1][:-1]
                institute = str(div.select('p.p-card__info-subtitle')[0].get_text())

                _temp = pd.DataFrame({
                    'coun':[country],
                    'city':[city],
                    'inst':[institute],
                    'link':link
                })

                _d = _d.append(_temp, ignore_index=True)
    return _d

for i in range(PAGES):
    print(URL)
    sleep(1)
    _data = get_data(URL)
    data = data.append(_data, ignore_index=True)
    URL = 'https://www.nature.com/naturecareers/jobs/science-jobs?location_range=25&sort=newest&page='+str(i+2)

data.to_pickle('./postdoc_data.pk1')
```

```python
# crawler for postdoc disciplines of science
from bs4 import BeautifulSoup
import requests
import pandas as pd
from time import sleep
import re

URL = 'https://jobs.sciencecareers.org'
PAGES = 10
seen = set()
data = pd.DataFrame()

def get_data(url):
    global seen
    global URL
    _d = []
    jobs = BeautifulSoup(requests.get(URL+url).text, 'html.parser')
    for p in jobs('p', class_='lister__view-details'):
        link = p.a.get('href')
        link = re.search(u'/(.*)/', link).group()
        print(link)
        if link not in seen:
            seen.add(link)
            URL_job = URL+str(link)
            sleep(1)
            try:
                job = BeautifulSoup(requests.get(URL_job).text, 'html.parser')
            except requests.ConnectionError:
                print('\nConnectionError')
                print(link)
                sleep(2)
                try:
                    job = BeautifulSoup(requests.get(URL_job).text, 'html.parser')
                except requests.ConnectionError:
                    print('\nConnectionError')
                    print(link)
                    sleep(2)
                    try:
                        job = BeautifulSoup(requests.get(URL_job).text, 'html.parser')
                    except requests.ConnectionError:
                        print('pass')
                        continue
            aList = job.select('div.job-detail-description__category-Discipline')[0].dd('a')
            for a in aList:
                _d.append(a.string.lower())

    return _d

URL_jobs_pre = '/jobs/postdoc/'
for i in range(PAGES):
    URL_jobs = URL_jobs_pre + str(i+1)
    d = get_data(URL_jobs)
    data_ = pd.DataFrame(d, columns=['disc'])
    data = data.append(data_, ignore_index=True)

data.to_pickle('./postdoc_data_S.pk1')
```
