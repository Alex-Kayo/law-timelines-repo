import {data} from "./data.js";
import {createMermaidFlowchart} from "./table_create_graph.js";

export function setStepperListener() {
    $('.step-circle').on('click', function() {
        const me = jQuery(this);
        const type = me.attr('class').match(/(step-[^c].+?)\s/)[0].trim().split('-')[1];
        if (!me.attr('class').includes('z_active') || data.mermaidCharts[type] === undefined)
            return ;

        $('#z_stg_mermaid_sub_container').css('height', '400px');
        createMermaidFlowchart(
            [
                data.mermaidCharts.type,
                data.mermaidCharts.classes,
                data.mermaidCharts[type]
            ].join('\n'), 'z_stg_mermaid_sub_container');
    });
}