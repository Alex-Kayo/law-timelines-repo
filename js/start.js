import {data} from "./modules/data.js";
import {fetchAllLaws} from "./modules/fetch.js";
import {setMainTable} from "./modules/table_create_standard.js";
import {escText} from "./modules/parse_text.js";
import {getStatusClass} from "./modules/get_class_regex.js";

function initStandardTable() {

    fetchAllLaws().then(text => {
        text = text.replace(/(\r\n|\n|\r)/gm, "").replace(/\t/g, ' ');
        data.lawBase = text.match(/{"id":\d*,.*?,"isUrgent":.*?}/g);
        try {
            data.lawBase = data.lawBase.map(el => JSON.parse(el));
        }
        catch(e) {
            console.log(e);
        }
        data.lawBase.forEach(el => escText(el.name));

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

        $('.z_loading_screen').remove();
        setMainTable();
    }).catch(e => console.log(e));
}

initStandardTable();