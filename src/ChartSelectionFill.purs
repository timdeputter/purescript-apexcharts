
module Apexcharts.Chart.Selection.Fill where


import Apexcharts.Chart.Selection (Selection)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Fill

fill :: Option Selection (Options Fill)
fill = cmap Opt.options (opt "fill")

color :: Option Fill String
color = opt "color"

opacity :: Option Fill Number
opacity = opt "opacity"

