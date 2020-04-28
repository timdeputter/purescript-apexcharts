
module Apexcharts.Annotations.Points where

import Prelude (map)

import Apexcharts.Annotations (Annotations)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Points

points :: Option Annotations (Array (Options Points))
points = cmap (map Opt.options) (opt "points")

x :: Option Points Number
x = opt "x"

y :: Option Points Number
y = opt "y"

yAxisIndex :: Option Points Number
yAxisIndex = opt "yAxisIndex"

seriesIndex :: Option Points Number
seriesIndex = opt "seriesIndex"

