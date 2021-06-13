var settings = {
		entries: entries,
		width: 480,
		height: 480,
		radius: '65%',
		radiusMin: 75,
		bgDraw: false,
		bgColor: '#fff',
		opacityOver: 1.00,
		opacityOut: 0.05,
		opacitySpeed: 6,
		fov: 800,
		speed: 1,
		fontFamily: 'Oswald, Arial, sans-serif',
		fontSize: '15',
		fontColor: '#111',
		fontWeight: 'normal', //bold
		fontStyle: 'normal', //italic 
		fontStretch: 'normal', //wider, narrower, ultra-condensed, extra-condensed, condensed, semi-condensed, semi-expanded, expanded, extra-expanded, ultra-expanded
		fontToUpperCase: false,
		tooltipFontFamily: 'Oswald, Arial, sans-serif',
		tooltipFontSize: '11',
		tooltipFontColor: '#fff',
		tooltipFontWeight: 'normal', //bold
		tooltipFontStyle: 'normal', //italic 
		tooltipFontStretch: 'normal', //wider, narrower, ultra-condensed, extra-condensed, condensed, semi-condensed, semi-expanded, expanded, extra-expanded, ultra-expanded
		tooltipFontToUpperCase: false,
		tooltipTextAnchor: 'left',
		tooltipDiffX: 0,
		tooltipDiffY: 10
};

$('#wordcloud').svg3DTagCloud(settings);
