
module Apexcharts.PlotOptions.Heatmap.ColorScale where


import Apexcharts.PlotOptions.Heatmap (Heatmap)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data ColorScale

colorScale :: Option Heatmap (Options ColorScale)
colorScale = cmap Opt.options (opt "colorScale")

inverse :: Option ColorScale Boolean
inverse = opt "inverse"

min :: Option ColorScale Number
min = opt "min"

max :: Option ColorScale Number
max = opt "max"

