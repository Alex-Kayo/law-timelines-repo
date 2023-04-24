import {data} from "./data.js";
import {getTimeDelta} from "./date_operations.js";
import mermaid from "https://cdn.jsdelivr.net/npm/mermaid@10/dist/mermaid.esm.min.mjs";
import {setStepperListener} from "./table_interactions_graph.js";
import {escText} from "./parse_text.js";
import { cachedSVG } from "./data_svg.js";

export function setSoloTimeGraph(el) {
    el.tooltip('hide');

    if (el.html().includes('chart')) {
        el.html('<i class="fa fa-times" aria-hidden="true"></i>');

        let steps = data.table.lawSet[0].steps;
        let stepsHTML = '<div id="z_stg_steps_container">';

        for (let i = 0; i < steps.length; i++) {
            stepsHTML += `
                <div class="step-circle step-${steps[i].step} ${(steps[i].class !== undefined) ? steps[i].class : ''} ${(steps[i].active === 1) ? 'z_active' : ''}"
                rel="tooltip" data-icon="${escText(data.stepsParams[steps[i].step].text)}" data-toggle="tooltip" data-placement="top" data-html="true" title=""
                    data-original-title="${steps[i].title}">${data.stepsParams[steps[i].step].text}</div>
                ${(steps[i]['small'] !== undefined) ? `
                    <div class="z_solo_tg_steps_link z_small z_active" style="background-color:var(${'--prj_' + steps[i]['small']})"></div>
                    <div class="step-circle step-${steps[i]['small']} z_small z_active"
                    rel="tooltip" data-toggle="tooltip" data-placement="top" data-html="true" title=""
                    data-original-title="${steps[i].small_title}">${data.stepsParams[steps[i]['small']].text}</div>
                    ` : ''}
                ${(i < steps.length - 1) ? `<div class="z_solo_tg_steps_link ${(steps[i + 1].active === 1) ? 'z_active' : ''}"
                    style="background-color:var(${'--prj_' + steps[i + 1].step})"></div>` : ''}
                `;
        }
        stepsHTML += '</div>';



        $(`#z_panel_container_solo`).append(`
            <div id="z_solo_time_graph_container">
                ${stepsHTML}
                <div id="z_stg_mermaid_container">
                    <div id="z_stg_mermaid_sub_container" class="scroll-heavy"></div>
                </div>
                <div id="z_stg_sub_container">
                <div>
                    <div class="z_stgs_title"><h2>Час станів проходження</h2></div>
                    <div class="z_stgs_canvas_container">
                        <canvas id="z_stgs_total" class="z_solo_stgs_canvas"></canvas>
                    </div>
                </div>
                <div>
                    <div class="z_stgs_title"><h2>Опрацювання в комітетах</h2></div>
                    <div class="z_stgs_canvas_container">
                        <canvas id="z_stgs_committee" class="z_solo_stgs_canvas"></canvas>
                    </div>
                </div>
                </div>
            </div>`);
        setStepperListener();


        let passingTimeStat = [];
        for (const item in data.table.lawSet[0].time_stat)
            passingTimeStat.push([item, data.table.lawSet[0].time_stat[item]]);
        passingTimeStat.sort(function(a, b) {
            return b[1] - a[1];
        });

        let committeeTimeStat = data.table.lawSet[0].workOutCommittees.map(com => {
            let timeEnd = (com.date_fact !== null) ? com.date_fact : data.table.lawSet[0].date_end;
            return [((com.is_main === 1) ? '🏴 ' : '') + com.person.department_name, getTimeDelta(timeEnd, com.date_send)];
        }).sort(function(a, b) {
            return b[1] - a[1];
        });

        $('#z_stgs_total').parent().css('height', Math.max(320, passingTimeStat.reduce((start, el) => start + 23, 0)));
        $('#z_stgs_committee').parent().css('height', Math.max(320, committeeTimeStat.reduce((start, el) => start + 23, 0)));

        createDonutChart({data: passingTimeStat, colors: passingTimeStat.map(el => data.table.lawSet[0].color_stat[el[0].replace(/[<>]/g, '')]) /*[]*/}, "z_stgs_total");
        createDonutChart({data: committeeTimeStat, colors: undefined}, "z_stgs_committee");

        $('.z_solo').css('padding-top',
            parseInt($('.z_solo').css('padding-top')) + parseInt($('#z_solo_time_graph_container').css('height')) + 'px');
    } else {
        el.html('<i class="fa fa-pie-chart" aria-hidden="true"></i>');
        $('#z_table_wrapper_solo').css('display', '');

        $('#z_solo_time_graph_container').remove();
        $('.z_solo').css('padding-top', 'calc(var(--top-panel-height-solo) + var(--solo-progress-bar-height)');
    }
}

export function createDonutChart(timeStat, parentId) {
    const canvas = document.getElementById(parentId);

    let total = timeStat.data.reduce((acc, val) => acc + val[1], 0);
    let chartData = {
        labels: timeStat.data.map(el => el[0].replace(/[<>]+/g, '🏁').replace('Верховної Ради України', 'ВРУ')),
        datasets: [{
            data: timeStat.data.map(el => el[1]),
            backgroundColor: timeStat.colors
        }]
    };

    let chartOptions = {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
            legend: {
                position: 'right',
                align: 'start',
                fullSize: true,
                labels: {
                    fontSize: 14,
                    boxWidth: 15
                },
                callbacks: {
                    label: function(context) {
                        console.log(context);
                    }
                }
            },
            tooltip: {
                callbacks: {
                    label: function(context) {
                        let label = context.label;
                        let value = context.parsed;
                        let percentage = ((value / total) * 100).toFixed(3);
                        return `${percentage}%`;
                    }
                }
            }
        }
    }

    const chart = new Chart(canvas, {
        type: 'doughnut',
        data: chartData,
        options: chartOptions
    });
}

export async function createMermaidFlowchart(mermaidCode, rootId) {
    const drawDiagram = async function() {
        let element = document.getElementById(rootId);
        let parent = element.parentNode;
        let svg = await mermaid.render('mermaidGraph', mermaidCode);

        parent.innerHTML = element.outerHTML/* + parent.innerHTML*/;
        document.getElementById(rootId).innerHTML = svg['svg'];

        const svgElement = parent.querySelector('svg');
        //svgElement.setAttribute('width', '100%');
        svgElement.setAttribute('height', '200%');
    };

    await drawDiagram();
}

export function setCachedMermaidFlowchart(type, rootId = 'z_stg_mermaid_sub_container') {
    if (cachedSVG.mermaidCharts[type] === undefined)
        return ;

    const root = document.getElementById(rootId);
    const svg = cachedSVG.mermaidCharts.container(cachedSVG.mermaidCharts[type]);
    root.innerHTML = svg;
}