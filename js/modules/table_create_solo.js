import {data} from "./data.js";
import {compareDates, newLawSet} from "./table_interactions_standard.js";
import {removeSoloListener, setSoloFilterListener} from "./table_interactions_solo.js";
import {setMainTable} from "./table_create_standard.js";
import {escText, parseJsonDate} from "./parse_text.js";
import {calcDateOffset} from "./misc.js";
import {getReviewClass, getSoloReadingIcon, getStatusClass} from "./get_class_regex.js";
import {getTimeDelta, getToday} from "./date_operations.js";
import {fetchLawSolo} from "./fetch.js";

export function createSoloTimeline(props) {//idProp) {
    let sid = getCookie('api');

    const proceed = async () => {
        let params, id, containerId;
        if (props.id !== undefined) {
            id = props.id.split(/(?<=[a-z])(?=\d+?)/)[1];
            let index = ($(`#open_full${id}`).parent().parent().parent().index() - 1) + ((data.currentPage - 1) * data.const.PAGE_SIZE);
            params = {"sid": sid, id: '-' + data.table.lawSet[index].id};
            containerId = `solo_timeline${id.match(/\d+/)}`;
        } else if (props.number !== undefined) {
            params = {"sid": sid, number: props.number};
            props.number = props.number.match(/\d+/);
            id = props.number;
            containerId = `solo_timeline${props.number}`;
        } else return false;

        let soloLaw = await fetchLawSolo(params);

        if (soloLaw === '' || typeof soloLaw !== "object" || soloLaw.id === undefined) {
            $('.z_loading_screen').html('<h2>Сталася помилка!</h2>');
            throw 'Loading the law has failed.';
        }
        if (newLawSet([soloLaw]) === false) {
            $('#' + props.id).html('<i class="fa fa-line-chart"></i>');
            return;
        }

        let result = `
    <div id="${containerId}" class="z_solo"></div>
    `;

        $('#table_stat').append(result);
        $('#z_panel_container_main, #z_table_wrapper_main').attr('style', 'display:none!important');

        let subjType = data.lawSubj.findIndex((el) => el === data.table.lawSet[0].subject);


        result = `
    <div id="z_panel_container_solo" class="z_panel_container">
        <div class="z_solo_title_container">
            ${setSoloLeft()}
            ${setSoloCenter()}
            ${setSoloRight()}
            <div class="zal-fullscreen">
                <button id="eventResize" class="btn btn-sm btn-outline-secondary"><i class="fa fa-arrows-alt"></i> <span>Розгорнути</span></button>
                <button id="eventSmall" class="btn btn-sm btn-outline-secondary"><i class="fa fa-compress"></i> <span>Згорнути</span></button>
            </div>
            ${(filterOptions.active === false || filterOptions.active === true && (filterOptions.number === undefined || filterOptions.number === null)) ? '<button id="z_solo_close" class="z_solo_close"><i class="fa fa-times" aria-hidden="true"></i></button>' : ''}
            <div class="z_solo_filter">
                <div id="filter_frs" class="btn-group dropdown">
                    <a class="btn btn-link btn-sm dropdown-toggle with-caret" href="javascript:void(0)" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-filter"></i><span class="d-none d-md-inline"> Фільтр</span></a>
                    <div class="dropdown-menu dropdown-menu-right dropdown-sm" data-url="" style="will-change: transform;">
                        <div class="dropdown-header bold">Групи подій:</div>
                        <a class="dropdown-item filter z_solo_filter_item" data-type="documents" href="javascript:void(0)"><i class="fa fa-check-circle i_doc"></i> Документи</a>
                        <a class="dropdown-item filter z_solo_filter_item" data-type="chronology" href="javascript:void(0)"><i class="fa fa-check-circle i_chr"></i> Хронологія</a>
                        <a class="dropdown-item filter z_solo_filter_item" data-type="passings" href="javascript:void(0)"><i class="fa fa-check-circle i_pas"></i> Проходження</a>
                        <a class="dropdown-item filter z_solo_filter_item" data-type="committee" href="javascript:void(0)"><i class="fa fa-check-circle i_com"></i> Комітети</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item nofilter z_solo_filter_clear" href="javascript:void(0)">Очистити</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    `;
        $('#table_stat').prepend(result);
        setTimeout(() => removeSoloListener(), 50);
        data.table.type = 'solo';// + id; TESTING

        setMainTable('#' + containerId, '#z_show_solo' + id);
        if (id !== undefined)
            setTimeout(() => {
                $('#open_full' + id).html('<i class="fa fa-line-chart"></i>');
                setSoloFilterListener();
            }, 10);

        $('.z_loading_screen').remove();
    }

    let soloPromise;
    if (sid === null) {
        let count = 0;
        let intervalId = setInterval(() => {
            sid = getCookie('api');

            if (sid !== null || count === 10) {
                soloPromise = proceed();
                clearInterval(intervalId);
            }
            count += 0.5;
        }, 500);
    } else {
        soloPromise = proceed();
    }
}

