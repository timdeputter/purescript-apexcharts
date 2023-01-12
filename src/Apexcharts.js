export const _createChart = selector => apexoptions => ({selector, apexoptions});

export const _createChartEl = el => apexoptions = ({el, apexoptions});

export const render = chartDef => () => {
    let chart;
    if (chartDef.el) {
        chart = new ApexCharts(chartDef.el, chartDef.apexoptions);
    } else {
        chart = new ApexCharts(document.querySelector(chartDef.selector), chartDef.apexoptions);
    }
    chart.render();
}

export const _updateOptions = chart => newOptions => {
    chart.updateOptions(newOptions);
};
