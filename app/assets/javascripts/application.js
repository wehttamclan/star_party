//= require jquery
//= require jquery_ujs
//= require_tree .

// var iframes = document.getElementsByTagName('iframe');
// var iframe = iframes[0];
// // var videoRatio = (iframe.height / iframe.width) * 100;
// iframe.style.position = 'absolute';
// iframe.style.top = '0';
// iframe.style.left = '0';
// iframe.width = '100%';
// iframe.height = '100%';

// var wrap = document.createElement('div');
// wrap.className = 'fluid-vids';
// wrap.style.width = '100%';
// wrap.style.position = 'fixed';
// wrap.style.top = 0;
// wrap.style.right = 0;
// wrap.style.bottom = 0;
// wrap.style.left = 0;
// wrap.style.zIndex = -99;
// // wrap.style.paddingTop = videoRatio + '%';

// var iframeParent = iframe.parentNode;
// iframeParent.insertBefore(wrap, iframe);
// wrap.appendChild(iframe);

var tag = document.createElement('script');
tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

var player;
function onYouTubeIframeAPIReady() {
  player = new YT.Player('player', {
    videoId: 'my1euFQHH-o',
    playerVars: {
      'autoplay': 1,
      'controls': 0,
      'rel': 0
    },
    events: {
      'onReady': onPlayerReady,
      'onStateChange': onPlayerStateChange
    }
  });
}

function onPlayerReady(event) {
  event.target.playVideo();
}

var done = false;
function onPlayerStateChange(event) {
  if (event.data == YT.PlayerState.PLAYING && !done) {
    setTimeout(restartVideo, videoDuration());
  }
}

function videoDuration() {
  return 1000 * player.getDuration();
}

function restartVideo() {
  player.seekTo(0);
}

