module Apexcharts.Grid where




import Apexcharts (Apexoptions)

import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt




data Grid
data Gridaxis
data Lines
data RowOrColumn
data Padding  

data Gridposition = Front | Back

gridpositionToString :: Gridposition -> String
gridpositionToString = case _ of
  Front -> "front"
  Back -> "back"


grid :: Option Apexoptions (Options Grid)
grid = cmap Opt.options (opt "grid")

strokeDashArray :: Option Grid Number
strokeDashArray = opt "strokeDashArray"


opacity :: Option RowOrColumn Number
opacity = opt "opacity"


position :: Option Grid Gridposition
position = cmap gridpositionToString (opt "position")  

lines :: Option Gridaxis (Options Lines)
lines = cmap Opt.options (opt "lines")  

row :: Option Grid (Options RowOrColumn)
row = cmap Opt.options (opt "row")  

column :: Option Grid (Options RowOrColumn)
column = cmap Opt.options (opt "column")  

right :: Option Padding Int
right = opt "right"

bottom :: Option Padding Int
bottom = opt "bottom"


class ShowClass a where
  show :: Option a Boolean

instance showGrid :: ShowClass Grid where
  show = opt "show"

instance showLines :: ShowClass Lines where
  show = opt "show"

colors :: Option RowOrColumn (Array String)
colors = opt "colors"  
    

borderColor :: Option Grid String
borderColor = opt "borderColor"

xaxis :: Option Grid (Options Gridaxis)
xaxis = cmap Opt.options (opt "xaxis")

yaxis :: Option Grid (Options Gridaxis)
yaxis = cmap Opt.options (opt "yaxis")

padding :: Option Grid (Options Padding)
padding = cmap Opt.options (opt "padding")

top :: Option Padding Int
top = opt "top"  

left :: Option Padding Int
left = opt "left"

