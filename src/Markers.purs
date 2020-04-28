
module Apexcharts.Markers where

import Prelude

import Apexcharts
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Markers

markers :: Option Apexoptions (Options Markers)
markers = cmap Opt.options (opt "markers")

size :: Option Markers Number
size = opt "size"

colors :: Option Markers (Array String)
colors = opt "colors"

strokeColors :: Option Markers String
strokeColors = opt "strokeColors"

strokeWidth :: Option Markers Number
strokeWidth = opt "strokeWidth"

strokeOpacity :: Option Markers Number
strokeOpacity = opt "strokeOpacity"

strokeDashArray :: Option Markers Number
strokeDashArray = opt "strokeDashArray"

fillOpacity :: Option Markers Number
fillOpacity = opt "fillOpacity"

discrete :: Option Markers (Array Undefined)
discrete = opt "discrete"

shape :: Option Markers String
shape = opt "shape"

radius :: Option Markers Number
radius = opt "radius"

offsetX :: Option Markers Number
offsetX = opt "offsetX"

offsetY :: Option Markers Number
offsetY = opt "offsetY"

showNullDataPoints :: Option Markers Boolean
showNullDataPoints = opt "showNullDataPoints"

