
module Apexcharts.Legend.Markers where

import Apexcharts.Legend
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Markers

markers :: Option Apexoptions (Options Markers)
markers = cmap Opt.options (opt "markers")

width :: Option Markers Number
width = opt "width"

height :: Option Markers Number
height = opt "height"

strokeWidth :: Option Markers Number
strokeWidth = opt "strokeWidth"

strokeColor :: Option Markers String
strokeColor = opt "strokeColor"

fillColors :: Option Markers Undefined
fillColors = opt "fillColors"

radius :: Option Markers Number
radius = opt "radius"

customHTML :: Option Markers Undefined
customHTML = opt "customHTML"

onClick :: Option Markers Undefined
onClick = opt "onClick"

offsetX :: Option Markers Number
offsetX = opt "offsetX"

offsetY :: Option Markers Number
offsetY = opt "offsetY"

