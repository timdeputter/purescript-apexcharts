
module Apexcharts.Yaxis.Title where


import Apexcharts.Yaxis (Yaxis)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Title

title :: Option Yaxis (Options Title)
title = cmap Opt.options (opt "title")

text :: Option Title String
text = opt "text"

rotate :: Option Title Number
rotate = opt "rotate"

offsetX :: Option Title Number
offsetX = opt "offsetX"

offsetY :: Option Title Number
offsetY = opt "offsetY"

