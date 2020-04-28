
module Apexcharts.Annotations.Points.Label where


import Apexcharts.Annotations.Points (Points)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Label

label :: Option Points (Options Label)
label = cmap Opt.options (opt "label")

borderColor :: Option Label String
borderColor = opt "borderColor"

borderWidth :: Option Label Number
borderWidth = opt "borderWidth"

text :: Option Label String
text = opt "text"

textAnchor :: Option Label String
textAnchor = opt "textAnchor"

offsetX :: Option Label Number
offsetX = opt "offsetX"

offsetY :: Option Label Number
offsetY = opt "offsetY"

