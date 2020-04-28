
module Apexcharts.Annotations.Points.Label.Style where


import Apexcharts.Annotations.Points.Label (Label)
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

fontWeight :: Option Style Number
fontWeight = opt "fontWeight"

fontFamily :: Option Style String
fontFamily = opt "fontFamily"

cssClass :: Option Style String
cssClass = opt "cssClass"

