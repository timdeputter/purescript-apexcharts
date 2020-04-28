
module Apexcharts.Title.Style where


import Apexcharts.Common (FontWeightNum, FontWeightStr, fontWeightNumToInt, fontWeightToString)
import Apexcharts.Title (Title)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Style

style :: Option Title (Options Style)
style = cmap Opt.options (opt "style")

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

color :: Option Style String
color = opt "color"

