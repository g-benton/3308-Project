$('.button').click(function(){
  $('.photo-wrap').addClass('love');
  $('.photo').addClass('match');

  
setTimeout(function () { 
  $('.photo').removeClass('match');
  $('.photo-wrap').removeClass('love');
}, 2000);
});