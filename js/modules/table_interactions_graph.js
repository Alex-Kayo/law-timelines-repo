import { data } from "./data.js";
import { setCachedMermaidFlowchart } from "./table_create_graph.js";
import {mermaidSVG} from "./data_svg.js";

export function setStepperListener(
  mermaidRoot = "z_stg_mermaid_sub_container"
) {
  const donutsContainer = $("#z_stg_sub_container");
  const tableContainer = $("#z_table_wrapper_solo");

  $(".step-circle").on("click", function () {
    if (!jQuery(this).hasClass('z_active'))
      return;

    $('.step-circle').tooltip('hide');
    let me = jQuery(this);
    let type = me
      .attr("class")
      .match(/(step-[^c].+?)\s/)[0]
      .trim()
      .split("-")[1];
    if (type === "signed")
	    type = "valid";
    if (
      !me.attr("class").includes("z_active") ||
      mermaidSVG[type] === undefined
    )
      return;

    tableContainer.css("display", "none");
    donutsContainer.css("display", "none");

    $("#" + mermaidRoot)
      .children()
      .remove();


      const arrow = $('.z_displayed_arrow');

      if (!me.hasClass('z_displayed')) {
        arrow.css('display', 'block');
        Object.values($(".step-circle")).forEach((el) => {
          const circle = jQuery(el);
          circle.html(circle.data("icon"));
          circle.removeClass('z_displayed');
        });
        //me.html('<i class="fa fa-arrow-down" aria-hidden="true"></i>');
        arrow.css('left', `${Math.floor(me.offset().left - me.parent().offset().left) + 6.5}px`);
        me.addClass('z_displayed');
        $("#" + mermaidRoot).append(
            `<iframe src="${diagramPath}${type}.html?v=${diagramVer}" onload="this.insertAdjacentHTML('afterend', (this.contentDocument.body||this.contentDocument).innerHTML);this.remove()"></iframe>`
        ).ready(() => setTimeout(() => {
          const rect = $($("g.clusters rect")[0]);
          const newWidth = rect.attr("width");
          const newHeight = rect.attr("height");
          const mermaidSVG = $(".mermaid > svg");
          mermaidSVG
              .removeAttr("viewBox")
              .attr("viewBox", `0 0 ${newWidth} ${newHeight}`);
        }, 100));
      } else {
        arrow.css('display', 'none');
        tableContainer.css("display", "flex");
        donutsContainer.css("display", "flex");
        //me.html(me.data("icon"));
        me.removeClass('z_displayed');
      }
  });
}
