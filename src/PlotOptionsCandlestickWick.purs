
module Apexcharts.PlotOptions.Candlestick.Wick where


import Apexcharts.PlotOptions.Candlestick (Candlestick)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Wick

wick :: Option Candlestick (Options Wick)
wick = cmap Opt.options (opt "wick")

useFillColor :: Option Wick Boolean
useFillColor = opt "useFillColor"

