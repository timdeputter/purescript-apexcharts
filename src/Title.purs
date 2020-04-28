
module Apexcharts.Title where


import Apexcharts
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Title

title :: Option Apexoptions (Options Title)
title = cmap Opt.options (opt "title")

text :: Option Title String
text = opt "text"

align :: Option Title String
align = opt "align"

margin :: Option Title Number
margin = opt "margin"

offsetX :: Option Title Number
offsetX = opt "offsetX"

offsetY :: Option Title Number
offsetY = opt "offsetY"

floating :: Option Title Boolean
floating = opt "floating"

