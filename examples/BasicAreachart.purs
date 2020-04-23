module Examples.BasicAreachart where

import Prelude

import Apexcharts (Axis, AxisType(..), ChartType(..), Curve(..), categories, chart, createChart, curve, data', dataLabels, enabled, height, name, render, series, stroke, type', xaxis, zooming)
import Data.Options (Options, (:=))
import Effect (Effect)
  
main :: Effect Unit
main =  
  let 
    xaxis' :: Options Axis
    xaxis' = type' := Datetime 
      <> categories := ["2018-09-19T00:00:00.000Z", "2018-09-19T01:30:00.000Z", 
      "2018-09-19T02:30:00.000Z", "2018-09-19T03:30:00.000Z", "2018-09-19T04:30:00.000Z", 
      "2018-09-19T05:30:00.000Z", "2018-09-19T06:30:00.000Z"]
    chart' = type' := Area <> height := 350.0 <> zooming := (enabled := false)
    series' = [name := "STOCK ABC" <> data' := [31, 40, 28, 51, 42, 109, 100]]
    dataLabels' = enabled := false  
    stroke' = curve := Smooth
  in render $ createChart "#chart" (
        chart := chart' <> series := series' <> stroke := stroke' 
        <> dataLabels := dataLabels' <> xaxis := xaxis'
    )