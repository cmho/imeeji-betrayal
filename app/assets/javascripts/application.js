// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3.min
//= require_tree .

$('#reset-locations').on('click', function(e) {
    var run = parseInt($(this).data('run'));
    $.ajax({
        url: '/reset_locations',
        method: 'POST',
        data: {
            run_id: run
        },
        success: function(data) {
            location.reload(true);
        }
    });
});

$('#reset-traitors').on('click', function(e) {
    var run = parseInt($(this).data('run'));
    $.ajax({
        url: '/reset_traitors',
        method: 'POST',
        data: {
            run_id: run
        },
        success: function(data) {
            location.reload(true);
        }
    });
});

$('body').on('click', '.location-links a', function(e) {
    e.preventDefault();
    var char_id = parseInt($(this).data('char'));
    var loc_id = parseInt($(this).data('new-loc'));
    var clicked = $(this);
    $.ajax({
        url: '/update_location',
        method: 'POST',
        data: {
            char_id: char_id,
            loc_id: loc_id
        },
        success: function(data) {
            clicked.parents('.location-content').html(data);
        }
    });
});

$('.mod-form form').on('submit', function(e) {
    e.preventDefault();
    var stats = $(this).parent().prev('.stats');
    var char = $(this).parents('.char-content');
    var char_id = parseInt($(this).parents('.char-content').data('char'));
    var spd_mod = parseInt($(this).find("[name='speed']").val());
    var san_mod = parseInt($(this).find("[name='sanity']").val());
    var mgt_mod = parseInt($(this).find("[name='might']").val());
    var kno_mod = parseInt($(this).find("[name='knowledge']").val());
    $.ajax({
        url: '/modify_stats',
        method: 'POST',
        data: {
            char_id: char_id,
            spd_mod: spd_mod,
            san_mod: san_mod,
            mgt_mod: mgt_mod,
            kno_mod: kno_mod
        },
        success: function(data) {
            stats.html(data.stats_output);
            if (data.is_traitor) {
                char.find('h3').append(" 😈");
                char.find('.traitor-menu').show();
            }
        }
    });
});

$('.add-form form').on('submit', function(e) {
    e.preventDefault();
    var name = $(this).find('[name="name"]').val();
    var desc = $(this).find('[name="desc"]').val();
    var id = parseInt($(this).parents('.char-content').data('char'));
    var $items = $(this).parents('.char-content').find('.items');
    var $form = $(this);
    $.ajax({
        url: '/add_item',
        method: 'POST',
        data: {
            char_id: id,
            name: name,
            desc: desc
        },
        success: function(data) {
            $items.append(data);
            $(this).find('input, textarea').val("");
            $(this).parents('.add-form').slideUp();
        }
    });
});

$('.add-open').on('click', function(e) {
    $(this).parent().next('.add-form').slideDown();
});

$('body').on('click', '.discard', function(e) {
    e.preventDefault();
    var item = parseInt($(this).data('item'));
    var $i = $(this).parents('li');
    $.ajax({
        url: '/discard_item',
        method: 'POST',
        data: {
            item: item
        },
        success: function(data) {
            $i.detach();
        }
    });
});

$('select[name="location"]').on('change', function() {
    var loc_id = parseInt($(this).val());
    var char_id = parseInt($(this).parents('.char-content').data('char'));
    var location_content = $(this).parents('.char-content').find('.location-content');
    $.ajax({
        url: '/update_location',
        method: 'POST',
        data: {
            char_id: char_id,
            loc_id: loc_id
        },
        success: function (data) {
            location_content.html(data);
        }
    });
});

