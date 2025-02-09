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

function smoothParallax() {
    let rect = thumbnail.getBoundingClientRect(); // Get position relative to viewport
    let offset = rect.top * -0.4; // Adjust speed by changing multiplier

    // Apply background movement only when the div is visible
    if (rect.top < window.innerHeight && rect.bottom > 0) {
        thumbnail.style.backgroundPosition = `center ${offset}px`;
    }

    requestAnimationFrame(smoothParallax);
}

// Start the loop
smoothParallax();