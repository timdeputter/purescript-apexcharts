
module Apexcharts.PlotOptions.Pie.Donut where


import Apexcharts.PlotOptions.Pie (Pie)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Donut

donut :: Option Pie (Options Donut)
donut = cmap Opt.options (opt "donut")

size :: Option Donut String
size = opt "size"

background :: Option Donut String
background = opt "background"