export function setSoloLeft() {
    let result = '';
    let subjType = data.lawSubj.findIndex((el) => el === data.table.lawSet[0].subject);

    result = `
        <div class="z_solo_left">
            <div class="z_solo_left_title">
                <a href="${data.table.lawSet[0].url}" target="_blank" rel="tooltip" data-toggle="tooltip" data-placement="right" data-html="true" title=""
                data-original-title="Перейти до повної сторінки">${data.table.lawSet[0].registrationNumber}</a>
                <div class="z_solo_left_subject ${data.lawSubjColor[subjType]}" rel="tooltip" data-toggle="tooltip" data-placement="right"
                    data-html="true" title=""
                    data-original-title="${data.lawSubj[subjType]}">
                        ${data.lawSubjSign[subjType]}
                    ${(data.table.lawSet[0].isUrgent === 1 || data.table.lawSet[0].isUrgent === true || data.table.lawSet[0].isUrgent === 'true') ?
        `<i class="fa fa-circle" style="font-size:0.7rem" aria-hidden="true"></i>` : ''}
                </div>
            </div>
            <div class="badge badge-pill badge-${(data.table.lawSet[0].statusClass === 'text-none') ?
        'secondary' : data.table.lawSet[0].statusClass.split('-')[1]}">${data.table.lawSet[0].currentPhase.status}</div>
        <button class="btn btn-outline-secondary z_solo_stats_open" rel="tooltip" data-toggle="tooltip" data-placement="right" data-html="true" title=""
            data-original-title="Відкрити статистику витраченого часу">
        <i class="fa fa-pie-chart" aria-hidden="true"></i></button>
        </div>
    `;

    return result;
}

export function setSoloCenter() {
    let result = '';

    let mainExecutives = '';
    data.table.lawSet[0].mainExecutives.forEach(mExec => {
        let person;

        for (let i = 0; i < data.table.lawSet[0].workOutCommittees.length; i++)
            if (mExec.person.id === data.table.lawSet[0].workOutCommittees[i].person_id) {
                person = data.table.lawSet[0].workOutCommittees[i].person;
                break;
            }

        if (person !== undefined) {
            mainExecutives += `
                <span class="mp-card">
                    <span class="full full-adapted text-center"
                        rel="tooltip" data-toggle="tooltip" data-placement="right" data-html="true" title=""
                        data-original-title="
                            <span><small><i class='fa fa-flag' title='Головний комітет' aria-hidden='true'></i> ${person.department_name}
                            <div class='text-warning'>${person.post_name}</div></small></span>
                            <span><b>${escText(person.surname)}</b><br/>${person.firstname} ${person.patronymic}</span>
                        ">
                        <span class="ava">
                            <a href="https://meeting.rada.gov.ua/work/vote/${person.nreg}"
                                class="avaimg ${person.nreg}" target="_blank"></a>
                        </span>
                    </span>
                </span>
            `;
        }
    });
    let executives = '';
    data.table.lawSet[0].executives.forEach(exec => {
        let person;

        for (let i = 0; i < data.table.lawSet[0].workOutCommittees.length; i++)
            if (exec.person.id === data.table.lawSet[0].workOutCommittees[i].person_id) {
                person = data.table.lawSet[0].workOutCommittees[i].person;
                break;
            }

        if (person !== undefined) {
            executives += `
                <span class="mp-card">
                    <span class="full full-adapted text-center">
                        <span class="ava" rel="tooltip" data-toggle="tooltip" data-placement="right" data-html="true" title=""
                            data-original-title="
                            <span><small>${person.department_name}
                            <div class='text-warning'>${person.post_name}</div></small></span>
                            <span><b>${escText(person.surname)}</b><br/>${person.firstname} ${person.patronymic}</span>">
                            <a href="https://meeting.rada.gov.ua/work/vote/${person.nreg}"
                                class="avaimg ${person.nreg}" target="_blank"></a>
                        </span>
                    </span>
                </span>
            `;
        }
    });

    let executivesBar = `
        <div class="z_solo_exec_bar scroll-light">
            ${mainExecutives}
            ${executives}
        </div>
    `;

    result = `
        <div class="z_solo_center bold">
            <div class="z_solo_center_title">
                ${(data.table.lawSet[0].isEuro === 1 || data.table.lawSet[0].isEuro === true || data.table.lawSet[0].isEuro === 'true') ?
        `<img class="z_solo_euro_pic" src="https://zakonst.rada.gov.ua/images/euro.png" title="Євроінтеграційний законопроект">` : ''}
                <h4>${data.table.lawSet[0].name}</h4>
            </div>
            ${executivesBar}
        </div>
    `;

    return result;
}

export function setSoloRight() {
    return `<div class="z_solo_right"></div>`;
}

export function setSoloDocumentsFirst(document, index) {

    let first_info = `
        <div class="z_info z_info_documents" data-time-start="${document.sortDateStart}" data-time-end="${document.sortDateEnd}"
        ${(document.first.tooltip !== null) ? `rel="tooltip" data-toggle="tooltip" data-placement="right" data-html="true" title="" data-original-title="${document.first.tooltip}"` : ''}>
        <div class="z_subject">${document.sortDateStart.split('T')[0].split('-').reverse().join('.')}</div>
            <div class="z_id">
                
            </div>
            <div class="z_status">
            ${document.first.reading}
            <div class="z_status_title">${document.sortName}</div>
                <button class="z_event_scrollto" title="Скролити до першої події у таблиці">
                <i class="fa fa-forward" aria-hidden="true"></i>                </button>
            </div>
            <div class="z_name scroll-light">
                ${document.first.name}
            </div>
        </div>
        `;

    $(`#first_r_documents${index + 1}`).append(first_info);
    $("[data-toggle='tooltip']").tooltip();
}

