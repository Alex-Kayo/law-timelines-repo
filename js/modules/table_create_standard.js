import {data} from "./data.js";
import {calcDateOffset, fullsizeListener} from "./misc.js";
import {
    changeDateCurrentListener,
    changeDatePanelListener, changePageListener, changeTypeListener,
    closeAllEventsListener, filterByOptionListener,
    findLawByNumberListener, goToMonthListener,
    scrollToContent,
    scrollToEventListener, sortLawsListener, zEventListener, zRowArrowGoToListener
} from "./table_interactions_standard.js";
import {getDaysInMonth, getFirstDayOfMonth, getToday} from "./date_operations.js";
import {fetchMonthColors} from "./fetch.js";
import {
    setSoloEventCanvas, setSoloFilterListener,
    soloListener,
    soloPassingLineListener,
    soloTimeGraphListener
} from "./table_interactions_solo.js";
import {parseJsonDate} from "./parse_text.js";
import {
    processChronology, processCommittees,
    processDocuments,
    processPassings,
    setSoloChronologyFirst, setSoloCommitteeFirst,
    setSoloPassingsFirst, setSoloProgressBar, sortSoloRows
} from "./table_create_solo.js";
import {getStatusClass, getStepperClass} from "./get_class_regex.js";

export function setMainTable(parent = '#table_stat') {
    $('*').tooltip('hide');

    if (parent === 'standard')
        parent = '#table_stat';

    let result = '';

    result += `
        ${($('#z_panel_container_main').length === 0) ? `<div id="z_panel_container_main" class="z_panel_container">
            <div class="zal-fullscreen">
                <button id="eventResize" class="btn btn-sm btn-outline-secondary"><i class="fa fa-arrows-alt"></i> <span>Розгорнути</span></button>
                <button id="eventSmall" class="btn btn-sm btn-outline-secondary"><i class="fa fa-compress"></i> <span>Згорнути</span></button>
            </div>
        </div>` : ''}
        <div id="${(data.table.type.includes('solo')) ? `z_table_wrapper_solo` : 'z_table_wrapper_main'}" class="z_table_wrapper scroll-middle">
            <div id="${'z_cm_' + data.table.type}" class="z_container_main">
                <div id="${'z_show_' + data.table.type}" class="collapse show z_table"></div>
            </div>
        </div>
        `;

    $(parent).append(result);

    setTimeout(() => fullsizeListener(), 50);

    if (data.table.type.includes('solo')) {
        //setSoloDocuments();
    }

    if (data.table.type === 'standard') {
        setTableProps();

        setPages(data.table.pageCount);

        let eventClose = `
            <div class="z_event_close_container">
                <button class="z_event_close_all"><i class="fa fa-minus-square-o" aria-hidden="true"></i></button>
            </div>
        `;
        if (data.table.type === 'standard')
            $('#z_panel_container_main').prepend(eventClose);

        setFilter();
        setDateList();
    }

    /*
     */

    $('#z_filter_list .dropdown-menu').on('click', function (e) {
        e.stopPropagation();
    });

    $('#z_filter_list .z_dropdown_title').on('click', function () {
        let el = $(`[aria-labelledby=${jQuery(this).attr('id')}]`);
        el.toggleClass('show');
    });

    /*
     */

    if (data.table.type === 'standard') {
        if (data.currentPage === data.const.PAGE_MIN) $('#z_page_prev').prop('disabled', true);
        if (data.currentPage === data.table.pageCount) $('#z_page_next').prop('disabled', true);
    }

    setZTable();
    closeAllEventsListener();

    $('.dropdown-menu').on('click', function (e) {
        e.stopPropagation();
    });

    scrollToContent();
}

export function setTableProps() {
    if (data.table.type === 'standard') {
        data.table.eventsSet = [];
        data.table.periodCount = (data.table.dateType === 'month') ?
            getDaysInMonth(data.table.year, data.table.month) : 12;
        data.table.itemCount = data.const.PAGE_SIZE;
        if (data.table.dateType === 'month') {
            data.table.startingDay = getFirstDayOfMonth(data.table.year, data.table.month);
        }
    }

    if (data.table.type.includes('solo')) {
        if (data.table.lawSet.length !== 1)
            return ;
        data.soloLineCount = 1;

        let lawObj = data.table.lawSet[0];
        data.table.eventsSet = [];

        let date = lawObj.date_begin.split('T')[0].split('-');
        data.table.year = date[0];
        data.table.month = date[1];
        data.table.day = date[2];
        data.table.dateType = 'year';
        data.table.itemCount = data.const.PAGE_SIZE;
        data.table.startingDay = getFirstDayOfMonth(data.table.year, data.table.month);
        data.table.startingMonth = parseInt(date[1]);
        data.table.endingDate = lawObj.date_end.split('T')[0].split('-');
        data.table.periodCount = parseInt(data.table.endingDate[1]) - parseInt(data.table.month) + 1 + (parseInt(data.table.endingDate[0]) - parseInt(data.table.year)) * 12;
        if (data.table.periodCount < 3)
            data.table.periodCount = 3;
    }
}

/*
 */

