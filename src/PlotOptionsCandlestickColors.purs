
module Apexcharts.PlotOptions.Candlestick.Colors where


import Apexcharts.PlotOptions.Candlestick (Candlestick)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Colors

colors :: Option Candlestick (Options Colors)
colors = cmap Opt.options (opt "colors")

upward :: Option Colors String
upward = opt "upward"

downward :: Option Colors String
downward = opt "downward"

