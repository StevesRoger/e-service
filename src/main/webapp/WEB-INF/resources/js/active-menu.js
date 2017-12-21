
jQuery(document).ready(function ($) {

    var path = window.location.pathname.split("/").pop();

    if (path == ''){
        path = 'index.jsp';
    }

    var target = $('nav a[href="'+path+'"]');
    target.addClass("active-menu");

    if (path == 'wed-customer'){
        $('ul.nav.nav-second-level.collapse.in').attr('aria-expanded','true');
    }
});