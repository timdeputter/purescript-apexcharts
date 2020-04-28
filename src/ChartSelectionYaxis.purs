
module Apexcharts.Chart.Selection.Yaxis where


import Apexcharts.Chart.Selection (Selection)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Yaxis

yaxis :: Option Selection (Options Yaxis)
yaxis = cmap Opt.options (opt "yaxis")

min :: Option Yaxis Number
min = opt "min"

max :: Option Yaxis Number
max = opt "max"

