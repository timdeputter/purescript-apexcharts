
module Apexcharts.PlotOptions.Candlestick where


import Apexcharts.PlotOptions (PlotOptions)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Candlestick

candlestick :: Option PlotOptions (Options Candlestick)
candlestick = cmap Opt.options (opt "candlestick")

