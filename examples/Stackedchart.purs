module Examples.Stackedchart where

import Prelude

import Apexcharts (Axis, AxisType(..), ChartType(..), Curve(..), FillType(..), categories, chart, colors, createChart, curve, data', dataLabels, enabled, fill, gradient, height, name, opacity, opacityFrom, opacityTo, render, series, stacked, stroke, type', xaxis, zooming)
import Data.Options (Options, (:=))
import Effect (Effect)
  
main :: Effect Unit
main =  
  let 
    xaxis' :: Options Axis
    xaxis' = categories := [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    chart' = type' := Area <> height := 350.0 <> stacked := true
    series' = [
      name := "STOCK A" <> data' := [31, 40, 28, 51, 42, 109, 100, 80, 340, 123],
      name := "STOCK B" <> data' := [75, 543, 75, 97, 42, 4, 7, 43, 11, 34,235]
    ]
    dataLabels' = enabled := false  
    stroke' = curve := Smooth
    
  in render $ createChart "#chart" (
        chart := chart' <> series := series' <> stroke := stroke' 
        <> dataLabels := dataLabels' 
        <> xaxis := xaxis' 
        <> colors := ["#008FFB", "#00E396", "#CED4DC"]
        <> fill := (type' := Gradient <> gradient := (opacityFrom := 0.6 <> opacityTo := 0.8))
    )
