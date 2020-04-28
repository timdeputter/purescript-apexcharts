
module Apexcharts.Fill where


import Apexcharts (Apexoptions)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Fill

data FillType = Solid
    | Gradient
    | Pattern
    | Image

fillTypeToString :: FillType -> String
fillTypeToString = case _ of
    Solid ->    "solid"
    Gradient ->    "gradient"
    Pattern ->    "pattern"
    Image ->    "image"

fill :: Option Apexoptions (Options Fill)
fill = cmap Opt.options (opt "fill")

colors :: Option Fill (Array String)
colors = opt "colors"

opacity :: Option Fill Number
opacity = opt "opacity"

type' :: Option Fill FillType
type' = cmap fillTypeToString (opt "type")

