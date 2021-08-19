"use strict";

// module Apexcharts


exports._createChart = function(selector){
    return function(apexoptions){
        return {selector, apexoptions};
    }
};

exports._createChartEl = function(el){
    return function(apexoptions){
        return {el, apexoptions};
    }
};


exports.render = function(chartDef){
    return function() {
        var chart;
        if (chartDef.el) {
            chart = new ApexCharts(chartDef.el, chartDef.apexoptions);
        } else {
            chart = new ApexCharts(document.querySelector(chartDef.selector), chartDef.apexoptions);
        }
        chart.render();
    };
};

exports._updateOptions = function(chart) {
    return function(newOptions) {
        return function() {chart.updateOptions(newOptions);};
    };
};