export function setNav() {
    let result = '';

    let close = `</div>`;
    let rowOpen = `<div class="z_row calendar">`;

    let searchNumber = `
        <div class="z_search_number">
            <button class="btn btn-sm btn-outline-secondary" disabled><i class="fa fa-search"></i></button>
            <input id="filter-number" class="form-control" type="text" placeholder="Номер" pattern="\d{3,5}.*">
        </div>
    `;

    let title = `<div class="z_title">${(data.table.type === 'standard') ?
        '<div>Законопроекти</div>' + searchNumber :
        `<div>${data.table.lawSet[0].currentPhase.status}</div>
        <!--<div class="z_solo_filter">
            <div id="filter_frs" class="btn-group dropdown">
                <a class="btn btn-link btn-sm dropdown-toggle with-caret" href="javascript:void(0)" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-filter"></i><span class="d-none d-md-inline"> Фільтр</span></a>
                <div class="dropdown-menu dropdown-menu-right dropdown-sm" data-url="" style="will-change: transform;">
                    <a class="dropdown-header bold">Групи подій:</a>
                    <a class="dropdown-item filter z_solo_filter_item" data-type="documents" href="javascript:void(0)"><i class="fa fa-check-circle i_doc"></i> Документи</a>
                    <a class="dropdown-item filter z_solo_filter_item" data-type="chronology" href="javascript:void(0)"><i class="fa fa-check-circle i_chr"></i> Хронологія</a>
                    <a class="dropdown-item filter z_solo_filter_item" data-type="passings" href="javascript:void(0)"><i class="fa fa-check-circle i_pas"></i> Проходження</a>
                    <a class="dropdown-item filter z_solo_filter_item" data-type="committee" href="javascript:void(0)"><i class="fa fa-check-circle i_com"></i> Комітети</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item nofilter z_solo_filter_clear" href="javascript:void(0)">Очистити</a>
                </div>
            </div>
        </div>-->`}</div>`;

    let navElements = '';

    for (let i = 0; i < data.table.periodCount; i++) {
        if (data.table.type === 'standard') {
            let startingDay = getFirstDayOfMonth(data.table.year, data.table.month);
            navElements += `<a ${(data.table.type === 'standard' && data.table.dateType === 'year') ? 'href="javascript:void(0)"' : ''} id="z_nav_${('0' + (i + 1)).slice(-2)}" class="z_nav ${(data.table.dateType === 'month' || data.table.type.includes('solo')) ? ((i + startingDay) % 7 === 5 || (i + startingDay) % 7 === 6) ? 'z_nav_weekend' : '' : 'z_event_expand'} z_width_${data.table.dateType}">` +
                ((data.table.dateType === 'year') ? data.monthName[i % data.const.MONTH_MAX] :
                    (data.table.dateType === 'month') ?
                        data.dayNameShort[(data.table.startingDay + i) % data.const.DAY_MAX] + ', ' + (i + 1).toString() :
                        '') + '</a>';
        } else if (data.table.type.includes('solo')) {
            let monthIndex = (data.table.startingMonth + i - 1) % data.const.MONTH_MAX;
            navElements += `<div id="z_solo_nav${i + 1}" class="z_nav" 
            style="${`width:${(data.soloDayWidth * getDaysInMonth(data.table.year, monthIndex + 1))}px`}">` +
                data.monthName[monthIndex] + `, ${parseInt(data.table.year) + Math.floor((data.table.startingMonth + i - 1) / data.const.MONTH_MAX)}` + close;
        }
    }

    let placeholder = '<div class="z_table_main_placeholder"><div class="z_tm_p_inner"></div></div>';

    result = rowOpen + title + navElements + placeholder + close;

    $('#z_show_' + data.table.type).append(result);
    findLawByNumberListener();

    if (data.table.type === 'standard' && data.table.dateType === 'month')
        fetchMonthColors(`${data.table.year}${data.table.month}`);
}

/*
 */

export function setZTable() {

    setTableProps();
    setNav();

    if (data.table.type === 'standard') {
        let start = (data.currentPage - 1) * data.const.PAGE_SIZE;
        let end = (data.currentPage !== data.table.pageCount && data.currentPage * data.const.PAGE_SIZE < data.table.lawSet.length) ?
            data.currentPage * data.const.PAGE_SIZE : data.table.lawSet.length;

        for (; start < end; start++) {
            addZRow(data.table.lawSet[start], start % data.const.PAGE_SIZE);
            setSoloEventCanvas(start % data.const.PAGE_SIZE);
            setFirstInfo(data.table.lawSet[start], start % data.const.PAGE_SIZE);
            calcZEventsArray(data.table.lawSet[start]);
            addZEvents(data.table.lawSet[start], start % data.const.PAGE_SIZE);
        }

        let leftEdgeEvents = Object.values($('.z_event:first-of-type')).slice(0, -2);
        let rightEdgeEvents = Object.values($('.z_event:last-of-type')).slice(0, -2);
        leftEdgeEvents.forEach(el => {
            let event = jQuery(el);
            if (parseInt(event.css('margin-left')) === data.firstWidth + data.standardDayWidth / 2)
                $('#' + event.attr('id')).popover({container: '#z_show_standard', placement: 'right', sanitize: false});
        });
        rightEdgeEvents.forEach(el => {
            let event = jQuery(el);
            if (parseInt(event.css('margin-left')) === data.firstWidth + data.standardDayWidth * (data.table.periodCount - 1) + data.standardDayWidth / 2 + data.table.periodCount - 1)
                $('#' + event.attr('id')).popover({container: '#z_show_standard', placement: 'right', sanitize: false});
        });

        /*if (!!edgePopoverEvents[0] && parseInt(edgePopoverEvents[0].css('margin-left')) === data.firstWidth + data.standardDayWidth / 2)
            $('.z_event:first-of-type').popover({container: '#z_show_standard', placement: 'right', sanitize: false});
        if (!!edgePopoverEvents[1] && parseInt(edgePopoverEvents[1].css('margin-left')) === data.firstWidth + data.standardDayWidth * (data.table.periodCount - 1) + data.standardDayWidth / 2 + data.table.periodCount - 1)
            $('.z_event:last-of-type').popover({container: '#z_show_standard', placement: 'left', sanitize: false});*/

        $('.z_event').popover({container: '#z_show_standard', placement: 'bottom', sanitize: false});

        let today = getToday();
        if ((data.table.dateType === 'month') ?
            today.toString().slice(0, -3) === `${data.table.year},${data.table.month}` :
            today[0] === data.table.year)
            setToday();

        scrollToEventListener();
        soloListener();
        zEventListener();

        goToMonthListener();
        zRowArrowGoToListener();
    }

    if (data.table.type.includes('solo')) {
        if (data.table.lawSet[0].actDate !== null) {
            let stupidActDate = parseJsonDate(data.table.lawSet[0].actDate, 'd');
            if (((parseInt(data.table.year) - parseInt(stupidActDate[0])) > 0 && (parseInt(data.table.month) - parseInt(stupidActDate[1])) > 1) ||
                (parseInt(data.table.year) - parseInt(stupidActDate[0])) < -5)
                data.table.lawSet[0].actDate = null;
        }
        data.table.scrollTo.target = jQuery($(`#z_show_${data.table.type}`).children(':not(.calendar)')['0']).children('.z_solo_canvas_row').children('.z_solo_pl_container').children('.z_solo_passing_line').children('.z_solo_passing_work').attr('id');

        let documentsLength = data.table.lawSet[0].documents.source.length + //data.table.lawSet[0].documents.source[0].docFiles.length +
            data.table.lawSet[0].documents.workflow.length +
            ((data.table.lawSet[0].actNumber !== null) ? 1 : 0) +
            data.table.lawSet[0].agenda.length;
        for (let rowNum = 0; rowNum < documentsLength; rowNum++) {
            addZRow(data.table.lawSet[0], rowNum, '_documents');
            setSoloEventCanvas(rowNum, '_documents');
        }
        processDocuments();

        for (let rowNum = 0; rowNum < data.table.lawSet[0].chronology.length; rowNum++) {
            addZRow(data.table.lawSet[0], rowNum, '_chronology');
            setSoloEventCanvas(rowNum, '_chronology');
            setSoloChronologyFirst(data.table.lawSet[0], rowNum);
        }
        processChronology();

        for (let rowNum = 0; rowNum < data.table.lawSet[0].passings.length; rowNum++) {
            addZRow(data.table.lawSet[0], rowNum, '_passings');
            setSoloEventCanvas(rowNum, '_passings');
            setSoloPassingsFirst(data.table.lawSet[0], rowNum);
        }
        processPassings();

        for (let rowNum = 0; rowNum < data.table.lawSet[0].workOutCommittees.length; rowNum++) {
            addZRow(data.table.lawSet[0], rowNum, '_committee');
            setSoloEventCanvas(rowNum, '_committee');
            setSoloCommitteeFirst(data.table.lawSet[0].workOutCommittees[rowNum], rowNum);
        }
        processCommittees();

        sortSoloRows();

        if (document.getElementById(`z_table_wrapper_solo`).offsetHeight > document.getElementById(`z_show_${data.table.type}`).offsetHeight) {
            $(`#z_cm_solo${data.table.lawSet[0].id}`).attr('style', 'height:100%');
            $(`#z_show_${data.table.type}`).attr('style', 'height:100%');
        }

        let placeholder = `<div class="z_table_solo_placeholder">
            <div class="z_first"></div>
            <div class="z_ts_p_inner"></div>
        </div>`;
        $('#z_show_' + data.table.type).append(placeholder);

        data.table.eventsSet.forEach(el => {
            let container = $(`#z_solo_pl_container_${el.type}${el.index}`);
            let row = container.parent().parent();
            row.attr({
                'data-target': (el.type.includes('passing')) ? `z_solo_pb_el_${el.type}${el.index}` : undefined,
                'data-from' : el.dateFirst,
                'data-len' : el.dateLast - el.dateFirst
            });
        });

        setSoloProgressBar();

        let today = getToday();
        if ((parseInt(today[0]) - parseInt(data.table.year)) * 12 + parseInt(today[1]) - parseInt(data.table.month) < data.table.periodCount)
            setToday();

        //setSoloFilterListener();
        soloPassingLineListener();
        //setTimeout(() => updateSPBListener(), 300);
        soloTimeGraphListener();
        scrollToEventListener();
    }

    $("[data-toggle='tooltip']").tooltip();
}

