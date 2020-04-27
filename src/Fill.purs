module Apexcharts.Fill where

import Apexcharts (Apexoptions)

import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt
import Prelude (map)

data GeneralFill



data FillType = Solid | Gradient | Pattern | Image

fillTypeToString :: FillType -> String
fillTypeToString = case _ of
  Solid -> "solid"
  Gradient -> "gradient"
  Pattern -> "pattern"
  Image -> "image"


fill :: Option Apexoptions (Options GeneralFill)
fill = cmap Opt.options (opt "fill")

color :: Option GeneralFill String
color = opt "color"

opacity :: Option GeneralFill Number
opacity = opt "opacity"

class Type a b where
    type' :: Option a b

instance typeGeneralFill :: Type GeneralFill FillType where
    type' = cmap fillTypeToString (opt "type")

instance typeGeneralFillArray :: Type GeneralFill (Array FillType) where
    type' = cmap (map fillTypeToString) (opt "type")


colors :: Option GeneralFill (Array String)
colors = opt "colors"  

