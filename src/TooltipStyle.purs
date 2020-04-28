
module Apexcharts.Tooltip.Style where


import Apexcharts.Tooltip (Tooltip)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Style

style :: Option Tooltip (Options Style)
style = cmap Opt.options (opt "style")

fontSize :: Option Style String
fontSize = opt "fontSize"

fontFamily :: Option Style String
fontFamily = opt "fontFamily"

