import { data } from "./data.js";
import {setCachedMermaidFlowchart} from "./table_create_graph.js";

export function setStepperListener(
  mermaidRoot = "z_stg_mermaid_sub_container"
) {
  const donutsContainer = $('#z_stg_sub_container');
  const tableContainer = $('#z_table_wrapper_solo');

  $(".step-circle").on("click", function () {
    let me = jQuery(this);
    const type = me
      .attr("class")
      .match(/(step-[^c].+?)\s/)[0]
      .trim()
      .split("-")[1];
    if (
      !me.attr("class").includes("z_active") ||
      data.mermaidCharts[type] === undefined
    )
      return;

    tableContainer.css('display', 'none');
    donutsContainer.css('display', 'none');

    $("#" + mermaidRoot)
      .children()
      .remove();

    if (!me.html().includes("times")) {
      Object.values($(".step-circle")).forEach((el) => {
        const circle = jQuery(el);
        circle.html(circle.data("icon"));
      });
      me.html('<i class="fa fa-times" aria-hidden="true"></i>');

      setCachedMermaidFlowchart(type, mermaidRoot);
      const rect = $($('g.clusters rect')[0]);
      const newWidth =  rect.attr('height');
      const newHeight = rect.attr('width');
      const mermaidSVG = $('.mermaid > svg');
      mermaidSVG.removeAttr('viewBox')
          .attr('viewBox', `0 0 ${newWidth} ${newHeight}`);

      /*createMermaidFlowchart(
        [
          data.mermaidCharts.type,
          data.mermaidCharts.classes,
          data.mermaidCharts[type],
        ].join("\n"),
        mermaidRoot
      ).then(() => {
        $(function () {
          zoomMermaidWrapper(mermaidRoot);
        });
      });*/
      //zoomMermaidWrapper(mermaidRoot);
    } else {
      tableContainer.css('display', 'flex');
      donutsContainer.css('display', 'flex');
      me.html(me.data("icon"));
    }
  });
}
