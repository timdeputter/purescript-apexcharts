
module Apexcharts.PlotOptions.Radar where


import Apexcharts.PlotOptions (PlotOptions)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Radar

radar :: Option PlotOptions (Options Radar)
radar = cmap Opt.options (opt "radar")

size :: Option Radar Number
size = opt "size"

offsetX :: Option Radar Number
offsetX = opt "offsetX"

offsetY :: Option Radar Number
offsetY = opt "offsetY"

