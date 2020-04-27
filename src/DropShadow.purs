module Apexcharts.DropShadow where





import Data.Options (Option, opt)




data Dropshadow


enabled :: Option Dropshadow Boolean
enabled = opt "enabled"



class Dropshadowcolor a where
  color :: Option Dropshadow a


instance colorArrStr :: Dropshadowcolor (Array String) where
    color = opt "color"

instance colorStr :: Dropshadowcolor String where
    color = opt "color"

opacity:: Option Dropshadow Number
opacity = opt "opacity"


enabledOnSeries :: Option Dropshadow (Array Number)
enabledOnSeries = opt "enabledOnSeries"


top :: Option Dropshadow Int 
top = opt "top"  

left :: Option Dropshadow Int 
left = opt "left"

blur :: Option Dropshadow Int
blur = opt "blur"
