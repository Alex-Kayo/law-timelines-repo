import {data} from "./data.js";

export function escText(text) {
    return text.replaceAll('\'', '&apos;').replaceAll('\"', '&quot;');
}

export function parseJsonDate(date, type = 's') {
    if (date === null || date === undefined)
        return null;

    let separator = ((date.includes('T')) ? 'T' : ' ');
    date = date.split(separator);
    date[0] = date[0].split('-');
    if (type === 'd')
        return date[0];

    date[1] = date[1].split(':');
    if (type !== 'ms')
        date[1].pop();//date[1][2] = date[1][2].split('.')[0];

    return date;
}