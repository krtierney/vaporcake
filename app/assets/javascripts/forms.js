$(function () {
    $("textarea").each(function () {
        this.style.height = (this.scrollHeight)+'px';
    });
});

function autoresize(textarea) {
    textarea.style.height = '0px';     //Reset height, so that it not only grows but also shrinks
    textarea.style.height = (textarea.scrollHeight) + 'px';    //Set new height
}

$('.autosize').keyup(function () {
    autoresize(this);
});