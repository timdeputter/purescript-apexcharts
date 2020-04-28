
module Apexcharts.Fill.Gradient.ColorStops where

import Prelude

import Apexcharts.Fill.Gradient
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data ColorStops

colorStops :: Option Gradient (Array (Options ColorStops))
colorStops = cmap (map Opt.options) (opt "colorStops")

offset :: Option ColorStops Number
offset = opt "offset"

color :: Option ColorStops String
color = opt "color"

opacity :: Option ColorStops Number
opacity = opt "opacity"

