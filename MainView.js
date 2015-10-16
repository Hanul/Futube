var Observable = require("FuseJS/Observable");
var Secure = require("Secure");

var pages = Observable();

var mainPage = {title: "Futube", handle: "pagesList", isShowingSearchBox : false};

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

var searchText = '';

function setSearchText(args) {
    searchText = args.value;
};

function search() {

    pages.clear();

    if (searchText === '') {

        fetch('https://www.googleapis.com/youtube/v3/videos?chart=mostPopular&key=' + Secure.youtubeKey + '&part=snippet&maxResults=10', {
            headers: { "Content-type": "application/json"}
        }).then(function(response) {
            return response.json();    // This returns a promise
        }).then(function(responseObject) {
            if (responseObject.error === undefined) {
                responseObject.items.forEach(function(itemInfo, i) {
                    if (itemInfo.kind === 'youtube#video') {
                        pages.add({
                            duration : 0.5 + i * 0.1,
                            title: itemInfo.snippet.title.length > 48 ? itemInfo.snippet.title.substring(0, 46) + '...' : itemInfo.snippet.title,
                            description: itemInfo.snippet.description,
                            channelTitle: itemInfo.snippet.channelTitle,
                            handle: itemInfo.id,
                            thumbnail: itemInfo.snippet.thumbnails.medium.url
                        });
                    }
                });
            }
        }).catch(function(err) {
            // An error occured parsing Json
        });
    }

    else {
        fetch('https://www.googleapis.com/youtube/v3/search?q=' + searchText + '&key=' + Secure.youtubeKey + '&part=snippet&maxResults=10', {
            headers: { "Content-type": "application/json"}
        }).then(function(response) {
            return response.json();    // This returns a promise
        }).then(function(responseObject) {
            if (responseObject.error === undefined) {
                responseObject.items.forEach(function(itemInfo, i) {
                    if (itemInfo.id.kind === 'youtube#video') {
                        pages.add({
                            duration : 0.5 + i * 0.1,
                            title: itemInfo.snippet.title.length > 48 ? itemInfo.snippet.title.substring(0, 46) + '...' : itemInfo.snippet.title,
                            description: itemInfo.snippet.description,
                            channelTitle: itemInfo.snippet.channelTitle,
                            handle: itemInfo.id.videoId,
                            thumbnail: itemInfo.snippet.thumbnails.medium.url
                        });
                    }
                });
            }
        }).catch(function(err) {
            // An error occured parsing Json
        });
    }
};

search();

module.exports = {
	pages : pages,
	currentPage : currentPage,
	currentPageHandle : currentPageHandle,
	currentPageTitle : currentPageTitle,
	pageButtonClicked : pageButtonClicked,
	goBack : goBack,
    setSearchText : setSearchText,
    search : search
};