export function addZRow(law, index, rowID = '') {
    if (typeof index === 'number')
        index++;

    let result = "";
    let close = `</div>`;
    let rowOpen = `<div id="z_row${rowID}${index}" class="z_row ${(rowID !== '') ? `z_row${rowID}` : ''} ${(data.table.type.includes('solo')) ? 'z_row_solo' : ''}">`;

    let first = `<div id="first_r${rowID}${index}" class="z_first"></div>`;

    let eventContainer = '';

    let month = data.table.startingMonth;
    for (let i = 0; i < data.table.periodCount; i++) {
        let days = '';
        let startingDay = getFirstDayOfMonth(data.table.year, data.table.month);

        if (data.table.type.includes('solo')) {
            let monthIndex = (month - 1) % 12 + 1;
            startingDay = getFirstDayOfMonth(parseInt(data.table.year) + Math.floor((month - 1) / 12), monthIndex);

            data.table.dayCount += getDaysInMonth(data.table.year, monthIndex);

            for (let j = 0; j < getDaysInMonth(data.table.year, monthIndex); j++)
                days += `<div class="z_solo_day ${((data.table.dateType === 'month' || data.table.type.includes('solo')) && ((j + startingDay) % 7 === 5 || (j + startingDay) % 7 === 6)) ? 'z_day_weekend' : ''}"></div>`;
            month++;
        }

        eventContainer += `<div id="r${rowID}${index}c${i + 1}" class="${(data.table.type === 'standard') ?
            `z_event_container ${((data.table.dateType === 'month' || data.table.type.includes('solo')) && ((i + startingDay) % 7 === 5 || (i + startingDay) % 7 === 6)) ? 'z_day_weekend' : ''} z_width_${data.table.dateType}` : 'z_solo_container'}">${days}</div>`;
    }

    let placeholder = `<div id="z_tm_p${index}" class="z_table_main_placeholder"><div class="z_tm_p_inner"></div></div>`;

    result = rowOpen + first + eventContainer + placeholder + close;

    $('#z_show_' + data.table.type).append(result);
}

