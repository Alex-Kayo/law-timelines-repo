import {data} from "./data.js";

export function getStatusClass(text) {
    if (text === undefined)
        console.log('you\'re a dumbass');

    let result = 'text-none';

    text = text.toLowerCase();

    if (text.match(/відхилен|не (прийнят.*|підписан)|знят.* з розгляду|скасовано|не набра.+? голосів/)) {
        result = 'text-danger';
    } else if (text.match(/(прийнят|підписан)|(передан.*|готується) на підпис/)) {
        result = 'text-success';
    } else if (text.match(/повторн|повернут|доопрацювання|не включен|розгляд відкладен/)) {
        result = 'text-warning';
    } else if (text.match(/схвален|включен|заслухан|врахован|очікує|розглянут/)) {
        result = 'text-info';
    } else if (text.match(/готується|опрацьовується/)) {
        result = 'text-primary';
    }

    return result;
}

export function getReviewClass(text) {
    let result = 'text-none';

    text = text.toLowerCase();

    if (text.match(/[Вв]ідхилено|[Нн]е (прийнято|підписан)|[Зз]нято з розгляду|[Сс]касовано|[Нн]е набра.+? голосів/)) {
        result = 'text-danger';
    } else if (text.match(/[Пп](рийнят|ідписан)|[Вв]ідповід|[Вв]изначитис/)) {
        result = 'text-success';
    } else {
        result = 'text-warning';
    }

    return result;
}

export function getStepperClass(text) {
    let result = '';

    text = text.toLowerCase();

    if (text.match(/[Рр]атифік|[Дд]енонс/)) {
        result = 'intern';
    } else if (text.match(/[Пп]овторн| вето|Вето /)) {
        result = 'again';
    }
    if (text.match(/[Пп]ерш.+? читанн[ія]|за основу/)) {
        result = 'first';
    } else if (text.match(/[Дд]руг.+? читання/)) {
        result = 'second';
    } else if (text.match(/[Тт]рет.+? читання/)) {
        result = 'third';
    } else if (text.match(/поряд[оку]+ денн[огий]+|[Оо]чікує/)) {
        result = 'order';
    }
    if (text.match(/[Нн]е (прийнят|підтриман|включен)|[Вв]ідкладен|інше рішення|іншому проекті/)) {
        result = 'notaccept';
    }
    if (text.match(/[Дд]оопрац|[Уу]точнен|[Пп]ропозиц|[Пп]еренесен|альтерн|[Дд]оручено|на заміну/)) {
        result = 'refine';
    }
    if (text.match(/невідкладн/)) {
        result = 'urgent';
    } else if (text.match(/ (на|з) (підпис|візування)|[Пп]ідписано|до протокол/)) {
        result = 'signed';
    } else if (text.match(/[Пп]рийнят.+?(читанн|в цілому|за основу|рішенн)|Вето Президента подолано|(Акт|Заяву|Рішення) прийнят/)) {
        result = 'accept';
    } else if (text.match(/[Вв]ідхил|[Вв]иключен|[Зз]нят|[Вв]ідкликан|не розгляд|невключення|Вето Президента не подолано/)) {
        result = 'reject';
    } else if (text.match(/[Оо]держано|([Нн]аправлен.+?|[Пп]ередано|[Нн]адано) (на|для|до) (розгляд|Комітету)/)) {
        result = 'register';
    } else if (text.match(/[Вв]ключен|[Оо]чікує| (про|для|до|на) розгляд/)) {
        result = 'order';
    } else if (text.match(/[Оо]працьовує|ознайомлення|(Надано|Направлено) (повторний |на )?висновок/)) {
        result = 'working';
    } else if (text.match(/(Закон|Постанов.+?) прийнят/)) {
        result = 'valid';
    } else if (text.match(/[Зз]аслух|[Оо]бговорен|[Пп]ідтриман|[Пп]роголосован|Прийом|[Пп]редставлен|[Сс]хвален/)) {
        result = 'other';
    } else if (text.match(/[Рр]озсилка|в тираж|для (офіційного )?(оприлюднення|опублікування)|на веб\-?сайт|оформленого акту/)) {
        result = 'public';
    }

    return (result !== '') ? `proj ${result}` : ``;
}

export function getSoloReadingIcon(text) {
    if (typeof text !== 'string')
        return '';

    let result = '';
    let params = {
        color: '',
        text: ''
    };
    text = text.toLowerCase();


    if (text.match(/первинна/)) {
        [params.color, params.text] = ['bg-register', '<i class="fa fa-arrow-right" aria-hidden="true"></i>'];//result = 'register';
    } else if (text.match(/перш/)) {
        [params.color, params.text] = ['bg-first', '1'];//result = 'first';
    } else if (text.match(/друг/)) {
        [params.color, params.text] = ['bg-second', '2'];//result = 'second';
    } else if (text.match(/трет/)) {
        [params.color, params.text] = ['bg-third', '3'];//result = 'third';
    } else return '';

    result = `
        <div class="z_solo_reading_icon ${params.color}">${params.text}</div>
        `;

    return result;
}