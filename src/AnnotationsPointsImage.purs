
module Apexcharts.Annotations.Points.Image where

import Prelude

import Apexcharts.Annotations.Points
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Image

image :: Option Points (Options Image)
image = cmap Opt.options (opt "image")

path :: Option Image Undefined
path = opt "path"

width :: Option Image Number
width = opt "width"

height :: Option Image Number
height = opt "height"

offsetX :: Option Image Number
offsetX = opt "offsetX"

offsetY :: Option Image Number
offsetY = opt "offsetY"

