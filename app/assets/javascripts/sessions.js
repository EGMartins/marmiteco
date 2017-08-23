  $( document ).ready(function() {
    setTimeout(function() {
      $('#notice-wrapper').fadeOut("slow", function() {
        $(this).remove();
      })
    }, 3000);
  });
  
