
module Apexcharts.Xaxis.Tooltip.Style where


import Apexcharts.Xaxis.Tooltip (Tooltip)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Style

style :: Option Tooltip (Options Style)
style = cmap Opt.options (opt "style")

fontSize :: Option Style Number
fontSize = opt "fontSize"

fontFamily :: Option Style Number
fontFamily = opt "fontFamily"

