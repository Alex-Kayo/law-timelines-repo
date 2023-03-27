/*
JSON дивно структурований, \n та \t у дивних місцях
!Не можна ставити ":" в параметр id html елементів
 */

import {data} from "./data.js";

export async function fetchAllLaws() {
    if (data === undefined)
        throw 'the data.js file is missing.';

    let fetchLaws = fetch('https://data.rada.gov.ua/ogd/zpr/skl9/billinfo-skl9.json').catch(e => console.log(e));
    let laws = await fetchLaws.then(function(response) {
        return response.text();
    }).then(function(text) {
        return text.replace(/(\r\n|\n|\r)/gm, "").replace(/\t/g, ' ');
    }).catch(e =>console.log(e));

    return laws;
}

export function fetchMonthColors(date) {
    let fetchColors = fetch(`https://data.rada.gov.ua/ogd/zal/agenda/skl9/agenda-${date}.json`).catch(e => console.log(e));

    fetchColors.then(function(response) {
        return (response !== null) ? response.text() : null;
    }).then(function(text) {
        if (text === null) {
            console.log(`Color data from agenda-${date}.json is missing.`);
            return ;
        }
        text = text.replace(/(\r\n|\n|\r)/gm, "").replace(/\t/g, ' ');

        data.colors = JSON.parse(text);

        for (const [key, value] of Object.entries(data.colors)) {
            $(`#z_nav_${(key).slice(-2)}`).addClass(value.class);
        }
    }).catch(e => console.log(e));
}