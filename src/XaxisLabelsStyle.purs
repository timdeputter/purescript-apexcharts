
module Apexcharts.Xaxis.Labels.Style where


import Apexcharts.Xaxis.Labels (Labels)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Style

style :: Option Labels (Options Style)
style = cmap Opt.options (opt "style")

colors :: Option Style (Array Undefined)
colors = opt "colors"

fontSize :: Option Style String
fontSize = opt "fontSize"

fontFamily :: Option Style String
fontFamily = opt "fontFamily"

fontWeight :: Option Style Number
fontWeight = opt "fontWeight"

cssClass :: Option Style String
cssClass = opt "cssClass"