export function setSoloChronologyFirst(law, index) {
    let first_info = `
        <div class="z_info z_info_chronology"
            data-time-start="${(law.chronology[index].date_first !== undefined) ? law.chronology[index].date_first : law.chronology[index].date_agenda}"
            data-time-end="${(law.chronology[index].date_last !== undefined) ? law.chronology[index].date_last : law.chronology[index].date_agenda}">
        <div class="z_subject">${(law.chronology[index].date_first !== undefined) ? law.chronology[index].date_first.split(' ')[0].split('-').reverse().join('.') : law.chronology[index].date_agenda.split('-').reverse().join('.')}</div>
            <div class="z_id">
                
            </div>
            <div class="z_status"><div class="z_status_title ${(law.chronology[index].seen_class !== null) ? (law.chronology[index].seen_class.includes('muted')) ? law.chronology[index].seen_class : `badge badge-pill badge-${law.chronology[index].seen_class.split('-')[1]}` : ''}">
                ${law.chronology[index].seen_text}
            </div>
                <button class="z_event_scrollto" title="Скролити до першої події у таблиці">
                <i class="fa fa-forward" aria-hidden="true"></i>                </button>
            </div>
            <div class="z_name scroll-light">
                ${(law.chronology[index].considered !== "notseen") ? `<div>${(law.chronology[index].status) ? law.chronology[index].status : law.chronology[index].seen_text}</div> <a href="${law.chronology[index].url}" target="_blank"><i class="fa fa-external-link" aria-hidden="true"></i></a>` : `<div>${law.chronology[index].seen_text}</div>`}
            </div>
        </div>
        `;

    $(`#first_r_chronology${index + 1}`).append(first_info);
    $("[data-toggle='tooltip']").tooltip();
}

export function setSoloPassingsFirst(law, index) {
    let status = law.passings[index].status;

    let first_info = `
        <div id="z_info_passing${index + 1}" class="z_info z_info_passing" style="border-left:3px solid ${data.table.lawSet[0].color_stat[law.passings[index].title]}" data-time-start="${(index !== law.passings.length - 1) ? law.passings[index + 1].date : law.passings[index].date}" data-time-end="${law.passings[index].date}">
        <div class="z_subject">${law.passings[index].date.split('T')[0].split('-').reverse().join('.')}</div>
            <div class="z_id">
                
            </div>
            <div class="z_status"><div class="z_status_title ${getStatusClass(status)}">${status}</div>
                <button class="z_event_scrollto" title="Скролити до першої події у таблиці">
                <i class="fa fa-forward" aria-hidden="true"></i></button>
            </div>
            <div class="z_name scroll-light">
                ${law.passings[index].title}
            </div>
        </div>
        `;

    $(`#first_r_passings${index + 1}`).append(first_info);
    $("[data-toggle='tooltip']").tooltip();
}

export function setSoloCommitteeFirst(committee, index) {
    let dataTime = (committee.date_send !== null) ? committee.date_send : null;
    if (dataTime !== null) {
        dataTime = dataTime.split('T');
        dataTime[1] = dataTime[1].split(':');
        dataTime[1][2] = (parseFloat(dataTime[1][2]) + ((committee.is_main === 1) ? 0.01 : 0.02)).toString();
        dataTime[1] = dataTime[1].join(':');
        dataTime = dataTime.join('T');
    }

    let daysFirst = '';

    if (committee.days !== null) {
        let days = parseInt(committee.days);

        /*if (!(days % 100 > 9 && days % 100 < 21) && !(days % 10 === 0 || days % 10 > 4)) {
            if (days % 10 === 1) daysFirst = 'день';
            else if (days % 10 > 1 && days % 10 < 5) daysFirst = 'дні';
        } else daysFirst = 'днів';
*/
        daysFirst = 'дн.';
        daysFirst = `${days} ${daysFirst}`;
    }

    let first_info = `
        <div class="z_info z_info_committee ${(committee.date_fact !== null) ? 'considered' : ''}" data-time-start="${dataTime}" data-time-end="${committee.date_fact}" rel="tooltip" data-toggle="tooltip" data-placement="right" data-html="true" title="" data-original-title='
            <div class="p-3">
                <span class="mp-card">
                    <span class="full full-adapted text-center">
                        <span class="ava">
                            <a href="https://meeting.rada.gov.ua/work/vote/${committee.person.nreg}" class="avaimg ${committee.person.nreg}" target="_blank"></a>
                        </span>
                        <span><b>${escText(committee.person.surname)}</b><br/>${escText(committee.person.firstname + ' ' + committee.person.patronymic)}</span>
                    </span>
                </span>
            <div class="small text-warning my-1">${committee.person.post_name}</div>
            <div>${escText(committee.person.department_name)}</div>
                ${(committee.is_main === 1) ? '<div class="small text-success mt-1"><b>Головний комітет</b></div>' : ''}
            </div>'>
            <div class="z_subject" ${(committee.date_fact !== null) ? '' : 'style="font-size:0.8rem;color:#aaa"'}><span>${(committee.date_receive !== null) ? (committee.date_fact !== null) ? [...committee.date_fact.split('T')[0].split('-')].reverse().join('.') : 'Не виконано' : 'Не отримано'}</span>
                <small>(${daysFirst})</small>
            </div>
            <div class="z_id">
                
            </div>
            <div class="z_status">
                <div class="z_status_title">${committee.status}</div>
                <button class="z_event_scrollto" title="Скролити до першої події у таблиці">
                <i class="fa fa-forward" aria-hidden="true"></i>
                </button>
            </div>
            <div class="z_name scroll-light">
                ${(committee.is_main === 1) ?
        '<i class="fa fa-flag" style="" rel="tooltip" data-toggle="tooltip" data-placement="bottom" data-html="true" title="" data-original-title="Головний комітет" aria-hidden="true"></i>' : ''}
                ${escText(committee.person.department_name) }
            </div>
        </div>
        `;

    $(`#first_r_committee${index + 1}`).append(first_info);
    $("[data-toggle='tooltip']").tooltip();
}

