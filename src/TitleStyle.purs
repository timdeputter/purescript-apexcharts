
module Apexcharts.Title.Style where


import Apexcharts.Title (Title)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Style

style :: Option Title (Options Style)
style = cmap Opt.options (opt "style")

fontSize :: Option Style String
fontSize = opt "fontSize"

fontWeight :: Option Style String
fontWeight = opt "fontWeight"

fontFamily :: Option Style String
fontFamily = opt "fontFamily"

color :: Option Style String
color = opt "color"

