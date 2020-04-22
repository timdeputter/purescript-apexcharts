module Examples.BasicLinechart where

import Prelude

import Apexcharts (Align(..), ChartType(..), Curve(..), align, categories, chart, createChart, curve, data', dataLabels, enabled, height, name, render, series, stroke, text, title, type', xaxis, zooming)
import Data.Options ((:=))
import Effect (Effect)
  
main :: Effect Unit
main =  render $ createChart "#chart" (
        chart := (type' := Line <> height := 350.0 <> zooming := (enabled := false)) 
        <> series := [
          name := "Desktops"
          <> data' := [10, 41, 35, 51, 49, 62, 69, 91, 148]
        ]
        <> stroke := (
          curve := Straight
        )
        <> dataLabels := (
          enabled := false
        )
        <> title := (
          text := "Product Trends by Month"
          <> align := Left
        )
        <> xaxis := (
          categories := ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep"]
        )
    )