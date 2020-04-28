
module Apexcharts.Fill.Image where


import Apexcharts.Fill (Fill)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Image

image :: Option Fill (Options Image)
image = cmap Opt.options (opt "image")

src :: Option Image (Array String)
src = opt "src"

width :: Option Image Number
width = opt "width"

height :: Option Image Number
height = opt "height"

