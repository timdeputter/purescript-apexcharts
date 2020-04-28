
module Apexcharts.PlotOptions where


import Apexcharts (Apexoptions)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data PlotOptions

plotOptions :: Option Apexoptions (Options PlotOptions)
plotOptions = cmap Opt.options (opt "plotOptions")

