
module Apexcharts.Annotations.Xaxis.Label where


import Apexcharts.Annotations.Xaxis (Xaxis)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Label

label :: Option Xaxis (Options Label)
label = cmap Opt.options (opt "label")

borderColor :: Option Label String
borderColor = opt "borderColor"

borderWidth :: Option Label Number
borderWidth = opt "borderWidth"

text :: Option Label String
text = opt "text"

textAnchor :: Option Label String
textAnchor = opt "textAnchor"

position :: Option Label String
position = opt "position"

orientation :: Option Label String
orientation = opt "orientation"

offsetX :: Option Label Number
offsetX = opt "offsetX"

offsetY :: Option Label Number
offsetY = opt "offsetY"

