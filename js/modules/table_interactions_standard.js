import {data} from "./data.js";
import {getStatusClass} from "./get_class_regex.js";
import {setMainTable} from "./table_create_standard.js";
import {elementIsVisible} from "./misc.js";

export function scrollToContent() {
    let scrollTo = data.table.scrollTo.target;

    if (scrollTo === null) {
        data.table.scrollTo = {};
        Object.assign(data.table.scrollTo, data.standardScrollTo);
        return;
    }

    let i = 2;
    while (scrollTo === undefined && i <= data.const.PAGE_SIZE + 1) {
        scrollTo = $(`#z_show_${data.table.type} .z_row:nth-of-type(${i})`).children('.z_main_canvas_row').children('.z_event:first-of-type').attr('id');
        i++;
    }
    if (scrollTo === undefined || scroll === null || scrollTo.includes('undefined') || $(`#${scrollTo}`).length === 0)
        return ;

    document.getElementById(scrollTo).scrollIntoView({
        behavior: data.table.scrollTo.behavior,
        block: data.table.scrollTo.block,
        inline: data.table.scrollTo.inline
    });

    data.table.scrollTo = {};
    Object.assign(data.table.scrollTo, data.standardScrollTo);
}

export function compareDates(a, b, type = 'z_sort_laws_up') {
    let result = (type === 'z_sort_laws_up' || type === 'z_sort_laws_up_pass') ? 1 :
        (type === 'z_sort_laws_down' || type === 'z_sort_laws_down_pass') ? -1 : 0;

    if (a !== null && b !== null &&
        typeof a === 'object' && typeof b === 'object') {
        if (a.sortDate !== undefined && b.sortDate !== undefined) {
            a = a.sortDate;
            b = b.sortDate;
        } else {
            let source = [a, b];
            a = jQuery(source[0]).find('.z_info').attr('data-time-start');
            b = jQuery(source[1]).find('.z_info').attr('data-time-start');
            if (a === 'null' && b === 'null')
                return 0;
            if (a === 'null')
                return -1;
            if (b === 'null')
                return 1;
            let sepA = a.includes('T') ? 'T' : a.includes(' ') ? ' ' : null;
            let sepB = b.includes('T') ? 'T' : b.includes(' ') ? ' ' : null;
            a = (sepA !== null) ? [a.split(sepA)[0].split('-'), a.split(sepA)[1].split(':')] : [a.split('-'), [0, 0, 0]];
            b = (sepB !== null) ? [b.split(sepB)[0].split('-'), b.split(sepB)[1].split(':')] : [b.split('-'), [0, 0, 0]];

            if (a[0][0] === b[0][0] && a[0][1] === b[0][1] && a[0][2] === b[0][2] &&
                a[1][0] === b[1][0] && a[1][1] === b[1][1] && a[1][2] === b[1][2])
            {
                a = jQuery(source[0]).find('.z_info').attr('data-time-end');
                b = jQuery(source[1]).find('.z_info').attr('data-time-end');
                if (a === 'null' && b === 'null')
                    return 0;
                if (a === 'null')
                    return -1;
                if (b === 'null')
                    return 1;
                let sepA = a.includes('T') ? 'T' : a.includes(' ') ? ' ' : null;
                let sepB = b.includes('T') ? 'T' : b.includes(' ') ? ' ' : null;
                a = (sepA !== null) ? [a.split(sepA)[0].split('-'), a.split(sepA)[1].split(':')] : [a.split('-'), [0, 0, 0]];
                b = (sepB !== null) ? [b.split(sepB)[0].split('-'), b.split(sepB)[1].split(':')] : [b.split('-'), [0, 0, 0]];
            }
        }
    } else {
        if (a === null)
            return 1;
        if (b === null)
            return -1;
        if (a.includes('T')) {
            a = a.split('T');
            a[0] = a[0].split('-');
            a[1] = a[1].split(':');
        } else a = [a.split('-'), [0, 0, 0]];
        if (b.includes('T')) {
            b = b.split('T');
            b[0] = b[0].split('-');
            b[1] = b[1].split(':');
        } else b = [b.split('-'), [0, 0, 0]];
    }

    if (a[0][0] === b[0][0]) {
        if (a[0][1] === b[0][1]) {
            if (a[0][2] === b[0][2]) {
                if (a[1][0] === b[1][0]) {
                    if (a[1][1] === b[1][1]) {
                        if (a[1][2] === b[1][2]) {
                            return 0;
                        }
                        else if (a[1][2] < b[1][2]) return result;
                        else return -result;
                    }
                    else if (a[1][1] < b[1][1]) return result;
                    else return -result;
                }
                else if (a[1][0] < b[1][0]) return result;
                else return -result;
            }
            else if (a[0][2] < b[0][2]) return result;
            else return -result;
        }
        else if (a[0][1] < b[0][1]) return result;
        else return -result;
    }
    else if (a[0][0] < b[0][0]) return result;
    else return -result;
}
/*
 */

