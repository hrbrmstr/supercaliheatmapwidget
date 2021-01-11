HTMLWidgets.widget({

  name: 'supercaliheatmapwidget',

  type: 'output',

  factory: function(el, width, height) {

    var fmt, cal;

    return {

      renderValue: function(x) {

        while (document.getElementById(el.id).hasChildNodes()) {
            document.getElementById(el.id).removeChild(document.getElementById(el.id).lastChild);
        }
        // console.log(x);

        fmt = d3.time.format("%Y-%m-%d");
        cal = new CalHeatMap();

        cal.init({
          itemSelector: el,
          domain: x.domain,
          subDomain: x.subDomain,
          range: x.range,
          cellSize: x.cellSize,
          cellPadding: x.cellPadding,
          cellRadius: x.cellRadius,
          data: x.vals,
          start: fmt.parse(x.start),
          label: x.label,
          legend: x.legend,
          displayLegend: x.displayLegend,
          tooltip: x.tooltip,
          itemName: x.itemName,
          subDomainTextFormat: x.subDomainTextFormat,
          legendColors: (typeof x.legendColors == "undefined") ? null : x.legendColors,
          legendCellSize: x.legendCellSize,
          legendCellPadding: x.legendCellPadding,
          legendMargin: x.legendMargin,
          legendVerticalPosition: x.legendVerticalPosition,
          legendHorizontalPosition: x.legendHorizontalPosition,
          legendOrientation: x.legendOrientation
        });

      },

      resize: function(width, height) { }

    };
  }
});
