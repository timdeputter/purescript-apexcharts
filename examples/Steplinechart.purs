module Examples.Steplinechart where

import Prelude

import Apexcharts (createChart, render)
import Apexcharts.Chart as C
import Apexcharts.Common as CC
import Apexcharts.DataLabels as DL
import Apexcharts.Markers as M
import Apexcharts.Markers.Hover as H
import Apexcharts.Series as SE
import Apexcharts.Stroke as S
import Apexcharts.Title as TI
import Data.Options ((:=))
import Effect (Effect)
  
main :: Effect Unit
main = render $ createChart "#steplinechart" (
       SE.series := [(SE.data' := [34, 44, 54, 21, 12, 43, 33, 23, 66, 66, 58] )]
       <> C.chart := (C.type' := CC.Line <> C.height := 350)       
       <> S.stroke := (S.curve := S.Stepline)
       <> DL.dataLabels := (DL.enabled := false)
       <> M.markers := (H.hover := (H.sizeOffset := 4.0))
       <> TI.title := (TI.text := "Stepline Chart" <> TI.align := TI.Left)
    )