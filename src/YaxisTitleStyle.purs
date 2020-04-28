
module Apexcharts.Yaxis.Title.Style where


import Apexcharts.Yaxis.Title (Title)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Style

style :: Option Title (Options Style)
style = cmap Opt.options (opt "style")

color :: Option Style String
color = opt "color"

fontSize :: Option Style String
fontSize = opt "fontSize"

fontFamily :: Option Style String
fontFamily = opt "fontFamily"

fontWeight :: Option Style Number
fontWeight = opt "fontWeight"

cssClass :: Option Style String
cssClass = opt "cssClass"

