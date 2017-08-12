$(document).ready(function(){
  $('.parallax').parallax();
});

$(document).ready(function(){
 
  // hide our element on page load
  $('#section01').css('opacity', 0);
 
  $('#section01').waypoint(function() {
      $('#section01').addClass('fadeInLeft');
  }, { offset: '70%' });
 
});

$(document).ready(function(){
 
  // hide our element on page load
  $('#section02').css('opacity', 0);
 
  $('#section02').waypoint(function() {
      $('#section02').addClass('fadeInRight');
  }, { offset: '80%' });
 
});

$(document).ready(function(){
 
  // hide our element on page load
  $('#section03').css('opacity', 0);
 
  $('#section03').waypoint(function() {
      $('#section03').addClass('fadeInRight');
  }, { offset: '70%' });
 
});

$(document).ready(function(){
 
  // hide our element on page load
  $('#section04').css('opacity', 0);
 
  $('#section04').waypoint(function() {
      $('#section04').addClass('fadeInLeft');
  }, { offset: '80%' });
 
});

$(document).ready(function(){
 
  // hide our element on page load
  $('#my-card').css('opacity', 0);
 
  $('#my-card').waypoint(function() {
      $('#my-card').addClass('zoomInUp');
      $('#my-card').css('opacity', 100);
  }, { offset: '90%' });
  
 
});

$(document).ready(function(){
 
  // hide our element on page load
  $('#my-card02').css('opacity', 0);
 
  $('#my-card02').waypoint(function() {
      $('#my-card02').addClass('zoomInUp');
      $('#my-card02').css('opacity', 100);
  }, { offset: '90%' });
  
 
});

$(document).ready(function(){
 
  // hide our element on page load
  $('#my-card03').css('opacity', 0);
 
  $('#my-card03').waypoint(function() {
      $('#my-card03').addClass('zoomInUp');
      $('#my-card03').css('opacity', 100);
  }, { offset: '90%' });
  
 
});
