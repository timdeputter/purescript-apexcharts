
module Apexcharts.Grid where

import Apexcharts (Apexoptions)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Grid

data Position =     
    Front
    | Back

positionToString :: Position -> String
positionToString = case _ of
    Front -> "front"
    Back -> "back"

grid :: Option Apexoptions (Options Grid)
grid = cmap Opt.options (opt "grid")

show :: Option Grid Boolean
show = opt "show"

borderColor :: Option Grid String
borderColor = opt "borderColor"

strokeDashArray :: Option Grid Number
strokeDashArray = opt "strokeDashArray"

position :: Option Grid Position
position = cmap positionToString (opt "position")

