import {data} from "./data.js";

export function getFirstDayOfMonth(year, month) {
    return data.dateDayNameToIndex[(new Date(year, month - 1, 1)).toString().slice(0, 3)];
}
export function getDaysInMonth(year, month) {
    return new Date(year, month, 0).getDate();
}

export function getTimeDelta(dateStart, dateEnd) {
    if (typeof dateStart !== 'string' || typeof dateEnd !== 'string')
        return;
    dateStart = new Date(dateStart);
    dateEnd = new Date(dateEnd);

    return (dateStart - dateEnd) / 1000;
}

export function getToday() {
    let today = new Date();
    let dd = String(today.getDate()).padStart(2, '0');
    let mm = String(today.getMonth() + 1).padStart(2, '0');
    let yyyy = today.getFullYear();

    return [yyyy.toString(), mm, dd];
}

export function getSecondsInDate(date) {
    return new Date(date.replace(' ', 'T')).getTime() / 1000;
}

export function convertSecondsToDuration(seconds, mode = 'text') {
    let minutes = Math.floor(seconds / 60);
    let hours = Math.floor(minutes / 60);
    let days = Math.floor(hours / 24);
    let months = Math.floor(days / 30.44);
    let years = Math.floor(months / 12);

    hours = hours % 24;
    minutes = minutes % 60;
    seconds = seconds % 60;

    return (mode === 'text') ? `${years} р. ${months} міс. ${days} д. ${hours} год.`
        : (mode === 'object') ? {
        years: years,
        months: months % 12,
        days: days % 30.44,
        hours: hours,
        minutes: minutes,
        seconds: seconds
    } : null;
}