module Examples.Radialbarchart where

import Prelude

import Apexcharts (createChart, labels, render)
import Apexcharts.Chart as C
import Apexcharts.Common as CC
import Apexcharts.PlotOptions as P
import Apexcharts.PlotOptions.RadialBar as PR
import Apexcharts.PlotOptions.RadialBar.DataLabels as PRD
import Apexcharts.PlotOptions.RadialBar.DataLabels.Name as PRDN
import Apexcharts.PlotOptions.RadialBar.DataLabels.Total as PRDT
import Apexcharts.PlotOptions.RadialBar.DataLabels.Value as PRDV
import Apexcharts.Series as SE
import Data.Options ((:=))
import Effect (Effect)


main :: Effect Unit
main = render =<< createChart "#radialbarchart" (
      C.chart := (C.type' := CC.RadialBar)
      <> SE.series := [44, 55, 67, 83]
      <> P.plotOptions := (
          PR.radialBar := (
              PRD.dataLabels := (
                  PRDN.name := (
                      PRDN.fontSize := "22px"
                  )
                  <> PRDV.value := (
                      PRDV.fontSize := "16px"
                  )
                  <> PRDT.total := (
                      PRDT.show := true
                      <> PRDT.label := "Total"
                  )
              )
          )
      )
      <> labels := ["Apples", "Oranges", "Bananas", "Berries"]
  )
