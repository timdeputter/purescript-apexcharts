
module Apexcharts.DataLabels.Style where


import Apexcharts.Common (FontWeightNum, FontWeightStr, fontWeightNumToInt, fontWeightToString)
import Apexcharts.DataLabels (DataLabels)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Style

style :: Option DataLabels (Options Style)
style = cmap Opt.options (opt "style")

fontSize :: Option Style String
fontSize = opt "fontSize"

fontFamily :: Option Style String
fontFamily = opt "fontFamily"

class FontWeightClass a where
  fontWeight :: Option Style a

instance fontWeightNum :: FontWeightClass FontWeightNum where
  fontWeight = cmap fontWeightNumToInt (opt "fontWeight")

instance fontWeightStr :: FontWeightClass FontWeightStr where
  fontWeight = cmap fontWeightToString (opt "fontWeight")

colors :: Option Style (Array String)
colors = opt "colors"

