
module Apexcharts.Annotations.Yaxis where

import Prelude (map)

import Apexcharts.Annotations (Annotations)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Yaxis

yaxis :: Option Annotations (Array (Options Yaxis))
yaxis = cmap (map Opt.options) (opt "yaxis")

y :: Option Yaxis Number
y = opt "y"

y2 :: Option Yaxis Number
y2 = opt "y2"

strokeDashArray :: Option Yaxis Number
strokeDashArray = opt "strokeDashArray"

borderColor :: Option Yaxis String
borderColor = opt "borderColor"

fillColor :: Option Yaxis String
fillColor = opt "fillColor"

opacity :: Option Yaxis Number
opacity = opt "opacity"

offsetX :: Option Yaxis Number
offsetX = opt "offsetX"

offsetY :: Option Yaxis Number
offsetY = opt "offsetY"

yAxisIndex :: Option Yaxis Number
yAxisIndex = opt "yAxisIndex"

