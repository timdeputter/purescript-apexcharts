module Apexcharts.Fill.Pattern where
  

import Apexcharts.Fill (GeneralFill)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt


data Pattern



data PatternStyle = VerticalLines
    | HorizontalLines
    | SlantedLines
    | Squares
    | Circles

patternStyleToString :: PatternStyle -> String
patternStyleToString = case _ of
  VerticalLines -> "verticalLines"
  HorizontalLines -> "horizontalLines"
  SlantedLines -> "slantedLines"
  Squares -> "squares"
  Circles -> "circles"


pattern :: Option GeneralFill (Options Pattern)
pattern = cmap Opt.options (opt "pattern")


height :: Option Pattern Int 
height = opt "height"      


width :: Option Pattern Int
width = opt "width"


style :: Option Pattern PatternStyle
style =  cmap patternStyleToString (opt "style")

strokeWidth :: Option Pattern Int
strokeWidth = opt "strokeWidth"
