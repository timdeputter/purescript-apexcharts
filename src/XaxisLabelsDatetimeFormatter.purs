
module Apexcharts.Xaxis.Labels.DatetimeFormatter where


import Apexcharts.Xaxis.Labels (Labels)
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

data DatetimeFormatter

datetimeFormatter :: Option Labels (Options DatetimeFormatter)
datetimeFormatter = cmap Opt.options (opt "datetimeFormatter")

year :: Option DatetimeFormatter String
year = opt "year"

month :: Option DatetimeFormatter String
month = opt "month"

day :: Option DatetimeFormatter String
day = opt "day"

hour :: Option DatetimeFormatter String
hour = opt "hour"

