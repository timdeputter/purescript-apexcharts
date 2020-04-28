
module Apexcharts.Xaxis.Labels where


import Apexcharts.Xaxis (Xaxis)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Labels

labels :: Option Xaxis (Options Labels)
labels = cmap Opt.options (opt "labels")

show :: Option Labels Boolean
show = opt "show"

rotate :: Option Labels Number
rotate = opt "rotate"

rotateAlways :: Option Labels Boolean
rotateAlways = opt "rotateAlways"

hideOverlappingLabels :: Option Labels Boolean
hideOverlappingLabels = opt "hideOverlappingLabels"

showDuplicates :: Option Labels Boolean
showDuplicates = opt "showDuplicates"

trim :: Option Labels Boolean
trim = opt "trim"

minHeight :: Option Labels Number
minHeight = opt "minHeight"

maxHeight :: Option Labels Number
maxHeight = opt "maxHeight"

offsetX :: Option Labels Number
offsetX = opt "offsetX"

offsetY :: Option Labels Number
offsetY = opt "offsetY"

format :: Option Labels String
format = opt "format"

datetimeUTC :: Option Labels Boolean
datetimeUTC = opt "datetimeUTC"

