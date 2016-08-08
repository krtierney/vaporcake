$(document).on('turbolinks:load', function () {
  $("textarea").each(function () {
    this.style.height = (this.scrollHeight)+'px';
  });

  $('.autosize').keyup(autoresize.bind(this));
});

function autoresize() {
  this.style.height = '0px';     //Reset height, so that it not only grows but also shrinks
  this.style.height = (this.scrollHeight) + 'px';    //Set new height
}