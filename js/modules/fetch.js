/*
JSON дивно структурований, \n та \t у дивних місцях
!Не можна ставити ":" в параметр id html елементів
 */

import {data} from "./data.js";

export async function fetchAllLaws() {
    if (data === undefined)
        throw 'the data.js file is missing.';

    let fetchLaws = fetch('https://data.rada.gov.ua/ogd/zpr/skl9/billinfo-skl9.json', {
        cache: "default",
        mode: 'cors',
        headers: {
            Accept: 'application/json'/*,
            "If-Modified-Since": 'Wed, 21 Feb 2024 05:56:55 GMT'*/
        }
    }).catch(e => console.log(e));
    return await fetchLaws.then(function(response) {
        console.log(response);
        return response.text();
    }).then(function(text) {
        return text.replace(/[\r\n]+/gm, "").replace(/\t/g, ' ');
    }).catch(e =>console.log(e));
}

export function fetchMonthColors(date) {
    let fetchColors = fetch(`https://data.rada.gov.ua/ogd/zal/agenda/skl9/agenda-${date}.json`, {
        cache: "default",
        headers: {/*
            "If-Modified-Since": 'Wed, 21 Feb 2024 00:00:00 GMT'*/
        }
    }).catch(e => console.log(e));

    fetchColors.then(function(response) {
        return (response !== null) ? response.text() : null;
    }).then(function(text) {
        if (text === null) {
            console.log(`Color data from agenda-${date}.json is missing.`);
            return ;
        }
        text = text.replace(/[\r\n]+/gm, "").replace(/\t/g, ' ');

        data.colors = JSON.parse(text);

        for (const [key, value] of Object.entries(data.colors)) {
            $(`#z_nav_${(key).slice(-2)}`).addClass(value.class);
        }
    }).catch(e => console.log(e));
}

export async function fetchLawSolo(fetchParams) {
    let fetchSoloLaw = fetch(`https://meeting.rada.gov.ua/api/bills`, {
        method: 'POST',
        body: JSON.stringify(fetchParams),
        headers: {
            'Accept': 'application/json',
            'Accept-Encoding': 'gzip'
        }
    }).then(function (res) {
        return res;
    }).catch(e => console.log(e));

    let soloLaw = '';
    await fetchSoloLaw.then(function (response) {
        return response.text();
    }).then(function (text) {
        text = text.replace(/[\r\n]+/gm, "").replace(/\t/g, ' ');
        try {
            soloLaw = JSON.parse(text);
        } catch (e) {
            console.log(e);
        }
    }).catch(e => console.log(e));
    return soloLaw;
}