export function setFirstInfo(law, index) {
    let subjType = data.lawSubj.findIndex((el) => el === law.subject);

    let first_info = `
        <div class="z_info">
            <div class="z_subject ${data.lawSubjColor[subjType]}" rel="tooltip" data-toggle="tooltip" data-placement="right"
                data-html="true" title=""
                data-original-title="${data.lawSubj[subjType]}">
                    ${data.lawSubjSign[subjType]}
                ${(law.isUrgent === 1 || law.isUrgent === true || law.isUrgent === 'true') ?
        `<i class="fa fa-circle" style="font-size:0.7rem" aria-hidden="true"></i>` : ''}
            </div>
            <div class="z_id">
                <a href="${law.url}" target="_blank" rel="tooltip" data-toggle="tooltip"
                    data-placement="right" data-html="true" title=""
                    data-original-title="Перейти до повної сторінки">
                    ${law.registrationNumber}
                </a>
            </div>
            <div class="z_status ${law.statusClass}">
            ${(law.isEuro === 1 || law.isEuro === true || law.isEuro === 'true') ?
        `<img class="z_solo_euro_pic" src="https://itd.rada.gov.ua/billInfo/img/euro.png" title="Євроінтеграційний законопроект" style="margin-right:auto">` : ''}
            <div class="z_status_title">${law.currentPhase.status}</div>
                <button class="z_event_scrollto" title="Скролити до останньої події у таблиці">
                <i class="fa fa-forward" aria-hidden="true"></i>
                </button>
            </div>
            <div class="z_name"  rel="tooltip" data-toggle="tooltip" data-placement="right" data-html="true" title="" data-original-title="${(data.table.type === 'standard') ? law.name : law.passings[index].title}">
                ${law.name}
            </div>
            <button id="open_full${law.id}" class="btn btn-outline-secondary z_open_full" rel="tooltip" data-toggle="tooltip" data-placement="right" data-html="true" title="" data-original-title="Перейти до індивідуальної таблиці">
                <i class="fa fa-line-chart" aria-hidden="true"></i>
            </button>
        </div>
        `;

    $(`#first_r${index + 1}`).append(first_info);
    $("[data-toggle='tooltip']").tooltip();
}

export function calcZEventsArray(law) {
    let num = (data.table.dateType === 'year') ? parseInt(data.table.year) : (data.table.dateType === 'month') ? parseInt(data.table.month) : '';

    data.table.eventsSet.push({events: Array.from({length: data.table.periodCount}, () =>
            ({id: '', date : [], passings: [], documents: {source: [], workflow: []}, status: '', linked: false, start: false, end: false})),
        props: {eventIndex: [], eventCount: 0, status: 'out of bounds', oobLeft: false, oobRight: false, oobLeftTarget: undefined, oobRightTarget: undefined}});

    let eventsSet = data.table.eventsSet[data.table.eventsSet.length - 1];

    eventsSet.events.forEach((el, index) => {
        el.date = (data.table.dateType === 'month') ?
            [data.table.year, data.table.month, index + 1] :
            [data.table.year, index + 1, 0];
    });

    let status = eventsSet.props.status;
    let oobLeft = eventsSet.props.oobLeft;
    let oobRight = eventsSet.props.oobRight;
    let tableTime = (data.table.dateType === 'month') ? parseInt(data.table.year) * 12 + parseInt(data.table.month) : parseInt(data.table.year);
    let elemBounds = {
        started: false,
        ended: false,
        bounds: [-1, -1]
    };

    for (let i = 0; i < law.passings.length; i++) {
        let elemMain = law.passings[i];
        let time = elemMain.date.split('T')[0].split('-');
        let ix;
        let period;

        if (data.table.dateType === 'month') [time, ix] =
            [parseInt(time[0]) * 12 + parseInt(time[1]), 1];
        else [time, ix] = [parseInt(time[0]), 0];

        if (time < tableTime)
        {
            elemBounds.ended = true;
            oobLeft = true;
            if (i === 0) {
                elemBounds.bounds = [i, i];
                break;
            } else {
                let oobBothTime = law.passings[i - 1].date.split('T')[0].split('-');
                let iy;
                if (data.table.dateType === 'month') [oobBothTime, iy] =
                    [parseInt(oobBothTime[0]) * 12 + parseInt(oobBothTime[1]), 1];
                else [oobBothTime, iy] = [parseInt(oobBothTime[0]), 0];
                if (oobBothTime > tableTime) {
                    elemBounds.bounds = [i - 1, i]; //[i, i - 1]
                    status = 'out of bounds both';
                }
            }
        }
        if (time > tableTime)
        {
            oobRight = true;
            if (i === law.passings.length - 1) {
                elemBounds.bounds = [i, i];
                break;
            }
        }
        if (time === tableTime) {
            if (elemBounds.started === false) elemBounds.bounds[0] = i;
            if (elemBounds.ended === false) elemBounds.bounds[1] = i;
            elemBounds.started = true;
            period = parseInt(elemMain.date.split('T')[0].split('-')[ix + 1]) - 1;
            status = 'present';
        }

        if (period === undefined)
            continue ;

        if (eventsSet.props.eventIndex.indexOf(period) === -1)
            eventsSet.props.eventIndex.push(period);

        eventsSet.events[period].passings.push(elemMain);
        eventsSet.events[period].id = law.id;
        eventsSet.events[period].date = elemMain.date.split('T')[0].split('-').map(el => parseInt(el));

        if (i === law.passings.length - 1) eventsSet.events[period].start = true;
        if (i === 0) eventsSet.events[period].end = true;
    }
    eventsSet.props.status = status;
    eventsSet.props.oobLeft = oobLeft;
    eventsSet.props.oobRight = oobRight;
    eventsSet.props.eventIndex.reverse();

    if (oobLeft) {
        if (status === 'present') elemBounds.bounds[1]++;
        eventsSet.props.oobLeftTarget = law.passings[elemBounds.bounds[1]];
    }
    if (oobRight) {
        if (status === 'present') elemBounds.bounds[0]--;
        eventsSet.props.oobRightTarget = law.passings[elemBounds.bounds[0]];
    }

    eventsSet.events.forEach(el => {
        if (el.passings.length !== 0) {
            el.status = el.passings[el.passings.length - 1].status;
            eventsSet.props.eventCount++;
        }
    });

    law.documents.source.forEach((el) => {
        let time = el.publishDate.split('T')[0].split('-').map(el => parseInt(el));
        let period;
        let ix = (data.table.dateType === 'year') ? 0 : (data.table.dateType === 'month') ? 1 : undefined;

        if (time[0] === parseInt(data.table.year) && time[ix] === num) {
            period = time[ix + 1];
            while (eventsSet.events[period - 1].passings.length === 0 && !(data.table.dateType === 'year' && period <= 12) && !(data.table.dateType === 'month' && period <= getDaysInMonth(data.table.year, data.table.month))) {
                period++;
            }
        } else return;
        eventsSet.events[period - 1].documents.source.push(el);
    });
    law.documents.workflow.forEach((el) => {
        let time = el.publishDate.split('T')[0].split('-').map(el => parseInt(el));
        let period;
        let ix = (data.table.dateType === 'year') ? 0 : (data.table.dateType === 'month') ? 1 : undefined;

        if (time[0] === parseInt(data.table.year) && time[ix] === num) {
            period = time[ix + 1];
            while (eventsSet.events[period - 1].passings.length === 0 && !(data.table.dateType === 'year' && period <= 12) && !(data.table.dateType === 'month' && period <= getDaysInMonth(data.table.year, data.table.month))) {
                period++;
            }
        } else return;
        eventsSet.events[period - 1].documents.workflow.push(el);
    });

    if (eventsSet.props.eventIndex.length !== 0) {
        for (let i = eventsSet.props.eventIndex[0]; i <= eventsSet.props.eventIndex[eventsSet.props.eventIndex.length - 1]; i++)
            eventsSet.events[i].linked = true;
        for (let i = 0; i < eventsSet.props.eventIndex.length; i++) {
            eventsSet.events[eventsSet.props.eventIndex[i]].status =
                (i !== eventsSet.props.eventIndex.length - 1) ? eventsSet.events[eventsSet.props.eventIndex[i + 1]].status
                    : (eventsSet.props.oobRight) ? eventsSet.props.oobRightTarget.status : law.currentPhase.status;
        }
    }
}

