module Apexcharts where

import Prelude

import Data.Options (Option, Options, opt)
import Data.Options as Opt
import Effect (Effect)
import Foreign (Foreign)

data Apexoptions


foreign import data Apexchart :: Type



data OrientationType = X | Y | XY

orientationTypeToString :: OrientationType -> String
orientationTypeToString = case _ of
    X -> "x"
    Y -> "y"
    XY -> "xy"






data FontWeightNum = N100 | N200 | N300 | N400 | N500 | N600 | N700 | N800 | N900

fontWeightNumToString :: FontWeightNum -> Int
fontWeightNumToString = case _ of
  N100 -> 100
  N200 -> 200
  N300 -> 300
  N400 -> 400
  N500 -> 500
  N600 -> 600
  N700 -> 700
  N800 -> 800
  N900 -> 900









class Enabled a where
  enabled :: Option a Boolean







class Speed a where
  speed :: Option a Number      









class Opacity a b where
  opacity :: Option a b






class Type a b where
  type' :: Option a b










class OffsetX a b where
  offsetX :: Option a b




class OffsetY a b where
  offsetY :: Option a b















class Name a where
    name :: Option a String






class EnabledOnSeries a where
  enabledOnSeries :: Option a (Array Number)





class DashArray a b where
  dashArray :: Option a b


colors :: Option Apexoptions (Array String)
colors = opt "colors"  



class FontFamily a where
  fontFamily :: Option a String




class BackgroundClass a b where
  background :: Option a b



class ForeColor a where
  foreColor :: Option a String
  


class StyleClass a b where
  style :: Option a b




class BorderColor a where
  borderColor :: Option a String





class PaddingClass a b where
  padding :: Option a b




class Top a where
  top :: Option a Int  




class Leftclass a where
  left :: Option a Int  



labels :: Option Apexchart (Array String)
labels = opt "labels"


createChart :: String -> Options Apexoptions -> Apexchart
createChart selector opts = _createChart selector (Opt.options opts)

foreign import _createChart :: String -> Foreign -> Apexchart

foreign import render :: Apexchart -> Effect Unit

foreign import _updateOptions :: Apexchart -> Foreign -> Effect Unit
