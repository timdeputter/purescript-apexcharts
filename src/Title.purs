module Apexcharts.Title where



import Apexcharts (Apexoptions)

import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt



data Title

data Align = Left | Center | Right

alignToString :: Align -> String
alignToString = case _ of
  Left -> "left"
  Center -> "center"
  Right -> "right"


title :: Option Apexoptions (Options Title)
title = cmap Opt.options (opt "title")

text :: Option Title String
text = opt "text"

align :: Option Title Align
align =  cmap alignToString (opt "align")