export function processDocuments() {
    if (data.table.lawSet[0].chronology === undefined)
        return ;

    let table = data.table.lawSet[0];
    let documentsArray = [];

    table.documents.source.forEach((source, i) => {
        let sourceDateStart = parseJsonDate(source.outcomingDate);
        let sourceDateEnd = parseJsonDate(source.publishDate);
        let sourceDateReg = parseJsonDate(source.registrationDate);
        let sourceDocs = (source.docFiles.length > 1) ? `<i class="fa fa-files-o" aria-hidden="true"></i>` : '';
        source.docFiles.forEach((sourceFile, index) => sourceDocs +=
            `<a href='${sourceFile.url}' target="_blank" title="${sourceFile.type}">
                ${(source.docFiles.length === 1) ? `<i class="fa fa-file-o" aria-hidden="true"></i>` : `[${index + 1}]`}</a>`);

        //todo source.preparation.forEach(...);

        let info = {
            leftSide: calcDateOffset(sourceDateStart[0][0], sourceDateStart[0][1], sourceDateStart[0][2]),
            rightSide: calcDateOffset(sourceDateEnd[0][0], sourceDateEnd[0][1], sourceDateEnd[0][2]) + data.soloDayWidth,
            workWidth: undefined,
            workID: `work_source${i + 1}`,
            workClass: 'z_solo_passing_source',
            workInner: '',
            workTooltip: false,
            workTitle: '',//`<a href='${sourceFile.url}'>${sourceFile.type}</a>`,
            sortName: (source.procedureName !== null && source.procedureName !== '') ? source.procedureName : 'Текст законопроекту та супровідні документи',
            sortDateStart: source.outcomingDate,
            sortDateEnd: source.publishDate,
            leftTitle: `Створено<br/>${[...sourceDateStart[0]].reverse().join('.')}<br/>${[...sourceDateStart[1]].join(':')}`,
            rightTitle: `Опубліковано<br/>${[...sourceDateEnd[0]].reverse().join('.')}<br/>${[...sourceDateEnd[1]].join(':')}`,
            rightID: `right_source${i + 1}`,
            first: {
                tooltip: `
                    <b>${source.kind}</b>
                    <br/>
                    Створено:
                    <br/>
                    ${source.outcomingNum} від ${[...sourceDateStart[0]].reverse().join('.')} ${[...sourceDateStart[1]].join(':')}
                    <br/>
                    Зареєстровано: ${source.registrationNum} від ${[...sourceDateReg[0]].reverse().join('.')} ${[...sourceDateReg[1]].join(':')}
                    <br/>
                    Опубліковано: ${[...sourceDateEnd[0]].reverse().join('.')} ${[...sourceDateEnd[1]].join(':')}
                `,
                subject: '',
                id: '',
                status: '',
                name: `<div>${source.kind}</div>${sourceDocs}`,
                reading: getSoloReadingIcon(source.procedureName),
                docNum: source.docFiles.length
            }
        };
        info.workWidth = info.rightSide - info.leftSide;
        documentsArray.push(info);
    });

    if (table.documents.workflow.length !== 0)
        table.documents.workflow.forEach((event, i) => {
            let workflowDateStart = parseJsonDate((event.outcomingDate !== null) ? event.outcomingDate : event.registrationDate);
            let workflowDateEnd = parseJsonDate(event.publishDate);
            let workflowDateReg = parseJsonDate(event.registrationDate);
            let workflowDocs = (event.docFiles.length > 1) ? `<i class="fa fa-files-o" aria-hidden="true"></i>` : '';
            event.docFiles.forEach((file, index) => workflowDocs +=
                `<a href='${file.url}' target="_blank" title="${file.type}">
                ${(event.docFiles.length === 1) ? `<i class="fa fa-file-o" aria-hidden="true"></i>` : `[${index + 1}]`}</a>`);
            if (event.short_review !== null)
                event.short_review = escText(event.short_review);
            let info = {
                leftSide: calcDateOffset(workflowDateStart[0][0], workflowDateStart[0][1], workflowDateStart[0][2]),
                rightSide: calcDateOffset(workflowDateEnd[0][0], workflowDateEnd[0][1], workflowDateEnd[0][2]) + data.soloDayWidth,
                workWidth: undefined,
                workID: `work_workflow${i + 1}`,
                workClass: 'z_solo_passing_workflow',
                workInner: '',
                workTooltip: false,//(event.short_review !== null),
                workTitle: (event.short_review !== null) ? `<br/><small>${event.short_review}</small>` : '',
                sortName: (event.procedureName !== null && event.procedureName !== '') ? event.procedureName : 'Документи, пов\'язані із роботою',
                sortDateStart: (event.outcomingDate !== null) ? event.outcomingDate : event.registrationDate,
                sortDateEnd: event.publishDate,
                leftTitle: `Створено<br/>${[...workflowDateStart[0]].reverse().join('.')}<br/>${[...workflowDateStart[1]].join(':')}`,
                rightTitle: `Опубліковано<br/>${[...workflowDateEnd[0]].reverse().join('.')}<br/>${[...workflowDateEnd[1]].join(':')}`,
                rightID: `right_workflow${i + 1}`,
                first: {
                    tooltip: `
                        <b>${event.kind}</b>
                        ${(event.formal_review !== null) ? `<br/><div class='${getReviewClass(event.formal_review)}'>${event.formal_review}</div>` : ''}
                        ${(event.short_review !== null) ? `<small>${event.short_review}</small>` : ''}
                        <br/>
                        Створено:
                        <br/>
                        ${event.outcomingNum} від ${[...workflowDateStart[0]].reverse().join('.')} ${[...workflowDateStart[1]].join(':')}
                        <br/>
                        Зареєстровано: ${event.registrationNum} від ${[...workflowDateReg[0]].reverse().join('.')} ${[...workflowDateReg[1]].join(':')}
                        <br/>
                        Опубліковано: ${[...workflowDateEnd[0]].reverse().join('.')} ${[...workflowDateEnd[1]].join(':')}
                    `,
                    subject: '',
                    id: '',
                    status: '',
                    name: `<div>${event.kind}</div>${workflowDocs}`,
                    reading: getSoloReadingIcon(event.procedureName),
                    docNum: event.docFiles.length
                }
            };
            info.workWidth = info.rightSide - info.leftSide;
            documentsArray.push(info);
        });

    if (table.actNumber !== null) {
        let actDate = parseJsonDate(table.actDate, 'd');
        documentsArray.push({
            leftSide: calcDateOffset(actDate[0], actDate[1], actDate[2]),
            workID: `work_act1`,
            workClass: 'z_solo_passing_act',
            workInner: '',
            workTooltip: true,
            workTitle: `Акт прийнято:<br/>${table.actNumber} від ${[...actDate].reverse().join('.')}`,
            sortName: 'Акт прийнято',
            sortDateStart: table.actDate,
            sortDateEnd: table.actDate,
            leftTitle: ``,
            rightTitle: ``,
            rightID: `right_act1`,
            first: {
                tooltip: `${table.actNumber} від ${[...actDate].reverse().join('.')}`,
                subject: '',
                id: '',
                status: '',
                name: `${table.actNumber} від ${[...actDate].reverse().join('.')} <a href="${table.actUrl}" target="_blank"><i class="fa fa-external-link" aria-hidden="true"></i></a>`,
                reading: '',
                docNum: 1
            }
        });
    }

    table.agenda.forEach((agenda, index) => {
        let agendaDate = parseJsonDate(agenda.date, 'd');
        documentsArray.push({
            leftSide: calcDateOffset(agendaDate[0], agendaDate[1], agendaDate[2]),
            workID: `work_agenda1`,
            workClass: 'z_solo_passing_agenda',
            workInner: '',
            workTooltip: true,
            workTitle: `Включено до порядку денного:<br/>${agenda.number} від ${[...agendaDate].reverse().join('.')}`,
            sortName: 'Включено до порядку денного',
            sortDateStart: agenda.date,
            sortDateEnd: agenda.date,
            leftTitle: ``,
            rightTitle: ``,
            rightID: `right_agenda${index + 1}`,
            first: {
                tooltip: `${agenda.number} від ${[...agendaDate].reverse().join('.')}`,
                subject: '',
                id: '',
                status: '',
                name: `${agenda.number} від ${[...agendaDate].reverse().join('.')} <a href="${agenda.url}" target="_blank"><i class="fa fa-external-link" aria-hidden="true"></i></a>`,
                reading: '',
                docNum: 1
            }
        });
    });

    let i = 0;
    for (; i < documentsArray.length; i++) {
        let info = documentsArray[i];

        setSoloDocumentsFirst(info, i);

        let infoObject = {
            type: 'document',
            index: i + 1,
            dateFirst: getTimeDelta(info.sortDateStart, data.table.lawSet[0].date_begin) / data.table.lawSet[0].time_line * 100,
            dateLast: getTimeDelta(info.sortDateEnd, data.table.lawSet[0].date_begin) / data.table.lawSet[0].time_line * 100,
            lines: [{leftSide: info.leftSide, elements: [info]}]
        };
        let passingLineProps = createPassingLineProps(infoObject);
        let workflow = makePassingLine(passingLineProps, i + 1, info);

        $(`#z_solo_canvas_row_documents${i + 1}`).append(workflow);

        data.table.eventsSet.push(infoObject);
    }
    data.soloLineCount += i;
    $("[data-toggle='tooltip']").tooltip();
}

