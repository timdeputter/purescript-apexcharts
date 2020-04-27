module Apexcharts.Axis where

import Apexcharts (Apexoptions)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt



data Axis


data AxisType = Category | Datetime | Numeric

axisTypeToString :: AxisType -> String
axisTypeToString = case _ of
    Category -> "category"
    Datetime -> "datetime"
    Numeric -> "numeric"


xaxis :: Option Apexoptions (Options Axis)
xaxis = cmap Opt.options (opt "xaxis")


type' :: Option Axis AxisType
type' = cmap axisTypeToString (opt "type")


class Categories a where
  categories :: Option Axis (Array a)

instance intcats :: Categories Int where
    categories = opt "categories"

instance strcats :: Categories String where
    categories = opt "categories"
  
instance numcats :: Categories Number where
    categories = opt "categories"
