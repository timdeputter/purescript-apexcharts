module Apexcharts.Commons where

import Data.Options (Option, Options)
  



data OrientationType = X | Y | XY

orientationTypeToString :: OrientationType -> String
orientationTypeToString = case _ of
    X -> "x"
    Y -> "y"
    XY -> "xy"


class FillClass a b where
    fill :: Option a (Options b) 


class Color a b where
  color :: Option a b

class Download a b where
    download :: Option a b


class Pan a b where
  pan :: Option a b

class Reset a b where
  reset :: Option a b

class SelectionClass a b where
  selection :: Option a b

class ToolbarClass a b where
    toolbar :: Option a b

class ZoomClass a b where
  zoom :: Option a b

class Width a b where
  width :: Option a b

class Height a b where
  height :: Option a b

class Colors a where
  colors :: Option a (Array String)

class Opacity a b where
  opacity :: Option a b
