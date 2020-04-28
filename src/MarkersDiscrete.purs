
module Apexcharts.Markers.Discrete where

import Prelude (map)

import Apexcharts.Markers (Markers)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Discrete

discrete :: Option Markers (Array (Options Discrete))
discrete = cmap (map Opt.options) (opt "discrete")

seriesIndex :: Option Discrete Number
seriesIndex = opt "seriesIndex"

dataPointIndex :: Option Discrete Number
dataPointIndex = opt "dataPointIndex"

fillColor :: Option Discrete String
fillColor = opt "fillColor"

strokeColor :: Option Discrete String
strokeColor = opt "strokeColor"

size :: Option Discrete Number
size = opt "size"

