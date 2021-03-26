var ready = function() {
  $('img.expand').click(function(_e){
    let current = $(this).attr('src');
    let next = current.indexOf('expand') !== -1 ? imagePath('collapse.png') : imagePath('expand.png');
    $(this).attr({ src: next });
  });
};

$(document).ready(ready);
$(document).on('page:change', ready);