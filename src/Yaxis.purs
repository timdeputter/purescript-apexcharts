
module Apexcharts.Yaxis where


import Apexcharts
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Yaxis

yaxis :: Option Apexoptions (Options Yaxis)
yaxis = cmap Opt.options (opt "yaxis")

show :: Option Yaxis Boolean
show = opt "show"

showAlways :: Option Yaxis Boolean
showAlways = opt "showAlways"

showForNullSeries :: Option Yaxis Boolean
showForNullSeries = opt "showForNullSeries"

seriesName :: Option Yaxis String
seriesName = opt "seriesName"

opposite :: Option Yaxis Boolean
opposite = opt "opposite"

reversed :: Option Yaxis Boolean
reversed = opt "reversed"

logarithmic :: Option Yaxis Boolean
logarithmic = opt "logarithmic"

tickAmount :: Option Yaxis Number
tickAmount = opt "tickAmount"

min :: Option Yaxis Number
min = opt "min"

max :: Option Yaxis Number
max = opt "max"

forceNiceScale :: Option Yaxis Boolean
forceNiceScale = opt "forceNiceScale"

floating :: Option Yaxis Boolean
floating = opt "floating"

decimalsInFloat :: Option Yaxis Number
decimalsInFloat = opt "decimalsInFloat"

