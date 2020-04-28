
module Apexcharts.Annotations.Texts where

import Prelude (map)

import Apexcharts.Annotations (Annotations)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Texts

texts :: Option Annotations (Array (Options Texts))
texts = cmap (map Opt.options) (opt "texts")

x :: Option Texts Number
x = opt "x"

y :: Option Texts Number
y = opt "y"

text :: Option Texts String
text = opt "text"

textAnchor :: Option Texts String
textAnchor = opt "textAnchor"

foreColor :: Option Texts String
foreColor = opt "foreColor"

fontSize :: Option Texts String
fontSize = opt "fontSize"

fontFamily :: Option Texts String
fontFamily = opt "fontFamily"

fontWeight :: Option Texts Number
fontWeight = opt "fontWeight"

appendTo :: Option Texts String
appendTo = opt "appendTo"

backgroundColor :: Option Texts String
backgroundColor = opt "backgroundColor"

borderColor :: Option Texts String
borderColor = opt "borderColor"

borderRadius :: Option Texts Number
borderRadius = opt "borderRadius"

borderWidth :: Option Texts Number
borderWidth = opt "borderWidth"

paddingLeft :: Option Texts Number
paddingLeft = opt "paddingLeft"

paddingRight :: Option Texts Number
paddingRight = opt "paddingRight"

paddingTop :: Option Texts Number
paddingTop = opt "paddingTop"

paddingBottom :: Option Texts Number
paddingBottom = opt "paddingBottom"

