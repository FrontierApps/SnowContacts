if (history && history.pushState){
  $(function(){
   $('body').on('click', 'a', function(e){
      $.getScript(this.href);
      history.pushState(null, '', this.href);
    });
    $(window).bind("popstate", function(){
      $.getScript(location.href);
    });
  });
}