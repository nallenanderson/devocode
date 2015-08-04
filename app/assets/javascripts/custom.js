$(function() {
  $('#right-menu').sidr({
    name: 'sidr-right',
    side: 'right'
  });
});

$(function() {
    $('#blogs').change(function(){
        var criteria = $(this).val();
        if(criteria == 'ALL'){
            $('.blog').show();
            return;
        }
        $('.spec').each(function(i,option){
            if($(this).html() == criteria){
                $(this).parent().fadeIn(1000);
            }else {
                $(this).parent().fadeOut(1000);
            }
        });
    });
})

$(function() {
  $('.page-scroll').click(function() {
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
      if (target.length) {
        $('html,body').animate({
          scrollTop: target.offset().top
        }, 1100);
        return false;
      }
    }
  });
});