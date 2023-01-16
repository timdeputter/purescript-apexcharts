export const _createChart = selector => apexoptions => () => {
    return new ApexCharts(document.querySelector(selector), apexoptions);
};

export const _createChartEl = el => apexoptions => () => {
    return new ApexCharts(el, apexoptions);
}

export const render = chart => () => {
    chart.render();
}

export const _updateOptions = chart => newOptions => () => {
    chart.updateOptions(newOptions);
};
