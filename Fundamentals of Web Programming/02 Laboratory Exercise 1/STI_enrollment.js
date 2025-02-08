var video = document.getElementById("enrollmentVid");
var viewer = document.getElementById("viewer");

document.getElementById("playbutton").onclick = function() {
    document.body.classList.add("remove-scrolling"); 
    viewer.style.display = "flex";
    body.scroll
}

document.getElementById("closeViewer").onclick = function() {
    document.body.classList.remove("remove-scrolling");     
    viewer.style.display = "none";

    video.pause();
    video.currentTime = 0;
}