export function newLawSet(newLawSet) {
    if (newLawSet[0] === undefined || newLawSet[0].id === undefined || newLawSet[0].error !== undefined)
        return false;

    cacheTable();

    console.log((newLawSet.length === 1) ? newLawSet[0] : newLawSet);

    let time = newLawSet[0].registrationDate.split('T')[0].split('-');

    data.table.lawSet = newLawSet;
    data.table.lawSet[0].statusClass = getStatusClass(data.table.lawSet[0].currentPhase.status)
    data.table.year = time[0];
    data.table.month = time[1];
    data.table.day = time[2];
    data.table.pageCount = Math.ceil(newLawSet.length / data.const.PAGE_SIZE);

    return true;
}

export function cacheTable() {
    for (let param in data.table) data.tableCache[param] = data.table[param];
}

export function restoreTable() {
    for (let param in data.tableCache) data.table[param] = data.tableCache[param];
}

/*
 */

export function changeDate(type, num, action = 'do') {
    if (type === '' || num === '' || (action !== 'do' && action !== 'check') || parseInt(num) > data.const.YEAR_MAX)
        return;

    if (num.length === 1) num = '0' + num;
    if (action === 'do') data.table.dateType = type;
    (type === 'year') ? data.table.year = num : (type === 'month') ? data.table.month = num : '';

    if ($('#z_date_list').html() !== undefined)
        data.dateListHTML = $('#z_date_list').html();

    $('.z_event_close_all').trigger('click');
    $('#table_stat').children().remove();

    setMainTable();
    //setTimeout(() => scrollToContent(), 50);
}

/*
 */

export function changeDatePanelListener() {
    $('.z_panel').on('click', function() {
        changeDatePanel(jQuery(this).attr('id'));
    });
}

export function changeDatePanel(id, refresh = true) {
    let el = $('#' + id);

    let newDate = id.split(/(?<=[a-z])(?=\d+?)/);
    newDate[0] = newDate[0].split('_');
    newDate[0] = newDate[0][newDate[0].length - 1];

    el.parent().parent().children().children().removeClass('btn-fill active disabled').addClass('btn-link').prop('disabled', false);
    el.removeClass('btn-link').addClass('btn-fill active disabled').prop('disabled', true);
    el.parent().parent().parent().children('.z_dropdown_title').text(el.text());

    if (refresh === true && el.text() !== 'За весь рік')
        changeDate(newDate[0], newDate[1], 'do');
}

export function changeDateCurrentListener() {
    $('#z_current_prev, #z_current_next').on('click', function() {
        changeDateCurrent(jQuery(this).attr('id'));
    });
}

export function changeDateCurrent(id) {
    let year = parseInt(data.table.year);
    let month = parseInt(data.table.month);

    data.table.scrollTo.target = null;

    if (data.table.dateType === 'year') {
        if (id === 'z_current_prev') {
            $(`#z_panel_year${year - 1}`).trigger('click');
        } else if (id === 'z_current_next') {
            $(`#z_panel_year${year + 1}`).trigger('click');
        }
    } else if (data.table.dateType === 'month') {
        if (id === 'z_current_prev') {
            if (month === 1) {
                if (year === data.const.YEAR_MIN)
                    return ;
                data.table.year = (year - 1).toString();//$(`#z_panel_year${year - 1}`).trigger('click');
                month = 12;
                changeDatePanel(`z_panel_year${year - 1}`, false);
            } else month--;
        } else if (id === 'z_current_next') {
            if (month === 12) {
                if (year === data.const.YEAR_MAX)
                    return ;
                data.table.year = (year + 1).toString();//$(`#z_panel_year${year + 1}`).trigger('click');
                month = 1;
                changeDatePanel(`z_panel_year${year + 1}`, false);
            } else month++;
        }
        $(`#z_panel_month${('0' + month).slice(-2)}`).trigger('click');
    }
}

/*
 */

