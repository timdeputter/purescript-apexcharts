
module Apexcharts.DataLabels.Style where


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

fontWeight :: Option Style String
fontWeight = opt "fontWeight"

colors :: Option Style (Array String)
colors = opt "colors"