export function addZEvents(law, index) {
    let eventsSet = data.table.eventsSet[data.table.eventsSet.length - 1];

    if (eventsSet.props.oobLeftTarget === undefined) eventsSet.props.oobLeftTarget = law.passings[law.passings.length - 1];
    if (eventsSet.props.oobRightTarget === undefined) eventsSet.props.oobRightTarget = law.passings[0];

    let oobLeft = eventsSet.props.oobLeft;
    let oobRight = eventsSet.props.oobRight;
    let status = eventsSet.props.status;
    let oobRightTarget = eventsSet.props.oobRightTarget;
    let oobLeftTarget = eventsSet.props.oobLeftTarget;

    let oobLTDate = oobLeftTarget.date.split('T')[0].split('-');
    let oobRTDate = oobRightTarget.date.split('T')[0].split('-');
    if (data.table.dateType === 'year') {
        oobLTDate.pop();
        oobRTDate.pop();
    }
    oobLTDate = oobLTDate.reverse().join('.');
    oobRTDate = oobRTDate.reverse().join('.');

    let zArrowLeftGoTo = `<button id="z_arrow_left${oobLeftTarget.date.split('T')[0].split('-').slice(0, 2).join('')}" class="z_row_arrow z_row_arrow_goto z_row_arrow_left" rel="tooltip" data-toggle="tooltip" data-placement="right" data-html="true" title="" 
    data-original-title='Перейти до попередньої події "${oobLeftTarget.title}", ${oobLTDate}'>
    <i class="fa fa-chevron-left"></i></button>`;
    let zArrowRightGoTo = `<button id="z_arrow_right${oobRightTarget.date.split('T')[0].split('-').slice(0, 2).join('')}" class="z_row_arrow z_row_arrow_goto z_row_arrow_right" rel="tooltip" data-toggle="tooltip" data-placement="left" data-html="true" title="" 
    data-original-title='Перейти до наступної події "${oobRightTarget.title}", ${oobRTDate}'>
    <i class="fa fa-chevron-right"></i></button>`;
    /*let zArrowLeftScrollTo = `<button class="z_row_arrow z_row_arrow_scrollto z_row_arrow_left" rel="tooltip" data-toggle="tooltip" data-placement="right" data-html="true" title=""
    data-original-title='Найближча подія'>
    <i class="fa fa-chevron-left"></i></button>`;
    let zArrowRightScrollTo = `<button class="z_row_arrow z_row_arrow_scrollto z_row_arrow_right" rel="tooltip" data-toggle="tooltip" data-placement="right" data-html="true" title=""
    data-original-title='Найближча подія'>
    <i class="fa fa-chevron-right"></i></button>`;*/

    let cell = $(`#r${index + 1}c1`).parent();
    if (status === 'out of bounds both') {
        cell.prepend(zArrowLeftGoTo);
        cell.prepend(zArrowRightGoTo);
    } else {// if (status !== 'present') {
        if (oobLeft === true) cell.prepend(zArrowLeftGoTo);
        if (oobRight === true) cell.prepend(zArrowRightGoTo);
    }

    cell = $(`#z_canvas_row${index + 1}`);
    let mainLineCount = eventsSet.props.eventCount - 1 +
        ((eventsSet.props.oobLeft === true) ? 1 : 0) +
        ((eventsSet.props.oobRight === true) ? 1 : 0);

    let j = 0;
    let k = 0;
    if (status !== 'out of bounds')
        for (let i = 0; i < mainLineCount && j < eventsSet.events.length; i++) {
            cell.append(`<div id="z_main_line${index + 1}e${i + 1}" class="z_main_line"></div>`);

            let offset = 0, width = 0;
            j = eventsSet.props.eventIndex[k];
            if (status === "out of bounds both") {
                offset = 0;
                width = calcDateOffset(eventsSet.events[eventsSet.events.length - 1].date[0],
                    eventsSet.events[eventsSet.events.length - 1].date[1],
                    eventsSet.events[eventsSet.events.length - 1].date[2]) + data.standardDayWidth / 2 + 2;
                status = `bg-${getStatusClass(eventsSet.props.oobLeftTarget.status).split('-')[1]}`;

                $(`#z_tm_p${index + 1}`).append(`<div id="z_main_line${index + 1}_tm_p" class="z_main_line"></div>`);
                $(`#z_main_line${index + 1}_tm_p`).attr('style', 'width:100%').addClass(status);
            } else if (oobLeft && i === 0) {
                offset = 0;
                if (j !== 0)
                    width = calcDateOffset(eventsSet.events[j].date[0], eventsSet.events[j].date[1], eventsSet.events[j].date[2]);
                else width = data.standardDayWidth / 2;
                status = `bg-${getStatusClass(eventsSet.events[j].passings[eventsSet.events[j].passings.length - 1].status).split('-')[1]}`;
            } else if (oobRight && i === mainLineCount - 1) {
                offset = calcDateOffset(eventsSet.events[j].date[0], eventsSet.events[j].date[1], eventsSet.events[j].date[2]);
                if (j !== eventsSet.events.length - 1)
                    width = calcDateOffset(eventsSet.events[eventsSet.events.length - 1].date[0],
                        eventsSet.events[eventsSet.events.length - 1].date[1],
                        eventsSet.events[eventsSet.events.length - 1].date[2]) - offset;
                width += data.standardDayWidth / 2 + 2;
                status = `bg-${getStatusClass(eventsSet.events[j].status).split('-')[1]}`;

                $(`#z_tm_p${index + 1}`).append(`<div id="z_main_line${index + 1}_tm_p" class="z_main_line"></div>`);
                $(`#z_main_line${index + 1}_tm_p`).attr('style', 'width:100%').addClass(status);
            } else {
                offset = calcDateOffset(eventsSet.events[j].date[0], eventsSet.events[j].date[1], eventsSet.events[j].date[2]);
                if (k !== eventsSet.props.eventIndex.length - 1)
                    width = calcDateOffset(eventsSet.events[eventsSet.props.eventIndex[k + 1]].date[0],
                        eventsSet.events[eventsSet.props.eventIndex[k + 1]].date[1],
                        eventsSet.events[eventsSet.props.eventIndex[k + 1]].date[2]) - offset;
                else width = data.standardDayWidth / 2; //just in case
                status = `bg-${getStatusClass(eventsSet.events[j].status).split('-')[1]}`;
                k++;
            }

            $(`#z_main_line${index + 1}e${i + 1}`).css('margin-left', `${data.firstWidth + offset}px`)
                .css('width', `${width}px`).addClass(status);
        }

    let offset = 0;
    for (let i = 0; i < eventsSet.events.length; i++) {
        let el = eventsSet.events[i];
        if (el.passings.length === 0)
            continue;

        offset = calcDateOffset(el.date[0], el.date[1], el.date[2]);
        cell.append(createZEvent(el, i + 1));
        $(`#z_${el.id}${i + 1}`).css('margin-left',
            `${data.firstWidth + offset}px`);
        $(`#z_${el.id}${i + 1}_info`).css('left',
            `${data.firstWidth / 2 + offset}px`);
    }
}

