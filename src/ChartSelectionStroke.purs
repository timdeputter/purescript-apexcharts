
module Apexcharts.Chart.Selection.Stroke where


import Apexcharts.Chart.Selection (Selection)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Stroke

stroke :: Option Selection (Options Stroke)
stroke = cmap Opt.options (opt "stroke")

width :: Option Stroke Number
width = opt "width"

dashArray :: Option Stroke Number
dashArray = opt "dashArray"

color :: Option Stroke String
color = opt "color"

opacity :: Option Stroke Number
opacity = opt "opacity"

