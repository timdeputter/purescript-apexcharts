
module Apexcharts.Yaxis.Labels where


import Apexcharts.Yaxis (Yaxis)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Labels

labels :: Option Yaxis (Options Labels)
labels = cmap Opt.options (opt "labels")

show :: Option Labels Boolean
show = opt "show"

align :: Option Labels String
align = opt "align"

minWidth :: Option Labels Number
minWidth = opt "minWidth"

maxWidth :: Option Labels Number
maxWidth = opt "maxWidth"

offsetX :: Option Labels Number
offsetX = opt "offsetX"

offsetY :: Option Labels Number
offsetY = opt "offsetY"

rotate :: Option Labels Number
rotate = opt "rotate"

