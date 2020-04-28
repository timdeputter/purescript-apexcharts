
module Apexcharts.Annotations.Yaxis.Label.Style where


import Apexcharts.Annotations.Yaxis.Label (Label)
import Apexcharts.Common (FontWeightNum, FontWeightStr, fontWeightNumToInt, fontWeightToString)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Style

style :: Option Label (Options Style)
style = cmap Opt.options (opt "style")

background :: Option Style String
background = opt "background"

color :: Option Style String
color = opt "color"

fontSize :: Option Style String
fontSize = opt "fontSize"

class FontWeightClass a where
  fontWeight :: Option Style a

instance fontWeightNum :: FontWeightClass FontWeightNum where
  fontWeight = cmap fontWeightNumToInt (opt "fontWeight")

instance fontWeightStr :: FontWeightClass FontWeightStr where
  fontWeight = cmap fontWeightToString (opt "fontWeight")


fontFamily :: Option Style String
fontFamily = opt "fontFamily"

cssClass :: Option Style String
cssClass = opt "cssClass"