export function changeTypeListener() {
    $('.z_panel').on('click', function() {
        changeType(jQuery(this).attr('id'));
    });
}

export function changeType(id) {
    let type = id;

    if (type.includes(data.table.dateType))
        return ;
    if (type.match('year$')) {
        type = 'year';
    } else {
        type = 'month';
    }

    changeDate(type, (type === 'year') ? data.table.year : (type === 'month') ? data.table.month : '');
}

/*
 */

export function changePage(pageNum) {
    $('#z_page_prev, #z_page_next').prop('disabled', false);

    data.currentPage = pageNum;

    if (data.currentPage === data.const.PAGE_MIN) $('#z_page_prev').prop('disabled', true);
    if (data.currentPage === data.table.pageCount) $('#z_page_next').prop('disabled', true);

    $('.z_event_close_all').trigger('click');
    $('#table_stat').children().remove();

    setMainTable();
}

export function changePageListener() {
    $("#z_page_input").on('keyup input', function() {
        let value = parseInt(this.value);

        if (Number.isNaN(value) || !(value >= data.const.PAGE_MIN && value <= data.table.pageCount)) {
            return ;
        }

        changePage(value);
    });

    $('#z_page_prev, #z_page_next').on('click', function() {
        let pageNum = (jQuery(this).attr('id').includes('prev')) ? (data.currentPage - 1) : (data.currentPage + 1);
        $('#z_page_input').attr('value', pageNum);

        changePage(pageNum);
    });

    $('#z_last_page_goto').on('click', function() {
        $('#z_page_input').attr('value', data.table.pageCount);

        changePage(data.table.pageCount);
    });
}

/*
 */

export function goToMonthListener() {
    $('.z_event_expand').on('click', function() {
        goToCorespMonth(jQuery(this).attr('id'));
    });
}

export function goToCorespMonth(id) {
    let newID = id.split('_');
    newID = newID[newID.length - 1];
    data.table.dateType = 'month';//$('#z_type_month').trigger('click');
    $(`#z_panel_month${newID}`).trigger('click');
}

/*
 */

export function zRowArrowGoToListener() {
    $('.z_row_arrow_goto').on('click', function() {
        jQuery(this).tooltip('hide');
        goToClosestEvent(jQuery(this));
    });
}

export function goToClosestEvent(el) {

    let id = el.attr('id');
    let rowNum = parseInt(el.parent().attr('id').split(/(?<=[a-z])(?=\d+?)/)[1]);
    let lawId = data.table.lawSet[(data.currentPage - 1) * data.const.PAGE_SIZE + rowNum - 1].id;
    let lawDate = (id.match('left')) ?
        data.table.eventsSet[rowNum - 1].props.oobLeftTarget.date :
        data.table.eventsSet[rowNum - 1].props.oobRightTarget.date;
    lawDate = lawDate.split('T')[0].split('-');
    lawDate = (data.table.dateType === 'month') ? lawDate[2] : lawDate[1];

    data.table.scrollTo.target = `z_${lawId}${lawDate}`;

    id = id.split(/(?<=[a-z])(?=\d+?)/)[1];
    let year = id.slice(0, 4);
    let month = id.slice(4);
    if (year !== data.table.year) {
        data.table.year = year;
        changeDatePanel(`z_panel_year${year}`, false);
    }
    $(`#z_panel_${(data.table.dateType === 'month') ? 'month' + ('0' + parseInt(month)).slice(-2) : 'year' + year}`).trigger('click');
}

export function zEventListener() {
    $('.z_event').on('click', function() {
        closeEventListener();
        goToMonthListener();
        $("[data-toggle='tooltip']").tooltip();
    });
}

export function closeEventListener() {
    $('.z_event_close').on('click', function () {
        closeEvent($(this));
    });
}

export function closeEvent(el) {
    el.parent().parent().popover('hide');
}

export function closeAllEventsListener() {
    $('.z_event_close_all').on('click', function () {
        //$('.z_event_active').trigger('click');
        //$('.z_event_close_all').css('visibility', 'hidden');
        $('#z_show_standard').children().popover('hide');
    });
}

/*
 */

export function sortLawsListener() {
    $('.sort_laws').on('click', function () {
        sortLaws(jQuery(this).attr('id'));
    });
}

