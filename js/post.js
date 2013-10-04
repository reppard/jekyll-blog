$('.excerpt').hide();

$('li').click(function(){
  $(this).next('.excerpt').toggle(function(){
    
  });
});