export function processChronology() {
    if (data.table.lawSet[0].chronology === undefined)
        return ;

    let i = 0;
    for (; i < data.table.lawSet[0].chronology.length; i++) {
        let el = data.table.lawSet[0].chronology[i];

        let info = calcChronologyPassings(el, i);
        let infoObject = {
            type: 'chronology',
            index: i + 1,
            dateFirst: getTimeDelta(el.date_first !== undefined ? el.date_first : el.date_agenda, data.table.lawSet[0].date_begin) / data.table.lawSet[0].time_line * 100,
            dateLast: 0,
            lines: [{leftSide: info.leftSide, elements: [info]}]
        };
        let passingLineProps = createPassingLineProps({type: 'chronology', index: i + 1, lines: [{leftSide: info.leftSide, elements: [info]}]});
        let workflow = makePassingLine(passingLineProps, i + 1, el);

        $(`#z_solo_canvas_row_chronology${i + 1}`).append(workflow);

        data.table.eventsSet.push(infoObject);
    }
    data.soloLineCount += i;
    $("[data-toggle='tooltip']").tooltip();

}

export function processPassings() {
    if (data.table.lawSet[0].passings === undefined)
        return ;

    let i = 0;
    for (; i < data.table.lawSet[0].passings.length; i++) {
        let el = data.table.lawSet[0].passings[i];

        let info = calcGeneralPassings(el, (i !== data.table.lawSet[0].passings.length - 1) ? data.table.lawSet[0].passings[i + 1] : el, i);
        let infoObject = {
            type: 'passing',
            index: i + 1,
            dateFirst: el.from / data.table.lawSet[0].time_line * 100,
            dateLast: (el.from + el.len) / data.table.lawSet[0].time_line * 100,
            lines: [{leftSide: info.leftSide, elements: [info]}]};
        let passingLineProps = createPassingLineProps(infoObject);
        let workflow = makePassingLine(passingLineProps, i + 1, el);

        $(`#z_solo_canvas_row_passings${i + 1}`).append(workflow);

        data.table.eventsSet.push(infoObject);
    }
    data.soloLineCount += i;
    $("[data-toggle='tooltip']").tooltip();
}

