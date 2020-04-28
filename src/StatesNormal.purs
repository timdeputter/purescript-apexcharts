
module Apexcharts.States.Normal where


import Apexcharts.States (States)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data Normal

normal :: Option States (Options Normal)
normal = cmap Opt.options (opt "normal")

