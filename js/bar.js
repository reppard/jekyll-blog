var darkColors = Array('#000000','#0000AA','#00AA00','#00AAAA','#AA0000','#AA00AA','#AA5500','#AAAAAA')

var lightColors = Array('#555555','#5555FF','#55FF55','#55FFFF','#FF5555','#FF55FF','#FFFF55','#FFFFFF')

for(i=0;i<8;i++){
  $('.dark-color-bar').append('<div class="dark-color-box" style="background-color:'+darkColors[i]+'"></div>');
}

for(i=0;i<8;i++){
  $('.light-color-bar').append('<div class="light-color-box" style="background-color:'+lightColors[i]+'"></div>');
}
