
jQuery(document).ready(function ($) {

    var path = window.location.pathname.split("/").pop();

    if (path == ''){
        path = 'index.jsp';
    }

    var target = $('nav a[href="'+path+'"]');
    target.addClass("active-menu");

    switch (path) {
        case 'wed-customer':
        case 'warm-customer':
        case 'birth-customer':
        case 'ceremony-customer':
        case 'des-customer':
        case 'invoice-customer':
            $('.sidebar-collapse .nav-second-level').attr('aria-expanded', true).addClass('in');
            break;
    }
});