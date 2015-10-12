var Observable = require("FuseJS/Observable");

var pages = Observable();

var mainPage = {title: "Futube", handle: "pagesList"};

var currentPage = Observable(mainPage);

var currentPageHandle = currentPage.map(function(x){
	return x.handle;
});

var currentPageTitle = currentPage.map(function(x){
	return x.title;
});

function pageButtonClicked(arg){
	currentPage.value = arg.data;
}

function goBack(arg){
	currentPage.value = mainPage;
}

fetch('https://www.googleapis.com/youtube/v3/videos?chart=mostPopular&key=AIzaSyDiS2hKjwlVrazb-8io3-z609XHF3Rwa5o&part=snippet,contentDetails,statistics,status', {
    headers: { "Content-type": "application/json"}
}).then(function(response) {
    return response.json();    // This returns a promise
}).then(function(responseObject) {
    if (responseObject.error === undefined) {
    	responseObject.items.forEach(function(itemInfo) {
    		if (itemInfo.kind === 'youtube#video') {
    			pages.add({title: itemInfo.snippet.title, handle: itemInfo.id, thumbnail: itemInfo.snippet.thumbnails.medium.url});
    		}
    	});
    }
}).catch(function(err) {
    // An error occured parsing Json
});

module.exports = {
	pages: pages,
	currentPage: currentPage,
	currentPageHandle: currentPageHandle,
	currentPageTitle: currentPageTitle,
	pageButtonClicked: pageButtonClicked,
	goBack: goBack
};

