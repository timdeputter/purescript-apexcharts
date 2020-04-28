
module Apexcharts.PlotOptions.Pie where


import Apexcharts.PlotOptions (PlotOptions)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Pie

pie :: Option PlotOptions (Options Pie)
pie = cmap Opt.options (opt "pie")

customScale :: Option Pie Number
customScale = opt "customScale"

offsetX :: Option Pie Number
offsetX = opt "offsetX"

offsetY :: Option Pie Number
offsetY = opt "offsetY"

expandOnClick :: Option Pie Boolean
expandOnClick = opt "expandOnClick"

