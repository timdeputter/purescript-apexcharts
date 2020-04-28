
module Apexcharts.States.Normal.Filter where


import Apexcharts.States.Normal (Normal)
import Apexcharts.Common (FilterType, filterTypeToString)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Filter

filter :: Option Normal (Options Filter)
filter = cmap Opt.options (opt "filter")

type' :: Option Filter FilterType
type' = cmap filterTypeToString (opt "type")

value :: Option Filter Number
value = opt "value"

