$(function() {
  $('scroll-top-btn a').on('click',function(event){
    $('body, html').animate({
    }, 800);
    event.preventDefault();
  });
});