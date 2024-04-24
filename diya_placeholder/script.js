
function setDiiaResponseErrorTitle() {
    const qrBorder = document.getElementById('diia-border-loader');
    const qr = document.getElementById('diia-logo');
    const timer = document.getElementById('diia-timer');
    const diiaBlock = document.getElementById('diiaBlock');

    qr.src = './123.png';
    qrBorder.classList.remove('success');
    qrBorder.classList.add('fail');
    timer.innerText = data.TITLE.ERROR;
    diiaBlock.classList.remove('ready');
    diiaBlock.classList.add('inactive');
}

document.getElementById('diia-button').onclick = function () {
    const button = document.getElementById('diia-button');
    const diiaApp = document.getElementById('diia-app');
    const diiaBlock = document.getElementById('diiaBlock');
    const qrBorder = document.getElementById('diia-border-loader');
    const qr = document.getElementById('diia-logo');
    const timer = document.getElementById('diia-timer');

    let timerTime = 10; //TEST

    timer.innerText = data.TITLE.SERVER;
    qrBorder.classList.remove('inactive');
    qrBorder.classList.remove('fail');
    diiaBlock.classList.remove('inactive');
    diiaBlock.classList.add('initing');

    const sid = getCookie('api');
    const diiaRequestParams = {sid: sid};

    fetch(button.dataset.api + 'request', {
        method: 'POST',
        body: JSON.stringify(diiaRequestParams)
    })
        .then(response => {
            return response.text();
        })
        .then((responseText) => {
            let diiaResponse = '';
            try {
                diiaResponse = JSON.parse(responseText);
            }
            catch (e) {
                console.log(e);
                throw 'Loading diiaResponse has failed.';
            }
            let diiaResponseExpire = Math.floor(((new Date(diiaResponse.expires)).getTime() - Date.now()) / 1000);

            if (diiaResponse.qrcode === undefined || diiaResponse.expires === undefined || diiaResponseExpire <= 0 || isNaN(diiaResponseExpire)) {
                setDiiaResponseErrorTitle();
                throw 'Loading diiaResponse has failed.';
            }

            qr.src = diiaResponse.qrcode;
            qrBorder.classList.add('success');
            diiaBlock.classList.remove('initing');
            diiaBlock.classList.add('ready');
            diiaApp.href = diiaApp.dataset.api + diiaResponse.deeplink;
            timerTime = diiaResponseExpire;
            timer.innerText = `${Math.floor(timerTime / 60)}:${('0' + (timerTime % 60).toString()).slice(-2)}`;
            const timerIntervalId = setInterval(() => {
                timerTime--;
                timer.innerText = `${Math.floor(timerTime / 60)}:${('0' + (timerTime % 60).toString()).slice(-2)}`;
                if (timerTime <= 0) {
                    clearInterval(timerIntervalId);
                    qrBorder.classList.remove('success');
                    qrBorder.classList.add('fail');
                    diiaBlock.classList.remove('ready');
                    diiaBlock.classList.add('inactive');
                    diiaApp.href = 'javascript:void(0)';
                    timer.innerText = data.TITLE.EXPIRED;
                }
            }, 1000);

            const diiaCheckParams = {sid: diiaResponse.token, sign: diiaResponse.sign};
            const signIntervalId = setInterval(() => {
                fetch(button.dataset.api + "check", {
                  method: "POST",
                  body: JSON.stringify(diiaCheckParams),
                })
                  .then((response) => response.text())
                  .then((text) => {
                    const checkState = JSON.parse(text);
                    if (checkState.active === true) {
                        clearInterval(timerIntervalId);
                        timer.innerText = data.TITLE.SUCCESS;
                        qrBorder.classList.remove('ready');
                        qrBorder.classList.add('signed');
                        diiaBlock.classList.remove('ready');
                        diiaBlock.classList.add('initing');
                        setTimeout(() => {
                            window.location.href = checkState.url;
                            clearInterval(signIntervalId);
                        }, 2000);
                    }
                  })
                  .catch((e) => console.log(e));

                if (diiaResponseExpire < 10) {
                    clearInterval(signIntervalId);
                    qrBorder.classList.remove('success');
                    qrBorder.classList.add('fail');
                }
                diiaResponseExpire -= 10;
            }, 10000);
    })
        .catch(e => console.log(e));
};