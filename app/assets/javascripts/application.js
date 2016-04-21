// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

//profile's toggle raido checkbox
    function FWclickYes()
    {
        $('#FWcheckbox').show();
    }
    function FWclickNo()
    {
        $('#FWcheckbox').hide();
    } 
    function RCclickYes()
    {
        $('#RCcheckbox').show();
    }
    function RCclickNo()
    {
        $('#RCcheckbox').hide();
    }
     function CWclickYes()
    {
        $('#CWcheckbox').show();
    }
    function CWclickNo()
    {
        $('#CWcheckbox').hide();
    }
     function FCclickYes()
    {
        $('#FCcheckbox').show();
    }
    function FCclickNo()
    {
        $('#FCcheckbox').hide();
    }
    function NAclickYes()
    {
        $('#NAcheckbox').show();
    }
    function NAclickNo()
    {
        $('#NAcheckbox').hide();
    }

    $(document).ready(){ 
    $('a[data-popup]').on('click', function(e) { window.open($(this).attr('href')); e.preventDefault(); });
     });