export function sortLaws(type) {
    let arrSort = [];

    data.table.lawSet.forEach(el => {
        arrSort.push({law: el, regDate: el.registrationDate,  eventDate: (el.passings !== undefined) ? el.passings[el.passings.length - 1].date: null});
    });

    let compareLawObj = (a, b) => {
        if (type === 'z_sort_laws_up' || type === 'z_sort_laws_down')
            return compareDates(a.regDate, b.regDate, type);
        if (type === 'z_sort_laws_up_pass' || type === 'z_sort_laws_down_pass')
            return compareDates(a.eventDate, b.eventDate, type);
    }
    arrSort.sort(compareLawObj);

    arrSort = arrSort.map(el => el.law);

    if (newLawSet(arrSort) === false)
        return ;

    $('#table_stat').children().remove();

    data.currentPage = 1;
    setMainTable();
}

/*
 */

export function filterByOptionListener() {
    $('.filter-option').on('click', function () {
        filterByOption(jQuery(this).attr('id'));
    });
}

export function filterByOption(id) {

    let newSet;
    let newType;

    if (id.includes('subject')) {
        newType = (id.includes('president')) ? 0 :
            (id.includes('kabmin')) ? 1 :
                (id.includes('nardep')) ? 2 : undefined;

        newSet = data.lawBase.filter(el => el.subject === data.lawSubj[newType]);
    }
    else if (id.includes('type')) {
        if (id.includes('all'))
            newSet = data.lawBase;
        if (id.includes('law'))
            newSet = data.lawBase.filter(el =>!el.name.match(/^[Пп]роект [Пп]останови/) && !!el.name.match(/^[Пп]роект ([Зз]акон[уа]|.*[Кк]одекс[уа])/));
        if (id.includes('resolution'))
            newSet = data.lawBase.filter(el => !!el.name.match(/^[Пп]роект [Пп]останови/));
        if (id.includes('proposal'))
            newSet = data.lawBase.filter(el => !!el.name.match(/^[Пп]ропозиці[яї] [Пп]резидент(а|ки)/));
        if (id.includes('euro'))
            newSet = data.lawBase.filter(el => el.isEuro === 1 || el.isEuro === true || el.isEuro === 'true');
        if (id.includes('urgent'))
            newSet = data.lawBase.filter(el => el.isUrgent === 1 || el.isUrgent === true || el.isUrgent === 'true');
    }
    else if (id.includes('status')) {
        if (id.includes('success'))
            newSet = data.lawBase.filter(el => el.statusClass === 'text-success');
        else if (id.includes('info'))
            newSet = data.lawBase.filter(el => el.statusClass === 'text-info');
        else if (id.includes('primary'))
            newSet = data.lawBase.filter(el => el.statusClass === 'text-primary');
        else if (id.includes('warning'))
            newSet = data.lawBase.filter(el => el.statusClass === 'text-warning');
        else if (id.includes('danger'))
            newSet = data.lawBase.filter(el => el.statusClass === 'text-danger');
        else
            newSet = data.lawBase.filter(el => el.statusClass === '');
    }
    else if (id.includes('act')) {
        if (id.includes('notaccept'))
            newSet = data.lawBase.filter(el => el.actNumber === null);
        else
            newSet = data.lawBase.filter(el => el.actNumber !== null);
    }
    else if (id.includes('clear'))
        newSet = data.lawBase;
    else throw 'unknown filter option.';

    if (newLawSet(newSet) === false)
        return ;

    $('#table_stat').children().remove();

    data.currentPage = 1;
    setMainTable();
}

export function findLawByNumberListener() {
    $("#filter-number").on('keyup', function(e) {
        if (e.which !== 13)
            return ;


        let value = this.value;//parseInt(this.value);

        /*if (Number.isNaN(value)) {
            return ;
        }*/

        if (this.value.length < 3)
            return ;

        let newSet = data.lawBase.filter(el => el.registrationNumber.includes(value));

        if (newLawSet(newSet) === false)
            return ;

        $('#table_stat').children().remove();

        data.currentPage = 1;
        setMainTable();
    });
}

/*
 */

export function scrollToEventListener() {
    $('.z_event_scrollto').on('click', function () {
        let row = jQuery(this).parent().parent().parent().parent();
        let el;
        if (data.table.type === 'standard') {
            el = row.children('.z_main_canvas_row').children('.z_event');
        }
        else {
            el = row.children('.z_solo_canvas_row').children('.z_solo_pl_container').children('.z_solo_passing_line').children();
        }
        el = jQuery(el[(el.length - 1).toString()]);

        if (el.length === 0)
            return ;

        data.table.scrollTo.target = el.attr('id');
        scrollToContent();
    });
}