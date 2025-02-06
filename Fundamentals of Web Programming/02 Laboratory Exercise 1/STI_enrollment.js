var video = document.getElementById("enrollmentVid");
var viewer = document.getElementById("viewer");

document.getElementById("playbutton").onclick = function() {
    viewer.style.display = "flex";
}

document.getElementById("closeViewer").onclick = function() {
    viewer.style.display = "none";

    video.pause();
    video.currentTime = 0;
}