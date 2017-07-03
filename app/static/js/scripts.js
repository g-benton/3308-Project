var sheepHead = document.getElementById("sheep-eating-head");

TweenMax.to(
  sheepHead,
  4.8,
  {
    y: '20px',
    rotation: -40,
    transformOrigin: 'center center',
    yoyo: true,
    ease: Power1.easeInOut,
    repeat: -1
  }
)