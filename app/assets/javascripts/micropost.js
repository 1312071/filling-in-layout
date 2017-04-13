$(document).ready(function(){
  $('#micropost_picture').bind('change', function() {
    var size_in_megabytes = this.files[0].size/1024/1024;
    var size = $('.picture').data('psize');
    if (size_in_megabytes > size) {
      alert( I18n.t("micropost.alert.maximum_size"));
    }
  });
});
