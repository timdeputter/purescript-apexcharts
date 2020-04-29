
module Apexcharts.Xaxis where


import Apexcharts

import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Xaxis

data AxisType = Category
    | Datetime
    | Numeric

axisTypeToString :: AxisType -> String
axisTypeToString = case _ of
        Category -> "category"
        Datetime -> "datetime"
        Numeric -> "numeric"

xaxis :: Option Apexoptions (Options Xaxis)
xaxis = cmap Opt.options (opt "xaxis")

type' :: Option Xaxis AxisType
type' = cmap axisTypeToString (opt "type")

class XaxisCategories a where
    categories :: Option Xaxis (Array a)


instance strCats :: XaxisCategories String where
    categories = opt "categories"

instance intCats :: XaxisCategories Int where
    categories = opt "categories"

instance numCats :: XaxisCategories Number where
    categories = opt "categories"


tickAmount :: Option Xaxis Number
tickAmount = opt "tickAmount"

tickPlacement :: Option Xaxis String
tickPlacement = opt "tickPlacement"

min :: Option Xaxis Number
min = opt "min"

max :: Option Xaxis Number
max = opt "max"

range :: Option Xaxis Number
range = opt "range"

floating :: Option Xaxis Boolean
floating = opt "floating"

position :: Option Xaxis String
position = opt "position"