export function processCommittees() {
    if (data.table.lawSet[0].workOutCommittees === undefined)
        return ;
    if (data.table.lawSet[0].workOutCommittees.length === 0)
        return ;
    let i = 0;
    for (; i < data.table.lawSet[0].workOutCommittees.length; i++) {
        let committee = data.table.lawSet[0].workOutCommittees[i];

        let info = calcCommitteePassings(committee, i);
        let infoObject = {
            type: 'committee',
            index: i + 1,
            dateFirst: getTimeDelta(committee.date_send, data.table.lawSet[0].date_begin) / data.table.lawSet[0].time_line * 100,
            dateLast: getTimeDelta((committee.date_fact !== null) ? committee.date_fact : data.table.lawSet[0].date_end, data.table.lawSet[0].date_begin) / data.table.lawSet[0].time_line * 100,
            lines: [{leftSide: info.leftSide, elements: [info]}]
        };
        let passingLineProps = createPassingLineProps(infoObject);

        let workflow = makePassingLine(passingLineProps, i + 1);

        $(`#z_solo_canvas_row_committee${i + 1}`).append(workflow);

        data.table.eventsSet.push(infoObject);
    }
    data.soloLineCount += i;
    $("[data-toggle='tooltip']").tooltip();
}

export function calcChronologyPassings(el, index) {
    let info = {
        leftDate: (el.date_first !== undefined) ? parseJsonDate(el.date_first) : [parseJsonDate(el.date_agenda, 'd')],
        rightDate: (el.date_last !== undefined) ? parseJsonDate(el.date_last) : [parseJsonDate(el.date_agenda, 'd')],
        leftSide: undefined,
        rightSide: undefined,
        workID: `work_chronology${index + 1}`,
        workClass: (el.seen_class !== null) ? `bg-${el.seen_class.split('-')[1]}` : '',
        workWidth: undefined,
        totalWidth: undefined,
        workTooltip: false,
        workTitle: '',
        workInner: '',
        leftTitle: undefined,
        rightTitle: undefined,
        rightID: `right_chronology${index + 1}`
    };

    info.leftTitle = `Надано на розгляд<br/>${[...info.leftDate[0]].reverse().join('.')}${(info.leftDate.length === 2) ? `<br/>${[...info.leftDate[1]].join(':')}` : ''}`;
    info.rightTitle = `${el.seen_text}<br/>${[...info.rightDate[0]].reverse().join('.')}${(info.rightDate.length === 2) ? `<br/>${[...info.rightDate[1]].join(':')}` : ''}`;

    info.leftSide = calcDateOffset(info.leftDate[0][0], info.leftDate[0][1], info.leftDate[0][2]);
    info.rightSide = calcDateOffset(info.rightDate[0][0], info.rightDate[0][1], info.rightDate[0][2]) + data.soloDayWidth;
    info.totalWidth = info.rightSide - info.leftSide;

    info.workWidth = info.totalWidth;

    return info;
}

export function calcGeneralPassings(el, next, index) {
    let info = {
        leftDate: parseJsonDate(next.date),
        rightDate: parseJsonDate(el.date),
        leftSide: undefined,
        rightSide: undefined,
        workID: `work_passing${index + 1}`,
        workClass: 'z_solo_passing_general',
        workWidth: undefined,
        totalWidth: undefined,
        workTooltip: false,
        workTitle: '',
        workInner: '<div class="z_solo_passing_general_event"></div>',
        leftTitle: undefined,
        rightTitle: undefined,
        rightID: `right_passing${index + 1}`
    };

    info.leftTitle = `${el.status}<br/>${[...info.leftDate[0]].reverse().join('.')}<br/>${[...info.leftDate[1]].join(':')}`;
    info.rightTitle = `${el.title}<br/>${[...info.rightDate[0]].reverse().join('.')}<br/>${[...info.rightDate[1]].join(':')}`;

    info.leftSide = calcDateOffset(info.leftDate[0][0], info.leftDate[0][1], info.leftDate[0][2]);
    info.rightSide = calcDateOffset(info.rightDate[0][0], info.rightDate[0][1], info.rightDate[0][2]) + data.soloDayWidth;
    info.totalWidth = info.rightSide - info.leftSide;

    info.workWidth = info.totalWidth;

    return info;
}

