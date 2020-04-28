
module Apexcharts.Chart.Toolbar.Tools.CustomIcons where

import Prelude (map)

import Apexcharts.Chart.Toolbar.Tools (Tools)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data CustomIcons

customIcons :: Option Tools (Array (Options CustomIcons))
customIcons = cmap (map Opt.options) (opt "customIcons")

icon :: Option CustomIcons String
icon = opt "icon"

index :: Option CustomIcons Number
index = opt "index"

title :: Option CustomIcons String
title = opt "title"

class' :: Option CustomIcons String
class' = opt "class"

