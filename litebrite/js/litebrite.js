var currentColor = 'white';

for (var i=0; i<41; i++){
  $('#tables').append('<table><tbody><tr></tr></tbody></table>');
}

$('table > tbody > tr').each(function(){
  for (var i=0; i<41; i++){
    $(this).append('<td></td>');
  }
});

$('table:even').each(function(){
  $(this).find('tbody').find('tr').prepend('<td></td>');
});

$('li').each(function(){
    $(this).css("background",$(this).attr('class'));
});

$('li').click(function(){
  currentColor = $(this).attr('class');
});

$('td').click(function light (){
  $(this).css({background: currentColor, boxShadow: ''});
  if(currentColor != 'black'){
    $(this).css('box-shadow', 'inset white 0px -1px 7px 1px');
    $(this).attr('status', 'lit');
  }
});

function reset(){
  $('td').each(function(){
    $(this).css({background: 'black', boxShadow: ''});
    $(this).attr('status','');
    currentColor = 'white';
  });
};

function highLight(elm){
  if($(elm).attr('status') != 'lit'){
    $(elm).css('background', currentColor);
  }
};

function lowLight(elm){
  if($(elm).attr('status') != 'lit'){
    $(elm).css('background', 'black');
  }
};

$('.reset').click(function(){
  reset();
});

$('td').hover(function(){
  highLight(this) },
  function(){ lowLight(this);
});
