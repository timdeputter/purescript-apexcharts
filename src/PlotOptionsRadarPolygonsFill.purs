
module Apexcharts.PlotOptions.Radar.Polygons.Fill where

import Prelude

import Apexcharts.PlotOptions.Radar.Polygons
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Fill

fill :: Option Polygons (Options Fill)
fill = cmap Opt.options (opt "fill")

colors :: Option Fill Undefined
colors = opt "colors"

