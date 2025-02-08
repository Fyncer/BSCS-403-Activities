var video = document.getElementById("enrollmentVid");
var viewer = document.getElementById("viewer");

document.getElementById("playbutton").onclick = function() {
    document.body.classList.add("remove-scrolling"); 
    viewer.style.display = "flex"; 
   
    setTimeout(() => {
        viewer.classList.add("show");
    }, 50);
}

document.getElementById("closeViewer").onclick = function() {
    document.body.classList.remove("remove-scrolling");     

    viewer.classList.remove("show");
    viewer.classList.add("hide");

    setTimeout(() => {
        viewer.style.display = "none";
        viewer.classList.remove("hide")
    }, 500);

    video.pause();
    video.currentTime = 0;
}

window.addEventListener("scroll", function() {
    let thumbnail = document.getElementById("thumbnail");
    let scrollPosition = window.scrollY;
    thumbnail.style.backgroundPositionY = `${scrollPosition * 0.3}px`;
});
