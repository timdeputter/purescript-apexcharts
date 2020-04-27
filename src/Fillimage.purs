module Apexcharts.Fill.Image where
  


import Apexcharts.Fill (GeneralFill)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt


data Image


image :: Option GeneralFill (Options Image)
image = cmap Opt.options (opt "image")


height :: Option Image Int
height = opt "height"      


width :: Option Image Int 
width = opt "width"

src :: Option Image (Array String)
src = opt "src"  


