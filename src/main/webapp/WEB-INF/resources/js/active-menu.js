
jQuery(document).ready(function ($) {

    var path = window.location.pathname.split("/").pop();

    if (path == ''){
        path = 'index.jsp';
    }

    var taget = $('nav a[href="'+path+'"]');
    taget.addClass("active-menu");
});