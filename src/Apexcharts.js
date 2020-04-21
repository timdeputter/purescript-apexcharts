"use strict";

// module Apexcharts


exports._createChart = function(el){
    return function(options){
        return new ApexCharts(el, options);
    }
};


exports.render = function(chart){
    return function() {chart.render();};
};

exports._updateOptions = function(chart) {
    return function(newOptions) {
        return function() {chart.updateOptions(newOptions);};
    };
};

