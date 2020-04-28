
module Apexcharts.Annotations.Texts where

import Apexcharts.Annotations (Annotations)
import Apexcharts.Common (FontWeightNum, FontWeightStr, fontWeightNumToInt, fontWeightToString)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt
import Prelude (map)

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

class FontWeightClass a where
  fontWeight :: Option Texts a

instance fontWeightNum :: FontWeightClass FontWeightNum where
  fontWeight = cmap fontWeightNumToInt (opt "fontWeight")

instance fontWeightStr :: FontWeightClass FontWeightStr where
  fontWeight = cmap fontWeightToString (opt "fontWeight")


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

