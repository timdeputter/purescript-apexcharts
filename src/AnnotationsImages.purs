
module Apexcharts.Annotations.Images where

import Prelude (map)

import Apexcharts.Annotations (Annotations)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Images

images :: Option Annotations (Array (Options Images))
images = cmap (map Opt.options) (opt "images")

path :: Option Images String
path = opt "path"

x :: Option Images Number
x = opt "x"

y :: Option Images Number
y = opt "y"

width :: Option Images Number
width = opt "width"

height :: Option Images Number
height = opt "height"

appendTo :: Option Images String
appendTo = opt "appendTo"

