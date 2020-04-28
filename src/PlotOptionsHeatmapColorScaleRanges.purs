
module Apexcharts.PlotOptions.Heatmap.ColorScale.Ranges where

import Prelude (map)

import Apexcharts.PlotOptions.Heatmap.ColorScale (ColorScale)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Ranges

ranges :: Option ColorScale (Array (Options Ranges))
ranges = cmap (map Opt.options) (opt "ranges")

from :: Option Ranges Number
from = opt "from"

to :: Option Ranges Number
to = opt "to"

color :: Option Ranges String
color = opt "color"

foreColor :: Option Ranges String
foreColor = opt "foreColor"

name :: Option Ranges String
name = opt "name"

