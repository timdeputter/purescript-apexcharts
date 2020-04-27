module Examples.BasicLinechart where

import Prelude

import Apexcharts (createChart, render)

import Apexcharts.Axis as A
import Apexcharts.Chart (ChartType(..))
import Apexcharts.Chart as C
import Apexcharts.Chart.Zoom as Z
import Apexcharts.Commons (height)
import Apexcharts.DataLabels as DL
import Apexcharts.Mainstroke (Curve(..))
import Apexcharts.Mainstroke as S
import Apexcharts.Series as SE
import Apexcharts.Title (Align(..))
import Apexcharts.Title as TI
import Data.Options ((:=))
import Effect (Effect)
  
main :: Effect Unit
main =  render $ createChart "#chart" (
        C.chart := (C.type' := Line <> height := 350.0 <> Z.zooming := (Z.enabled := false)) 
        <> SE.series := [
          SE.name := "Desktops"
          <> SE.data' := [10, 41, 35, 51, 49, 62, 69, 91, 148]
        ]
        <> S.stroke := (
          S.curve := Straight
        )
        <> DL.dataLabels := (
          DL.enabled := false
        )
        <> TI.title := (
          TI.text := "Product Trends by Month"
          <> TI.align := Left
        )
        <> A.xaxis := (
          A.categories := ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep"]
        )
    )