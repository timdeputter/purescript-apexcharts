
module Apexcharts.PlotOptions.Pie.Donut.Labels.Value where


import Apexcharts.Common (FontWeightNum, FontWeightStr, fontWeightNumToInt, fontWeightToString)
import Apexcharts.PlotOptions.Pie.Donut.Labels (Labels)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Value

value :: Option Labels (Options Value)
value = cmap Opt.options (opt "value")

show :: Option Value Boolean
show = opt "show"

fontSize :: Option Value String
fontSize = opt "fontSize"

fontFamily :: Option Value String
fontFamily = opt "fontFamily"

class FontWeightClass a where
  fontWeight :: Option Value a

instance fontWeightNum :: FontWeightClass FontWeightNum where
  fontWeight = cmap fontWeightNumToInt (opt "fontWeight")

instance fontWeightStr :: FontWeightClass FontWeightStr where
  fontWeight = cmap fontWeightToString (opt "fontWeight")


color :: Option Value String
color = opt "color"

offsetY :: Option Value Number
offsetY = opt "offsetY"

