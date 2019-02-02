HTMLWidgets.widget({

  name: 'supercaliheatmapwidget',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

        console.log(x);

        var fmt = d3.time.format("%Y-%m-%d");
        var cal = new CalHeatMap();

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

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});