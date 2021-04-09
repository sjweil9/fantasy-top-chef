var ready = function() {
  $('[data-toggle="popover"]').popover();
};

$(document).ready(ready);
$(document).on('page:change', ready);