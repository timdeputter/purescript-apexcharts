
module Apexcharts.PlotOptions.Pie.DataLabels where


import Apexcharts.PlotOptions.Pie (Pie)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data DataLabels

dataLabels :: Option Pie (Options DataLabels)
dataLabels = cmap Opt.options (opt "dataLabels")

offset :: Option DataLabels Number
offset = opt "offset"

minAngleToShowLabel :: Option DataLabels Number
minAngleToShowLabel = opt "minAngleToShowLabel"

formatter :: Option DataLabels (Number -> String)
formatter = opt "formatter"
