
module Apexcharts.PlotOptions.Bar.Colors.Ranges where

import Prelude (map)

import Apexcharts.PlotOptions.Bar.Colors (Colors)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Ranges

ranges :: Option Colors (Array (Options Ranges))
ranges = cmap (map Opt.options) (opt "ranges")

from :: Option Ranges Number
from = opt "from"

to :: Option Ranges Number
to = opt "to"

color :: Option Ranges String
color = opt "color"

