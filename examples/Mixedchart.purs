module Examples.Mixedchart where

import Prelude

import Apexcharts (createChart, labels, render)
import Apexcharts.Chart as C
import Apexcharts.Common as CC
import Apexcharts.Markers as M
import Apexcharts.PlotOptions as P
import Apexcharts.PlotOptions.Bar as PB
import Apexcharts.Series as SE
import Apexcharts.Stroke as S
import Apexcharts.Xaxis as X
import Apexcharts.Yaxis as Y
import Apexcharts.Yaxis.Title as YT
import Data.Options ((:=))
import Effect (Effect)


main :: Effect Unit
main = render $ createChart "#mixedchart" (
      C.chart := (C.type' := CC.Line <> C.height := 350 <> C.stacked := false)
      <> SE.series := [
          (SE.name := "TEAM A"
          <> SE.type' := CC.Column
          <> SE.data' := [23, 11, 22, 27, 13, 22, 37, 21, 44, 22, 30]),
          (SE.name := "TEAM B"
          <> SE.type' := CC.Area
          <> SE.data' := [44, 55, 41, 67, 22, 43, 21, 41, 56, 27, 43]),
          (SE.name := "TEAM C"
          <> SE.type' := CC.Line
          <> SE.data' := [30, 25, 36, 30, 45, 35, 64, 52, 59, 36, 39])
      ]
      <> S.stroke := (S.width := [0, 2, 5] <> S.curve := S.Smooth)
      <> labels := ["01/01/2003", "02/01/2003", "03/01/2003", "04/01/2003", "05/01/2003", "06/01/2003", "07/01/2003",
        "08/01/2003", "09/01/2003", "10/01/2003", "11/01/2003"]
      <> M.markers := (M.size := 0.0)
      <> X.xaxis := (X.type' := X.Datetime)
      <> Y.yaxis := (YT.title := (YT.text := "Points") <> Y.min := 0.0)
      <> P.plotOptions := (PB.bar := (PB.columnWidth := "50%"))
  )