export function calcCommitteePassings(el, index) {
    let info = {
        dateSend: parseJsonDate(el.date_send),
        dateReceive: (el.date_receive !== null) ? parseJsonDate(el.date_receive) : null,
        datePlan: (el.date_plan !== null) ? parseJsonDate(el.date_plan) : null,
        dateFact: (el.date_fact !== null) ? parseJsonDate(el.date_fact) : null,
        leftSide: undefined,
        rightSide: undefined,
        receiveWidth: undefined,
        workID: `work_committee${index + 1}`,
        workClass: 'z_solo_passing_committee',
        totalWidth: undefined,
        workWidth: undefined,
        workTooltip: false,
        workTitle: '',
        workInner: '',
        leftTitle: undefined,
        startWorkTitle: undefined,
        rightTitle: undefined,
        rightID: `right_committee${index + 1}`,
        events: []
    };

    info.leftSide = calcDateOffset(info.dateSend[0][0], info.dateSend[0][1], info.dateSend[0][2]);
    info.leftTitle = `Направлено:<br/>${[...info.dateSend[0]].reverse().join('.')}<br/>${[...info.dateSend[1]].join(':')}`;

    if (info.dateReceive !== null) {
        if (info.dateFact !== null) {
            info.rightSide = calcDateOffset(info.dateFact[0][0], info.dateFact[0][1], parseInt(info.dateFact[0][2]) + 1);
            info.rightTitle = `Виконано:<br/>${[...info.dateFact[0]].reverse().join('.')}<br/>${[...info.dateFact[1]].join(':')}`;
        } else {
            info.rightSide = calcDateOffset(data.table.endingDate[0], data.table.endingDate[1], parseInt(data.table.endingDate[2]) + 1);
            info.rightTitle = 'Робота не закінчена';
        }

        info.startWorkTitle = `Отримано:<br/>${[...info.dateReceive[0]].reverse().join('.')}<br/>${[...info.dateReceive[1]].join(':')}`;

        if (info.dateSend[0][1] === info.dateReceive[0][1] && info.dateSend[0][2] === info.dateReceive[0][2]) {
            info.receiveWidth = 0;
            info.leftTitle += `<br/>` + info.startWorkTitle;
        } else info.receiveWidth = calcDateOffset(info.dateReceive[0][0], info.dateReceive[0][1], parseInt(info.dateReceive[0][2])) - info.leftSide;

        info.workWidth = info.rightSide - info.leftSide - info.receiveWidth;
    } else {
        info.workWidth = 0;
        info.startWorkTitle = 'Ще не отримано';

        let rightDate = getToday();
        if (data.table.endingDate[0] < rightDate[0] ||
            (data.table.endingDate[0] >= rightDate[0] && data.table.endingDate[1] < rightDate[1]))
            rightDate = [...data.table.endingDate];

        info.rightSide = calcDateOffset(rightDate[0], rightDate[1], parseInt(rightDate[2]) + 1);
        info.rightTitle = 'Робота не закінчена';
        info.receiveWidth = info.rightSide - info.leftSide;
    }

    info.totalWidth = info.rightSide - info.leftSide;

    return info;
}

export function createPassingLineProps(infoObject) {
    let props = {
        container: {
            id: `z_solo_pl_container_${infoObject.type}${infoObject.index}`,
            class: `z_solo_pl_container`
        },
        lines: []
    };

    infoObject.lines.forEach((infoLine, i) => {
        if (infoLine.leftSide === undefined)
            return ;

        props.lines.push({
            id: `z_solo_passing_line${infoObject.index}${data.soloLineCount + i}`,
            class: `z_solo_passing_line`,
            offset: `${infoLine.leftSide}px`,
            elements: [],
            postScriptum: infoLine.postScriptum
        });

        infoLine.elements.forEach((info, index) => {

            for (const property in info)
                if (typeof info[property] === 'number')
                    info[property] = parseFloat(info[property].toFixed(4));

            let currentLine = props.lines[props.lines.length - 1];

            if (info.workWidth === undefined)
                info.workWidth = data.soloDayWidth;
            if (info.totalWidth === undefined)
                info.totalWidth = info.workWidth;
            if (info.rightSide === undefined)
                info.rightSide = infoLine.leftSide + info.workWidth;

            if (info.workClass.includes('sideless') === false)
                currentLine.elements.push({id: ``,
                    class: `z_solo_passing_side`,
                    tooltip: true,
                    title: info.leftTitle,
                    width: `${data.soloEventWidth}px`});

            if (info.receiveWidth !== undefined && info.receiveWidth !== 0) {
                if (info.workWidth !== 0) {
                    info.workWidth = info.workWidth - data.soloEventWidth * 1.5;
                    info.receiveWidth = info.receiveWidth - data.soloEventWidth * 1.5;
                } else info.receiveWidth = info.receiveWidth - data.soloEventWidth * 2;

                currentLine.elements.push({
                    id: ``,
                    class: `z_solo_passing_receive ${info.workClass}`,
                    tooltip: true,
                    title: ``,
                    width: `${info.receiveWidth}px`
                });

                currentLine.elements.push({
                    id: ``,
                    class: `z_solo_passing_side`,
                    tooltip: true,
                    title: info.startWorkTitle,
                    width: `${data.soloEventWidth}px`
                });
            } else if (info.workWidth !== 0) info.workWidth -= data.soloEventWidth * 2;

            if (info.workWidth !== 0) {
                currentLine.elements.push({
                    id: (info.workID !== undefined) ? info.workID : '',
                    class: `z_solo_passing_work ${info.workClass} ${(info.workClass.includes('event')) ? (infoLine.elements.length === 1) ? 'z_singular' : (index === 0) ? 'z_front' : '' : ''}`,
                    tooltip: info.workTooltip,
                    title: info.workTitle,
                    inner: info.workInner,
                    width: `${info.workWidth}px`
                });

                if (info.workClass.includes('sideless') === false)
                    currentLine.elements.push({
                        id: info.rightID,
                        class: `z_solo_passing_side`,
                        tooltip: true,
                        title: info.rightTitle,
                        width: `${data.soloEventWidth}px`
                    });
            }
        });
    });

    return props;
}

