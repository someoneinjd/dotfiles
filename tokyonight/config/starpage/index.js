function preZero(number) {
    var numStringLen = number.toString().length;
    if (numStringLen < 2) {
        return "0" + number;
    } else {
        return number;
    }
}


function setClocks(){
    var now = new Date();
    var id = "clock";
    var hours = preZero(now.getHours());
    var minutes = preZero(now.getMinutes());

    document.getElementById(id).innerHTML = `${hours}:${minutes}`;
    setInterval(setClocks, 10000); // this should be 10 seconds
}

setClocks();

var inputVal = document.getElementById("searchBar");
console.log(inputVal);
inputVal.addEventListener("keydown", function (e) {
    if (e.code === "Enter") {
        console.log("Enter");
        redirectSearch(e);
    }
});

function redirectSearch(e) {
    var query = e.target.value;
    var textValue = query.substring(3);
    console.log(textValue);
    if (query.startsWith("/g")) {
        redirectGoogle(textValue);
    } else if (query.startsWith("/b")){
        redirectBilibili(textValue);
    } else if (query.startsWith("/r")) {
        redirectReddit(textValue);
    } else if (query.startsWith("/h")){
        redirectGithub(textValue);
    } else if (query.startsWith("/d")) {
        redirectBaidu(textValue);
    } else {
        redirectGoogle(textValue);
    }
}

function redirectGoogle(query) {
    if (query === "") {
        baseUrl = "https://www.google.com";
    } else {
        baseUrl = `https://www.google.com/search?q=${query}`;
    }
    window.location.replace(baseUrl);
}

function redirectBilibili(query) {
    if (query === "") {
        baseUrl = "https://www.bilibili.com"
    } else {
        baseUrl = `https://search.bilibili.com/all?keyword=${query}`;
    }
    window.location.replace(baseUrl);
}

function redirectReddit(query) {
    if (query === "") {
        baseUrl = "https://www.reddit.com";
    } else {
        baseUrl = `https://www.reddit.com/search?q=${query}`;
    }
    window.location.replace(baseUrl);
}

function redirectGithub(query) {
    if (query === "") {
        baseUrl = "https://github.com";
    } else {
        baseUrl = `https://github.com/search?q=${query}&ref=opensearch`;
    }
    window.location.replace(baseUrl);
}

document.getElementById("searchBar").focus();
document.getElementById("searchBar").select();
