// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap
//= require_tree
//= require jquery.raty
//= require ratyrate
//= require turbolinks

$(document).on('turbolinks:load', function(e) {
    new WOW().init();

    // JS Top travel
    body = $( document.body );
    var fvn = function(){};
    fvn.prototype.init = function() {
        this.owlClient = jQuery(".owl-client");
        this.bindEvents();
    };
    fvn.prototype.bindEvents = function() {
        this.bindCarousel();
    };
    fvn.prototype.bindCarousel = function() {
        var self = this;

        // owl carousle Client
        self.owlClient.each(function() {
            jQuery(this).owlCarousel({
                singleItem: false,
                items: 5,
                itemsDesktop: [1400,4],
                itemsTablet: [799,4],
                itemsTabletSmall: [768,3],
                itemsMobile: [480,2],
                pagination: true,
                navigation: false,
                navigationText: false,
                autoPlay: true,
                slideSpeed: 100,
                paginationSpeed: 400
            });
        });
    };
    var appObj = new fvn();
    appObj.init();
    // end
});
// $(document).on('turbolinks:load', function () {
//     var jssor_options = {
//       $AutoPlay: true,
//       $SlideDuration: 1000,
//       $SlideEasing: $Jease$.$OutQuint,
//       $BulletNavigatorOptions: {
//         $Class: $JssorBulletNavigator$,
//         $SpacingX: 35,
//         $Orientation: 1,
//       },
//       $ArrowNavigatorOptions: {
//         $Class: $JssorArrowNavigator$
//       },
//     };

//     var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_options);
//     var loca_slider = new $JssorSlider$("loca-slider", jssor_options);
//     function ScaleSlider() {
//         var refSize = jssor_1_slider.$Elmt.parentNode.clientWidth;
//         if (refSize) {
//             refSize = Math.min(refSize, 1920);
//             jssor_1_slider.$ScaleWidth(refSize);
//             console.log(refSize);
//         }
//         else {
//             window.setTimeout(ScaleSlider, 30);
//         }
        
//         var parentSize = loca_slider.$Elmt.parentNode.clientWidth - 30;
//         if (parentSize) {
//             parentSize = Math.min(parentSize, 1920);
//             loca_slider.$ScaleWidth(parentSize);
//             console.log(parentSize);
//         }
//         else {
//             window.setTimeout(ScaleSlider, 30);
//         }
//     }
//     ScaleSlider();
//     $(window).bind("load", ScaleSlider);
//     $(window).bind("resize", ScaleSlider);
//     $(window).bind("orientationchange", ScaleSlider);
// });
    