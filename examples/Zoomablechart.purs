module Examples.Zoomablechart where

import Prelude

import Apexcharts (createChart, render)
import Apexcharts.Chart as C
import Apexcharts.Chart.Toolbar as T
import Apexcharts.Chart.Zoom as Z
import Apexcharts.DataLabels as DL
import Apexcharts.Fill as F
import Apexcharts.Fill.Gradient as FG
import Apexcharts.Markers as M
import Apexcharts.Series as SE
import Apexcharts.Title as TI
import Apexcharts.Tooltip as TT
import Apexcharts.Xaxis as X
import Apexcharts.Yaxis as Y
import Apexcharts.Yaxis.Title as YT
import Data.Options ((:=))
import Effect (Effect)
  
main :: Effect Unit
main = render $ createChart "#charty" (
       SE.series := [(SE.name := "XYZ MOTORS" <> SE.data' := [203, 33, 21, 435, 77, 64, 33, 22, 22, 45] )]
       <> C.chart := (
         C.type' := C.Area 
         <> C.stacked := false 
         <> C.height := 350
         <> Z.zoom := (
           Z.type' := Z.X
           <> Z.enabled := true
           <> Z.autoScaleYaxis := true
         )
         <> T.toolbar := (
           T.autoSelected := T.Zoom
         )
       )       
       <> DL.dataLabels := (
          DL.enabled := true
       )
       <> M.markers := (
         M.size := 0.0
       )
       <> TI.title := (
         TI.text := "Stock Price Movement"
         <> TI.align := TI.Left
       )
       <> F.fill := (
         F.type' := F.Gradient
         <> FG.gradient := (
          FG.shadeIntensity := 1.0
          <> FG.inverseColors := false
          <> FG.opacityFrom := 0.5
          <> FG.opacityTo := 0.0
          <> FG.stops := [0.0, 90.0, 100.0]
         )
       )
       <> Y.yaxis := (
         YT.title := (
           YT.text := "Price"
         )
       )
       <> X.xaxis := (
         X.categories := [2000,2001,2002,2003,2004,2005,2006,2007,2008,2009]
       )
       <> TT.tooltip := (
         TT.shared := false
       )
    )