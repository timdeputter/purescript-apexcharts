
module Apexcharts.States.Hover.Filter where


import Apexcharts.Common (FilterType, filterTypeToString)
import Apexcharts.States.Hover (Hover)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Filter

filter :: Option Hover (Options Filter)
filter = cmap Opt.options (opt "filter")

type' :: Option Filter FilterType
type' = cmap filterTypeToString (opt "type")

value :: Option Filter Number
value = opt "value"

