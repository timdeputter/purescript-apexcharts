
module Apexcharts.NoData.Style where


import Apexcharts.NoData (NoData)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Style

style :: Option NoData (Options Style)
style = cmap Opt.options (opt "style")

color :: Option Style String
color = opt "color"

fontSize :: Option Style String
fontSize = opt "fontSize"

fontFamily :: Option Style String
fontFamily = opt "fontFamily"

