
module Apexcharts.PlotOptions.Pie.Donut.Labels where


import Apexcharts.PlotOptions.Pie.Donut (Donut)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Labels

labels :: Option Donut (Options Labels)
labels = cmap Opt.options (opt "labels")

show :: Option Labels Boolean
show = opt "show"

