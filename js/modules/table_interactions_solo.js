import {data} from "./data.js";
import {createSoloTimeline} from "./table_create_solo.js";
import {restoreTable, scrollToContent} from "./table_interactions_standard.js";
import {convertSecondsToDuration, getTimeDelta} from "./date_operations.js";
import {setSoloTimeGraph} from "./table_create_graph.js";

export function soloListener() {
    $('.z_open_full').on('click', function () {
        jQuery(this).tooltip('hide');
        $('.tooltip').remove();
        jQuery(this).html('<i class="fa fa-spinner fa-pulse"></i>');//'<div class="lds-dual-ring-mini"></div>');

        createSoloTimeline(jQuery(this).attr('id'));
    });
}

export function removeSoloListener() {
    $('#z_solo_close').on('click', function () {
        $('*').tooltip('hide');
        removeSoloTimeline();//jQuery(this).attr('id').split(/(?<=[a-z])(?=\d+?)/)[1]);
    })
}

export function removeSoloTimeline() {
    $('#z_panel_container_solo').remove();
    $(`#solo_timeline${data.table.type.split(/(?<=[a-z])(?=\d+?)/)[1]}`).remove();

    restoreTable();

    $('#z_panel_container_main, #z_table_wrapper_main').attr('style', '');
}

/*
 */

export function soloTimeGraphListener() {
    $('.z_solo_stats_open').on('click', function() {
        setSoloTimeGraph(jQuery(this));
        $('.step-circle').tooltip();
    });
}

export function setSoloEventCanvas(index, rowID = '') {
    $(`#z_row${rowID}${index + 1}`).append(
        `<div id="z${(data.table.type === 'standard') ? '' : '_solo'}_canvas_row${rowID}${index + 1}" class="z${(data.table.type === 'standard') ? '_main' : '_solo'}_canvas_row">
                <div class="z_first" style="visibility: hidden"></div>
            </div>`
    );
}

export function updateSPBListener() {
    let soloTable = document.getElementById('z_table_wrapper_solo');

    soloTable.addEventListener("scroll", event => {
        updateSoloProgressBar(event.target);
    });
}
export function updateSoloProgressBar(el) {
    let scrolled = ((el.scrollLeft) / (el.scrollWidth - 1100)) * 100; //1100 is table width minus y-scroll width
    $("#z_solo_progress_bar").css('left', `calc(${scrolled}% - ${scrolled / 100 * (16 + 4)}px)`); //16 is bar width, 4 is container: left
}

/*
 */

export function soloPassingLineListener() {
    $('.z_solo_pb_el').on('click', function () {
        data.table.scrollTo.target = jQuery(this).data('target');
        //data.js.table.scrollTo.block = 'center';
        scrollToContent();
        blinkBackground($(`#${jQuery(this).data('target')}`), '#ffd8d5', 3, 500);
    });
    $('.z_row_solo').on('mouseenter', function() {
        let el = jQuery(this);
        let bar = $('#z_solo_progress_location');

        /*bar.css({
            display: 'flex',
            left: el.data.js('from') + '%',
            width: el.data.js('len') + '%'
        });*/
        if (el.data('target') === undefined) {
            $('#z_solo_progress_location').css({
                display: 'flex',
                left: el.data('from') + '%',
                width: el.data('len') + '%'
            });
            return;
        }

        let target = $(`#${el.data('target')}`);

        bar.css({
            display: 'flex',
            left: target.attr('style').match(/left:.*?;/)[0].split(':')[1].slice(0, -1),
            width: target.attr('style').match(/width:.*?;/)[0].split(':')[1].slice(0, -1)
        });

        target.addClass('z_solo_pb_el_active');
    }).on('mouseleave', function() {
        let el = jQuery(this);
        $('#z_solo_progress_location').css({
            display: 'none'
        });
        if (el.data('target') === undefined)
            return;

        $(`#${el.data('target')}`).removeClass('z_solo_pb_el_active');
    });
}

export function setSoloFilterListener() {
    $('.z_solo_filter_item').on('click', function () {
        let el = jQuery(this);
        el.toggleClass('active');

        let parent = $('#filter_frs');
        let list = parent.children('.dropdown-menu').children('.active');

        if (list.length === 0)
            parent.removeClass('active');
        else if (!parent.hasClass('active'))
            parent.addClass('active');

        el.children().toggleClass('fa-check-circle fa-times-circle');
        $(`#z_show_${data.table.type}`).toggleClass(`no_${el.attr('data-type')}`);
    });
    $('.z_solo_filter_clear').on('click', function () {
        $('.z_solo_filter_item.active').trigger('click');
    });
}