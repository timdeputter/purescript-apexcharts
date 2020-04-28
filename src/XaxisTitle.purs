
module Apexcharts.Xaxis.Title where


import Apexcharts.Xaxis (Xaxis)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Title

title :: Option Xaxis (Options Title)
title = cmap Opt.options (opt "title")

text :: Option Title String
text = opt "text"

offsetX :: Option Title Number
offsetX = opt "offsetX"

offsetY :: Option Title Number
offsetY = opt "offsetY"

