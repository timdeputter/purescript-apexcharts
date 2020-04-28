
module Apexcharts.Legend where

import Apexcharts (Apexoptions)

import Apexcharts.Common (FontWeightNum, FontWeightStr, fontWeightNumToInt, fontWeightToString)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Legend

legend :: Option Apexoptions (Options Legend)
legend = cmap Opt.options (opt "legend")

show :: Option Legend Boolean
show = opt "show"

showForSingleSeries :: Option Legend Boolean
showForSingleSeries = opt "showForSingleSeries"

showForNullSeries :: Option Legend Boolean
showForNullSeries = opt "showForNullSeries"

showForZeroSeries :: Option Legend Boolean
showForZeroSeries = opt "showForZeroSeries"

position :: Option Legend String
position = opt "position"

horizontalAlign :: Option Legend String
horizontalAlign = opt "horizontalAlign"

floating :: Option Legend Boolean
floating = opt "floating"

fontSize :: Option Legend String
fontSize = opt "fontSize"

fontFamily :: Option Legend String
fontFamily = opt "fontFamily"

class FontWeightClass a where
  fontWeight :: Option Legend a

instance fontWeightNum :: FontWeightClass FontWeightNum where
  fontWeight = cmap fontWeightNumToInt (opt "fontWeight")

instance fontWeightStr :: FontWeightClass FontWeightStr where
  fontWeight = cmap fontWeightToString (opt "fontWeight")


inverseOrder :: Option Legend Boolean
inverseOrder = opt "inverseOrder"

width :: Option Legend Number
width = opt "width"

height :: Option Legend Number
height = opt "height"

offsetX :: Option Legend Number
offsetX = opt "offsetX"

offsetY :: Option Legend Number
offsetY = opt "offsetY"

