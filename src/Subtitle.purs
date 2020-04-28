
module Apexcharts.Subtitle where


import Apexcharts
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Subtitle

subtitle :: Option Apexoptions (Options Subtitle)
subtitle = cmap Opt.options (opt "subtitle")

text :: Option Subtitle String
text = opt "text"

align :: Option Subtitle String
align = opt "align"

margin :: Option Subtitle Number
margin = opt "margin"

offsetX :: Option Subtitle Number
offsetX = opt "offsetX"

offsetY :: Option Subtitle Number
offsetY = opt "offsetY"

floating :: Option Subtitle Boolean
floating = opt "floating"

