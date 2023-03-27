import {data} from "./data.js";
import {getDaysInMonth} from "./date_operations.js";

function calcDateOffset(year, month, day) {

    if (typeof year === 'string' && year.length === 2)
        year = '20' + year;
    year = parseInt(year);
    month = parseInt(month);
    day = parseInt(day);

    if (data.table.type === 'standard')
        return (data.standardDayWidth + 1/*table gap*/) * ((data.table.dateType === 'month') ? day - 1 : month - 1) + (data.standardDayWidth/* - data.js.mainEventWidth*/) / 2;

    if (data.table.startingMonth === undefined)
        return;

    year -= parseInt(data.table.year);


    month = month + year * data.const.MONTH_MAX - (data.table.startingMonth - 1);
    let daysAmount = day;
    for (let i = 0; i < month - 1; i++)
        daysAmount += getDaysInMonth(year, (i + data.table.startingMonth - 1) % data.const.MONTH_MAX);

    return data.soloDayWidth * (daysAmount - 1) + month;
}

function elementIsVisible(el) {
    el = jQuery(el);

    let elementTop = el.offset().top;
    let elementBottom = elementTop + el.outerHeight();

    let viewportTop = $(window).scrollTop();
    let viewportBottom = viewportTop + $(window).height();

    return (elementBottom > viewportTop && elementTop < viewportBottom);
}

function fullsizeListener() {
    $('.zal-fullscreen #eventResize').on('click', function(){
        $('#table_stat').addClass('fullscreen');
        openFullscreen();
    });
    $('.zal-fullscreen #eventSmall').on('click', function(){
        $('#table_stat').removeClass('fullscreen');
        closeFullscreen();
    });
}

export {calcDateOffset, elementIsVisible, fullsizeListener};