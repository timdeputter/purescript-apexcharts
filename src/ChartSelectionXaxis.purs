
module Apexcharts.Chart.Selection.Xaxis where


import Apexcharts.Chart.Selection (Selection)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Xaxis

xaxis :: Option Selection (Options Xaxis)
xaxis = cmap Opt.options (opt "xaxis")

min :: Option Xaxis Number
min = opt "min"

max :: Option Xaxis Number
max = opt "max"

