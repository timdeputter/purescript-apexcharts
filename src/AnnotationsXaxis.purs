
module Apexcharts.Annotations.Xaxis where

import Prelude (map)

import Apexcharts.Annotations (Annotations)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Xaxis

xaxis :: Option Annotations (Array (Options Xaxis))
xaxis = cmap (map Opt.options) (opt "xaxis")

x :: Option Xaxis Number
x = opt "x"

x2 :: Option Xaxis Number
x2 = opt "x2"

strokeDashArray :: Option Xaxis Number
strokeDashArray = opt "strokeDashArray"

borderColor :: Option Xaxis String
borderColor = opt "borderColor"

fillColor :: Option Xaxis String
fillColor = opt "fillColor"

opacity :: Option Xaxis Number
opacity = opt "opacity"

offsetX :: Option Xaxis Number
offsetX = opt "offsetX"

offsetY :: Option Xaxis Number
offsetY = opt "offsetY"

