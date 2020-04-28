
module Apexcharts.PlotOptions.RadialBar.DataLabels.Name where


import Apexcharts.Common (FontWeightNum, FontWeightStr, fontWeightNumToInt, fontWeightToString)
import Apexcharts.PlotOptions.RadialBar.DataLabels (DataLabels)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Name

name :: Option DataLabels (Options Name)
name = cmap Opt.options (opt "name")

show :: Option Name Boolean
show = opt "show"

fontSize :: Option Name String
fontSize = opt "fontSize"

fontFamily :: Option Name String
fontFamily = opt "fontFamily"

class FontWeightClass a where
  fontWeight :: Option Name a

instance fontWeightNum :: FontWeightClass FontWeightNum where
  fontWeight = cmap fontWeightNumToInt (opt "fontWeight")

instance fontWeightStr :: FontWeightClass FontWeightStr where
  fontWeight = cmap fontWeightToString (opt "fontWeight")


color :: Option Name String
color = opt "color"

offsetY :: Option Name Number
offsetY = opt "offsetY"

