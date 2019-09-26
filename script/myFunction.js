hexo.extend.tag.register('img', function(args){
    const image_url = args[0], alt = args[1];
    return `<img src="${image_url}" alt="${alt}" referrerpolicy="no-referrer"></img>`
})