export function makePassingLine(props, index) {
    if (props === undefined)
        return ;

    let result = `
    <div
        id="${props.container.id}"
        class="${props.container.class}">
        `;

    props.lines.forEach(line => {
        result += `<div
                id="${line.id}"
                class="${line.class}"
                style="padding-left: ${line.offset}"
            >`;
        line.elements.forEach(el => {
            result += `
                <div 
                    id="${el.id}"
                    class="${el.class}" 
                    style="width: ${el.width}" 
                    ${(el.tooltip === true) ?
                `rel="tooltip" 
                    data-toggle="tooltip" 
                    data-placement="top" 
                    data-html="true" 
                    title="" 
                    data-original-title="${el.title}"
                    ` : ''}
                >${(el.inner !== undefined) ? el.inner: ''}</div>
                `;
        });
        if (line.postScriptum !== undefined)
            result += line.postScriptum;
        result += `</div>`;
    });
    result += `</div>`;

    return result;
}

export function sortSoloRows() {
    let table = $(`#z_show_${data.table.type}`);

    let calendarRow = table.children('.z_row.calendar');
    let rowArray = table.children('.z_row:not(.calendar)');

    rowArray.sort(compareDates);

    let result = calendarRow.prop('outerHTML');
    rowArray = Object.values(rowArray).slice(0, -2);
    rowArray.map(el => {
        result += jQuery(el).prop('outerHTML');
    });

    table.prop('innerHTML', result);
    $("[data-toggle='tooltip']").tooltip();
}

/*
 */

export function setSoloProgressBar() {
    let result = '';

    result = `<div id="z_solo_progress_row" class="z_row">
        <div id="z_solo_progress_container">
            <div id="z_solo_progress">
                `+/*<div id="z_solo_progress_bar"></div>*/`
                <div id="z_solo_progress_location"></div>
            </div>
        </div>
    </div>`;

    $(`#z_panel_container_solo`).append(result);

    let passingEventsSet = data.table.eventsSet.filter(el => el.type.includes('passing'));

    let totalWidth = data.table.lawSet[0].time_line;
    let totalLen = data.table.lawSet[0].passings.reduce((total, el) => total + el.len, 0);

    data.table.lawSet[0].passings.forEach((el, i) => {
        let lineLeft = el.from / totalWidth * 100;

        let lineWidth = el.len / totalWidth * 100;
        let lineDaysClass = 'text-secondary';
        if (totalWidth > 30 * 86400) {
            if (lineWidth > 30)
                lineDaysClass = 'text-danger';
            else if (lineWidth > 10)
                lineDaysClass = 'text-warning';
        }
        if (lineWidth <= 0.633 && lineLeft + 0.633 < 100)
            lineWidth = 0.633;
        lineWidth += '%';

        let lineDays = Math.floor(el.len / 86400);
        if (lineDays === 0)
            lineDays = Math.floor(el.len / 3600) + ' год.';
        else lineDays += ' дн.';

        let lineTarget = `z_info_${passingEventsSet[i].type}${passingEventsSet[i].index}`;

        $('#z_solo_progress').prepend(`<div id="z_solo_pb_el_passing${i + 1}" class="z_solo_pb_el"
        style="background-color:${data.table.lawSet[0].color_stat[el.title]};left:${lineLeft}%;width:${lineWidth};z-index:3"
        rel="tooltip" data-toggle="tooltip" data-placement="bottom" data-html="true" title=""
        data-original-title=
            "<small class='font-weight-bold text-warning'>${el.status} &#x2192;</small><br/>
            ${el.title}<br/>
            <small class='${lineDaysClass} font-weight-bold'>${lineDays}</small>"
        data-target="${lineTarget}"></div>`);
    });

    let lineDays = Math.floor((totalWidth - totalLen) / 86400);
    if (lineDays === 0)
        lineDays = Math.floor((totalWidth - totalLen) / 3600) + ' год.';
    else lineDays += ' дн.';
    let lineDaysClass = 'text-secondary';
    let lineWidth = ((totalWidth - totalLen) / totalWidth) * 100;
    if (totalWidth > 30 * 86400) {
        if (lineWidth > 30)
            lineDaysClass = 'text-danger';
        else if (lineWidth > 10)
            lineDaysClass = 'text-warning';
    }
    $('#z_solo_progress').append(`<div class="z_solo_pb_el"
        style="background-color:${data.table.lawSet[0].color_stat[data.table.lawSet[0].currentPhase.status]};right:0;width:calc(100% - ${totalLen / totalWidth * 100}%);z-index:2"
        rel="tooltip" data-toggle="tooltip" data-placement="bottom" data-html="true" title="" data-original-title=
        "${data.table.lawSet[0].currentPhase.status}<br/>
        <small class='${lineDaysClass} font-weight-bold'>${lineDays}</small>"></div>`);
}