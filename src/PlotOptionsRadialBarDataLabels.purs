
module Apexcharts.PlotOptions.RadialBar.DataLabels where


import Apexcharts.PlotOptions.RadialBar (RadialBar)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data DataLabels

dataLabels :: Option RadialBar (Options DataLabels)
dataLabels = cmap Opt.options (opt "dataLabels")

show :: Option DataLabels Boolean
show = opt "show"

