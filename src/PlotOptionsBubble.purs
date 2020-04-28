
module Apexcharts.PlotOptions.Bubble where


import Apexcharts.PlotOptions (PlotOptions)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Bubble

bubble :: Option PlotOptions (Options Bubble)
bubble = cmap Opt.options (opt "bubble")

minBubbleRadius :: Option Bubble Number
minBubbleRadius = opt "minBubbleRadius"

maxBubbleRadius :: Option Bubble Number
maxBubbleRadius = opt "maxBubbleRadius"

