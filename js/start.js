import mermaid from 'https://cdn.jsdelivr.net/npm/mermaid@10/dist/mermaid.esm.min.mjs';

import {data} from "./modules/data.js";
import {fetchAllLaws} from "./modules/fetch.js";
import {setMainTable} from "./modules/table_create_standard.js";
import {escText} from "./modules/parse_text.js";
import {getStatusClass} from "./modules/get_class_regex.js";
import {createSoloTimeline} from "./modules/table_create_solo.js";

function initStandardTable() {
    const hashFilterOptions = decodeURI(window.location.href).split('/').slice(-1)[0];

    if (filterOptions !== undefined || hashFilterOptions !== '') {
        if (filterOptions === undefined)
            filterOptions = { active: false };

        if (filterOptions.active === false) {
            filterOptions.number = hashFilterOptions.match(/#\d{4,}(-.+)?(\/.+)?/g); //todo *
            if (filterOptions.number !== null) {
                filterOptions.number = filterOptions.number[0].slice(1);
                filterOptions.active = true;
            }
            if (hashFilterOptions.includes('isEuro')) {
                filterOptions.active = true;
                filterOptions.isEuro = true;
            }
            if (hashFilterOptions.includes('isUrgent')) {
                filterOptions.active = true;
                filterOptions.isUrgent = true;
            }
            if (hashFilterOptions.includes('isAct')) {
                filterOptions.active = true;
                filterOptions.isAct = parseInt(hashFilterOptions.match(/isAct=\d/)[0].slice(-1));
                if (filterOptions.isAct !== -1 && filterOptions.isAct !== 1)
                    throw 'filterOptions.isAct has wrong value.';
            }
        } else {
            filterOptions.isEuro = !!filterOptions.isEuro;
            filterOptions.isUrgent = !!filterOptions.isUrgent;
            if (filterOptions.number !== undefined && filterOptions.number !== null)
                filterOptions.number = filterOptions.number.toString();
        }

        if (filterOptions.active === true && filterOptions.number !== null && filterOptions.number !== undefined) {
            createSoloTimeline({number: filterOptions.number});
            return;
        }
    }

    fetchAllLaws().then(text => {
        data.lawBase = text.match(/{"id":\d*,.*?,"isUrgent":.*?}/g);
        try {
            data.lawBase = data.lawBase.map(el => JSON.parse(el));
        }
        catch(e) {
            console.log(e);
        }
        data.lawBase.forEach(el => escText(el.name));

        console.log(data.lawBase);

        if (filterOptions !== undefined) {
            if (filterOptions.isEuro === true)
                data.lawBase = data.lawBase.filter(law => law.isEuro === true || law.isEuro === 1);
            if (filterOptions.isUrgent === true)
                data.lawBase = data.lawBase.filter(law => law.isUrgent === true || law.isUrgent === 1);
            if (filterOptions.isAct !== undefined)
                data.lawBase = data.lawBase.filter(law => (filterOptions.isAct === -1) ?
                    law.actNumber === null : (filterOptions.isAct === 1) ?
                        law.actNumber !== null : law);
        }

        data.currentType = data.const.STANDARD_TYPE;
        data.table.year = data.const.STANDARD_YEAR;
        data.table.month = data.const.STANDARD_MONTH;
        data.currentPage = data.const.STANDARD_PAGE;

        let guessStart = () => {
            if (data.lawBase[0].passings === undefined)
                return ;

            let date = data.lawBase[0].passings[0].date.split('T')[0].split('-');

            data.currentYear = date[0];
            data.currentMonth = date[1];
            data.currentDay = date[2];
            data.table.year = date[0];
            data.table.month = date[1];
            data.table.day = date[2];

            data.const.YEAR_MAX = data.table.year;
        }
        guessStart();

        data.table.lawSet = data.lawBase;
        data.table.dateType = data.currentType;
        data.const.PAGE_MAX = Math.ceil(data.lawBase.length / data.const.PAGE_SIZE);
        data.table.pageCount = data.const.PAGE_MAX;

        data.table.lawSet.forEach(law => law.statusClass = getStatusClass(law.currentPhase.status));

        mermaid.initialize({
            startOnLoad: true,
            theme: 'neutral',
            "fontFamily": "Proba Pro",
            themeVariables: {
                fontSize: '16px'
            }
        });

        $('.z_loading_screen').remove();

        setMainTable();
    }).catch(e => console.log(e));
}

initStandardTable();