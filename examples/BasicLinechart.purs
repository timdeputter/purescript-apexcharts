module Examples.BasicLinechart where

import Prelude

import Apexcharts (ChartType(..), categories, chart, createChart, data', enabled, height, name, render, series, type', xaxis, zooming)
import Data.Options ((:=))
import Effect (Effect)
  
main :: Effect Unit
main =  render $ createChart "#chart" (
        chart := (type' := Line <> height := 350.0 <> zooming := (enabled := false)) 
        <> series := [
          name := "Desktops"
          <> data' := [10, 41, 35, 51, 49, 62, 69, 91, 148]
        ]
        <> xaxis := (
          categories := ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep"]
        )
    )