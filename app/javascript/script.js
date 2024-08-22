$(document).on('turbolinks:load', function() {
  $(function() {
    $('#scroll-top-btn a').on('click',function(event){
      $('body, html').animate({
        scrollTop:0
      }, 800);
      event.preventDefault();
    });
  });
});

$(document).on('turbolinks:load', function() {
  $(function() {
    $('#page-reload-btn a').on('click',function(event){
      $('body, html').location.reload();
    });
  });
});