export function createZEvent(zEventsObj, num) {
    let result = '';

    let close = `</div>`;

    let date = `${(data.table.dateType === 'year')
        ? data.monthName[zEventsObj.date[1] - 1]
        : (data.table.dateType === 'month')
            ? zEventsObj.date[2] + ' ' + data.monthNameGen[zEventsObj.date[1] - 1]
            : ''} ${zEventsObj.date[0]}`;
    let zInfoOpen = `
        <div id='z_${zEventsObj.id}${num}_info' class='collapse z_event_info'>
        `;
    let zInfoTitle = `
        ${(data.table.dateType === "year")
        ? `<div class="z_event_expand_container">
                <button id="z_${zEventsObj.id}${num}_${zEventsObj.passings[0].date.split("-")[1]}" class="z_event_expand" rel="tooltip" data-toggle="tooltip" data-placement="right" data-html="true" title="" data-original-title="Перейти до таблиці з даним місяцем">
                <i class="fa fa-arrow-left"></i></button>
            </div>`
        : ""}
        <div class="z_event_info_el z_event_info_title">
            <div>${date}</div><div class="text-center ${getStatusClass(zEventsObj.status)}"><small>${zEventsObj.status}</small></div>
        </div>
        <button type="button" class="z_event_close" data-dismiss="popover">×</button>
        `;
    let zInfoElements = `<div class='z_popover scroll-light'>`;
    zEventsObj.passings.forEach((el, i) => {
        zInfoElements += `
            <div class='z_event_info_el'><div class='z_event_info_time'>
            ${(data.table.dateType === 'year') ? '<b>' + el.date.split('T')[0].split('-').reverse().join('.') + '</b> ' : ''}${(el.date.slice(11,16))}
            </div><div class='z_event_info_text ${getStepperClass(el.title)}'>
            ${(el.title.match(/[Пп]рийнято/)) ? `<strong>${el.title}</strong>` : el.title}</div></div>
            `;
    });
    zInfoElements += '</div>';

    let zEvent = `
        <button id='z_${zEventsObj.id}${num}' class='z_event z_main bg-${getStatusClass(zEventsObj.status).split('-')[1]}' `+/*data-target='#z_${zEventsObj.id}${num}_info' role='button' aria-controls='z_${zEventsObj.id}${num}_info'*/`
        role='button' data-html='true' data-toggle='popover' title='${zInfoTitle}' data-content="${zInfoElements}">
            ${zEventsObj.passings.length}</button>
        `;
    /*let zDocumentsTitle = `
        <div class="z_event_info_el z_event_info_title">Пов'язані документи</div>`;
    let zDocumentSourceElements = [];
    zEventsObj.documents.source.forEach(el => {
        zDocumentSourceElements.push([`
            <div class="z_event_info_el"><div class="z_event_info_time" rel="tooltip" data-toggle="tooltip" data-placement="bottom" data-html="true" title="" data-original-title='Час реєстрації'>
            ${ + (data.table.dateType === 'year') ? el.publishDate.split('T')[0].split('-').reverse().join('.') + ' ' : el.publishDate.split('T')[0].split('-').slice(1, 3).reverse().join('.') + ' '}${(el.publishDate.slice(11,19))}
            </div><div class="z_event_info_text">
            ${el.kind}:</div></div>
            `]);
        el.docFiles.forEach(el => {
            zDocumentSourceElements[zDocumentSourceElements.length - 1].push(`
                <div class="z_event_info_el"><div class="z_event_info_time">
                </div><div class="z_event_info_text z_event_info_doc">
                <a href="${el.url}">${el.type}</a></div></div>
                `);
        });
        zDocumentSourceElements[zDocumentSourceElements.length - 1] = zDocumentSourceElements[zDocumentSourceElements.length - 1].join('');
    });

    let zDocumentWorkflowElements = [];
    zEventsObj.documents.workflow.forEach(el => {
        zDocumentWorkflowElements.push([`
            <div class="z_event_info_el"><div class="z_event_info_time" rel="tooltip" data-toggle="tooltip" data-placement="bottom" data-html="true" title="" data-original-title='Час реєстрації'>
            ${(data.table.dateType === 'year') ? el.publishDate.split('T')[0].split('-').reverse().join('.') + ' ' : ''}${(el.publishDate.slice(11,19))}
            </div><div class="z_event_info_text">
            ${el.kind}:</div></div>
            `]);
        el.docFiles.forEach(el => {
            zDocumentWorkflowElements[zDocumentWorkflowElements.length - 1].push(`
                <div class="z_event_info_el"><div class="z_event_info_time">
                </div><div class="z_event_info_text z_event_info_doc">
                <a href="${el.url}">${el.type}</a></div></div>
                `);
        });
        zDocumentWorkflowElements[zDocumentWorkflowElements.length - 1] = zDocumentWorkflowElements[zDocumentWorkflowElements.length - 1].join('');
    });*/

    result = zEvent;// + zInfoOpen + zInfoTitle /*+ zInfoElements.join('')*/ + close;/*+
    //((zDocumentSourceElements.length + zDocumentWorkflowElements.length !== 0) ? zDocumentsTitle + zDocumentSourceElements.join('') + zDocumentWorkflowElements.join('') : '') + close;*/

    return result;
}

