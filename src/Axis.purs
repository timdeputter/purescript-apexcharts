module Apexcharts.Axis where

import Apexcharts (class Type, class Xaxis, Apexoptions)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, opt)
import Data.Options as Opt



data Axis


data AxisType = Category | Datetime | Numeric

axisTypeToString :: AxisType -> String
axisTypeToString = case _ of
    Category -> "category"
    Datetime -> "datetime"
    Numeric -> "numeric"


instance apexoptionsXaxis :: Xaxis Apexoptions Axis where
  xaxis = cmap Opt.options (opt "xaxis")


instance typeAxis :: Type Axis AxisType where
    type' = cmap axisTypeToString (opt "type")


class Categories a where
  categories :: Option Axis (Array a)

instance intcats :: Categories Int where
    categories = opt "categories"

instance strcats :: Categories String where
    categories = opt "categories"
  
instance numcats :: Categories Number where
    categories = opt "categories"
