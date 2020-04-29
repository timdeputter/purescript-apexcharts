module Apexcharts.Common where


data ChartType = Line
    | Area
    | Bar
    | Radar
    | Histogram
    | Pie
    | Donut
    | RadialBar
    | RangeBar
    | Scatter
    | Bubble
    | Heatmap
    | Candlestick
    | Column

chartTypeToString :: ChartType -> String
chartTypeToString = case _ of
    Line ->    "line"
    Area ->    "area"
    Bar ->    "bar"
    Radar ->    "radar"
    Histogram ->    "histogram"
    Pie ->    "pie"
    Donut ->    "donut"
    RadialBar ->    "radialBar"
    RangeBar -> "rangeBar"
    Scatter ->    "scatter"
    Bubble ->    "bubble"
    Heatmap ->    "heatmap"
    Candlestick ->    "candlestick"
    Column -> "column"


data FontWeightStr = 
    Normal 
    | Bold
    | Bolder
    | Lighter

data FontWeightNum = 
    N100
    | N200
    | N300
    | N400
    | N500
    | N600
    | N700
    | N800
    | N900


fontWeightToString :: FontWeightStr -> String
fontWeightToString = case _ of
    Normal  -> "normal" 
    Bold -> "bold"
    Bolder -> "bolder"
    Lighter -> "lighter"


fontWeightNumToInt :: FontWeightNum -> Int
fontWeightNumToInt = case _ of
    N100 -> 100
    N200 -> 200
    N300 -> 300
    N400 -> 400
    N500 -> 500
    N600 -> 600
    N700 -> 700
    N800 -> 800
    N900 -> 900



data FilterType = None
    | Lighten
    | Darken

filterTypeToString :: FilterType -> String
filterTypeToString = case _ of    
    None -> "none"
    Lighten -> "lighten"
    Darken -> "darken"