/*
 */

export function setDateList(parent = '#z_panel_container_main') {
    let result = '';

    let close = `</div>`;

    let dateListMainOpen = `
        <div id="z_date_list" class="nav-list text-center z_date_list_main">
        <div class="z_date_list_title"><span>Виберіть місяць<br/>або за весь рік:</span></div>
        `;
    let dateListYearOpen = `
        <div id="z_year_list" class="z_date_list">
            <div class="dropdown show scroll-light">
                <a class="btn dropdown-toggle z_dropdown_title" href="javascript:void(0)" role="button" id="dropdownYearList"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    ${data.table.year}
                </a>
        `;
    let dateListMonthOpen = `
        <div id="z_month_list" class="z_date_list">
            <div class="dropdown show">
                <a class="btn dropdown-toggle z_dropdown_title" href="javascript:void(0)" role="button" id="dropdownMonthList"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    ${(data.table.dateType === 'month') ? data.monthName[parseInt(data.table.month) - 1] : 'За весь рік'}
                </a>
                <div class="dropdown-menu scroll-light" aria-labelledby="dropdownMonthList">
                    <a class="dropdown-item" href="javascript:void(0)"><button id="z_tab_year" class="btn btn-sm btn-link z_panel">За весь рік</button></a>
        `;

    let yearPanels = '<div class="dropdown-menu scroll-light" aria-labelledby="dropdownMonthList">';
    for (let i = data.currentYear; i >= data.const.YEAR_MIN; i--)
        yearPanels += `<a class="dropdown-item" href="javascript:void(0)"><button id="z_panel_year${i}" class="btn btn-sm btn-link z_panel">${i}</button></a>`;
    yearPanels += close;

    let monthPanels = ``;
    for (let i = data.const.MONTH_MIN; i <= data.const.MONTH_MAX; i++)
        monthPanels += `<a class="dropdown-item" href="javascript:void(0)"><button id="z_panel_month${('0' + i).slice(-2)}" class="btn btn-sm btn-link z_panel">${data.monthName[i - 1]}</button></a>`;
    monthPanels += close;

    let changePrev = `
        <button id="z_current_prev" class="nav-link z_link z_colored" aria-selected="false">
            <i class="fa fa-arrow-left"></i></button>
        `;
    let changeNext = `
        <button id="z_current_next" class="nav-link z_link z_colored" aria-selected="false">
            <i class="fa fa-arrow-right"></i></button>
        `;

    result = dateListMainOpen + changePrev + ((true/*data.table.dateType === 'month'*/) ? dateListMonthOpen + monthPanels + close.repeat(2) : '') + dateListYearOpen + yearPanels + close.repeat(2) + changeNext + close;

    $(parent).prepend(result);
    $(`#z_panel_year${data.table.year}`).removeClass('btn-link').addClass('btn-fill active disabled').prop('disabled', true);
    $((data.table.dateType === 'month') ? `#z_panel_month${parseInt(data.table.month)}` : '#z_tab_year').removeClass('btn-link').addClass('btn-fill active disabled').prop('disabled', true);
    changeDatePanelListener();
    changeDateCurrentListener();
    changeTypeListener();
}

/*
 */

export function setPages(amount, parent = '#z_panel_container_main') {
    let result = '';

    let close = `</div>`;

    let mainListOpen = `
        <div id="z_page_list" class="nav-list text-center z_date_list_main">
        `;

    let pageListOpen = `
        <div class="z_date_list">
            <div id="z_page_input_container" class="btn z_dropdown_title">
                <span>Ст.</span><input id="z_page_input" type="number" min="1" max="${data.table.pageCount}" step="1" value="${data.currentPage}"><span>з</span><div id="z_last_page_goto">${data.table.pageCount}</div>
            </div>
        `;

    let pagePrev = `
        <button id="z_page_prev" class="nav-link z_link z_colored" aria-selected="false">
        <i class="fa fa-arrow-left"></i></button>
        `;
    let pageNext = `
        <button id="z_page_next" class="nav-link z_link z_colored" aria-selected="false">
        <i class="fa fa-arrow-right"></i></button>
        `;

    let lawSum = `
        <div class="btn z_dropdown_title disabled" style="margin-left:auto">
            ∑ ${data.table.lawSet.length}
        </div>
        `;

    result = mainListOpen + ((data.table.pageCount > 1) ? pagePrev + pageListOpen + close + pageNext : '') + lawSum + close;

    $(parent).prepend(result);

    /*if (data.currentPage === data.const.PAGE_MIN) $('#z_page_prev').prop('disabled', true);
    if (data.currentPage === data.table.pageCount) $('#z_page_next').prop('disabled', true);*/
    changePageListener();

}

/*
 */

export function setFilter(parent = '#z_panel_container_main') {
    let result = '';

    let filter;

    filter = `

<div id="z_sort_list" class="btn-group dropdown">
<a class="btn btn-link btn-sm dropdown-toggle with-caret" href="javascript:void(0)" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-sort-numeric-asc icon-info"></i><span class="d-none d-md-inline z_list_title"> Сортування</span></a>
<div class="dropdown-menu scroll-light dropdown-menu-right dropdown-sm" data-url="">
<a class="dropdown-header bold" href="javascript:void(0)">Тип</a>
<a id="z_sort_laws_up" class="dropdown-item filter d-flex align-items-center sort_laws" href="javascript:void(0)">Пряме</a>
<a id="z_sort_laws_down" class="dropdown-item filter d-flex align-items-center sort_laws" href="javascript:void(0)">Зворотнє</a>
<a id="z_sort_laws_up_pass" class="dropdown-item filter d-flex align-items-center sort_laws" href="javascript:void(0)">За першою подією</a>
<a id="z_sort_laws_down_pass" class="dropdown-item filter d-flex align-items-center sort_laws" href="javascript:void(0)">За останньою подією</a>
</div>
</div>

<div id="z_filter_list" class="btn-group dropdown">
<a class="btn btn-link btn-sm dropdown-toggle with-caret" href="javascript:void(0)" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-filter"></i><span class="d-none d-md-inline z_list_title"> Фільтр</span></a>
<div class="dropdown-menu dropdown-menu-right dropdown-sm filter-list scroll-light" data-url="">
<a id="filter-clear" class="dropdown-item nofilter filter-option" href="javascript:void(0)">Очистити</a>
<div class="dropdown-divider"></div>
<a class="dropdown-header bold" href="javascript:void(0)">Ініціатор</a>
<a id="filter-subject-president" class="dropdown-item filter d-flex align-items-center filter-option" href="javascript:void(0)"><b><span class="text-danger">П</span></b>Президент України</a>
<a id="filter-subject-kabmin" class="dropdown-item filter d-flex align-items-center filter-option" href="javascript:void(0)"><b><span class="text-success">У</span></b>Кабінет Міністрів України</a>
<a id="filter-subject-nardep" class="dropdown-item filter d-flex align-items-center filter-option" href="javascript:void(0)"><b><span class="text-primary">Д</span></b>Народний депутат України</a>
<div class="dropdown-divider"></div>
<a class="dropdown-header bold" href="javascript:void(0)">Стан</a>
<a id="filter-status-success" class="dropdown-item filter d-flex align-items-center filter-option text-success" href="javascript:void(0)">Прийнято</a>
<a id="filter-status-info" class="dropdown-item filter d-flex align-items-center filter-option text-info" href="javascript:void(0)">Опрацьовано</a>
<a id="filter-status-primary" class="dropdown-item filter d-flex align-items-center filter-option text-primary" href="javascript:void(0)">На опрацюванні</a>
<a id="filter-status-warning" class="dropdown-item filter d-flex align-items-center filter-option text-warning" href="javascript:void(0)">Повернуто</a>
<a id="filter-status-danger" class="dropdown-item filter d-flex align-items-center filter-option text-danger" href="javascript:void(0)">Відхилено</a>
<a id="filter-status-other" class="dropdown-item filter d-flex align-items-center filter-option" href="javascript:void(0)">Інше</a>
<div class="dropdown-divider"></div>
<a class="dropdown-header bold" href="javascript:void(0)">Тип проекту</a>
<a id="filter-type-law" class="dropdown-item filter d-flex align-items-center filter-option" href="javascript:void(0)">Закон</a>
<a id="filter-type-resolution" class="dropdown-item filter d-flex align-items-center filter-option" href="javascript:void(0)">Постанова</a>
<a id="filter-type-proposal" class="dropdown-item filter d-flex align-items-center filter-option" href="javascript:void(0)">Пропозиції Президента</a>
<div class="dropdown-divider"></div>
<a class="dropdown-header bold" href="javascript:void(0)">Особливі</a>
<a id="filter-type-euro" class="dropdown-item filter d-flex align-items-center filter-option" href="javascript:void(0)"><img class="z_solo_euro_pic" src="https://itd.rada.gov.ua/billInfo/img/euro.png">Євроінтеграційні</a>
<a id="filter-type-urgent" class="dropdown-item filter d-flex align-items-center filter-option" href="javascript:void(0)"><i class="fa fa-circle" style="font-size:0.7rem;padding-top:0.1rem" aria-hidden="true"></i> Невідкладні</a>
</div>
</div>
    `;

    result = filter;

    $(parent).prepend(result);

    sortLawsListener();
    filterByOptionListener();
}

/*
 */

export function setToday() {
    let table = $(`#z_show_${data.table.type}`);

    let result = '';

    result = `
        <div id="z_solo_canvas_today" class="z_solo_canvas">
            <div class="z_first" style="visibility: hidden"></div>
            <div id="z_solo_today_${data.table.type}" class="z_solo_today considered"></div>
            <div id="z_solo_today_overlay_${data.table.type}" class="z_solo_today_overlay"></div>
        </div>
    `;

    table.append(result);

    let todayOffset = getToday();

    result = `
        <div id="z_solo_today_nav_${data.table.type}" class="z_solo_today_nav considered" rel="tooltip" data-toggle="tooltip" data-placement="right" data-html="true" title=""
        data-original-title='${(data.table.dateType === 'month' || data.table.type.includes('solo')) ?
        `Сьогодні, ${todayOffset[2]}.${todayOffset[1]}.${todayOffset[0]}` :
        `Нинішній місяць, ${todayOffset[1]}.${todayOffset[0]}`}'></div>
    `;
    table.children('.z_row.calendar').append(result);

    todayOffset = calcDateOffset(todayOffset[0], todayOffset[1], todayOffset[2]);
    if (data.table.type === "standard")
        todayOffset -= data.standardDayWidth / 2 - 1;
    $(`#z_solo_today_${data.table.type}`)
        .css('margin-left',
            `${todayOffset}px`)
        .css('width', `${(data.table.type === 'standard') ? data.standardDayWidth : data.soloDayWidth}px`);
    $(`#z_solo_today_nav_${data.table.type}`)
        .css('margin-left',
            `calc(var(--first-width) + ${todayOffset}px)`)
        .css('width', `${(data.table.type === 'standard') ? data.standardDayWidth : data.soloDayWidth}px`);
    $(`#z_solo_today_overlay_${data.table.type}`).css('width',
        `calc(100% - var(--first-width) - ${(data.table.type === 'standard') ? data.standardDayWidth : data.soloDayWidth} - ${todayOffset}px)`);

    $("[data-toggle='tooltip']").tooltip();
}