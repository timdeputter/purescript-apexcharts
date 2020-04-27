module Test.Main where



import Apexcharts (colors, dashArray, labels)
import Apexcharts.Axis (AxisType(..), categories, xaxis)
import Apexcharts.Axis as Ax
import Apexcharts.Chart (ChartType(..), StackType(..))
import Apexcharts.Chart as C
import Apexcharts.Chart.Animations (Easing(..), animations)
import Apexcharts.Chart.Animations as A
import Apexcharts.Chart.Animations.AnimateGradually (animateGradually, enabled, graduallyDelay) as AG
import Apexcharts.Chart.Animations.DynamicAnimation as DA
import Apexcharts.Chart.Brush as B
import Apexcharts.Chart.Locales as L
import Apexcharts.Chart.Selection as S
import Apexcharts.Chart.Toolbar as CT
import Apexcharts.Chart.Toolbar.Tools as CTT
import Apexcharts.Chart.Zoom as Z
import Apexcharts.Chart.Fill as CF
import Apexcharts.Commons (OrientationType(..), height, width)
import Apexcharts.DataLabels (TextAnchor(..), dataLabels)
import Apexcharts.DataLabels as DL
import Apexcharts.DataLabels.Background as DLB
import Apexcharts.DataLabels.Style (FontWeight(..))
import Apexcharts.DataLabels.Style as DLS
import Apexcharts.DropShadow as DS
import Apexcharts.Fill (FillType(..))
import Apexcharts.Fill as F
import Apexcharts.Fill.Gradient (GradientType(..), Shade(..))
import Apexcharts.Fill.Gradient as FG
import Apexcharts.Fill.Image as FI
import Apexcharts.Fill.Pattern (PatternStyle(..))
import Apexcharts.Fill.Pattern as FP
import Apexcharts.Grid (Gridposition(..))
import Apexcharts.Grid (borderColor, bottom, colors, column, grid, left, lines, opacity, padding, position, right, row, show, strokeDashArray, top, xaxis, yaxis) as AG
import Apexcharts.Mainstroke (Curve(..), LineCap(..))
import Apexcharts.Mainstroke as AS
import Apexcharts.Series as SE
import Apexcharts.Title (Align(..))
import Apexcharts.Title as AT
import Data.Options (Options, (:=))
import Data.Options as Opt
import Effect (Effect)
import Effect.Aff (Aff)
import Foreign (Foreign)
import Prelude (Unit, discard, ($), (<>))
import Test.Spec (describe, it)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Reporter (specReporter)
import Test.Spec.Runner (run)

main :: Effect Unit
main = run [specReporter] do
  describe "basic chart" do
    let 
      expected = "{\"chart\":{\"type\":\"line\"}," 
        <> "\"series\":[{\"name\":\"sales\",\"data\":[30,40,35,50,49,60,70,91,125]}],"
        <> "\"xaxis\":{\"categories\":[1991,1992,1993,1994,1995,1996,1997,1998,1999]}}"
      basicChart =  (
        C.chart := (C.type' := Line) 
        <> SE.series := [
          SE.name := "sales"
          <> SE.data' := [30,40,35,50,49,60,70,91,125]
        ]
        <> xaxis := (
          categories := [1991,1992,1993,1994,1995,1996,1997,1998,1999]
        )
      )
    it "is possible" $ basicChart `shouldBeOption` expected
      
  describe "Apexoptions" do
    describe "chart" do
      describe "animations" do
        it "enabled" $ (C.chart := (animations := (A.enabled := true))) `shouldBeOption` "{\"chart\":{\"animations\":{\"enabled\":true}}}"
        it "easing" $ (C.chart := (animations := (A.easing := Linear))) `shouldBeOption` "{\"chart\":{\"animations\":{\"easing\":\"linear\"}}}"
        it "speed" $ (C.chart := (animations := (A.speed := 800.0))) `shouldBeOption` "{\"chart\":{\"animations\":{\"speed\":800}}}"
        describe "animateGradually" do
          it "enabled" $ (C.chart := (animations := (AG.animateGradually := (AG.enabled := true)))) 
            `shouldBeOption` "{\"chart\":{\"animations\":{\"animateGradually\":{\"enabled\":true}}}}"
          it "delay" $ (C.chart := (animations := (AG.animateGradually := (AG.graduallyDelay := 150.0)))) 
            `shouldBeOption` "{\"chart\":{\"animations\":{\"animateGradually\":{\"delay\":150}}}}"
        describe "dynamicAnimation" do
          it "enabled" $ (C.chart := (animations := (DA.dynamicAnimation := (DA.enabled := true)))) 
            `shouldBeOption` "{\"chart\":{\"animations\":{\"dynamicAnimation\":{\"enabled\":true}}}}"
          it "speed" $ (C.chart := (animations := (DA.dynamicAnimation := (DA.speed := 350.0)))) 
            `shouldBeOption` "{\"chart\":{\"animations\":{\"dynamicAnimation\":{\"speed\":350}}}}"
      it "background" $ (C.chart := (C.background := "#fff")) `shouldBeOption` "{\"chart\":{\"background\":\"#fff\"}}" 
      describe "brush" do
        it "enabled" $ (C.chart := (B.brush := (B.enabled := true))) `shouldBeOption` "{\"chart\":{\"brush\":{\"enabled\":true}}}"
        it "target" $ (C.chart := (B.brush := (B.target := "chartId"))) `shouldBeOption` "{\"chart\":{\"brush\":{\"target\":\"chartId\"}}}"
        it "autoScaleYaxis" $ (C.chart := (B.brush := (B.autoScaleYaxis := true))) `shouldBeOption` "{\"chart\":{\"brush\":{\"autoScaleYaxis\":true}}}"
      it "defaultLocale" $ (C.chart := (C.defaultLocale := "en")) `shouldBeOption` "{\"chart\":{\"defaultLocale\":\"en\"}}"     
      describe "dropshadow" do
        it "enabled" $ (C.chart := (C.dropShadow := (DS.enabled := true))) `shouldBeOption` "{\"chart\":{\"dropShadow\":{\"enabled\":true}}}"
        it "enabledOnSeries" $  (C.chart := (C.dropShadow := (DS.enabledOnSeries := [3.0,2.0]))) 
          `shouldBeOption` "{\"chart\":{\"dropShadow\":{\"enabledOnSeries\":[3,2]}}}"
        it "top" $  (C.chart := (C.dropShadow := (DS.top := 4))) 
          `shouldBeOption` "{\"chart\":{\"dropShadow\":{\"top\":4}}}"
        it "left" $  (C.chart := (C.dropShadow := (DS.left := 5))) 
          `shouldBeOption` "{\"chart\":{\"dropShadow\":{\"left\":5}}}"
        it "blur" $  (C.chart := (C.dropShadow := (DS.blur := 6))) 
          `shouldBeOption` "{\"chart\":{\"dropShadow\":{\"blur\":6}}}"
        it "color" $ (C.chart := (C.dropShadow := (DS.color := ["#fff"]))) 
          `shouldBeOption` "{\"chart\":{\"dropShadow\":{\"color\":[\"#fff\"]}}}"
        it "opacity" $  (C.chart := (C.dropShadow := (DS.opacity := 7.0))) 
          `shouldBeOption` "{\"chart\":{\"dropShadow\":{\"opacity\":7}}}"
      it "fontFamily" $ (C.chart := (C.fontFamily := "Helvetica, Arial")) `shouldBeOption` "{\"chart\":{\"fontFamily\":\"Helvetica, Arial\"}}"
      it "foreColor" $ (C.chart := (C.foreColor := "#373d3f")) `shouldBeOption` "{\"chart\":{\"foreColor\":\"#373d3f\"}}"
      it "group" $ (C.chart := (C.group := "g1")) `shouldBeOption` "{\"chart\":{\"group\":\"g1\"}}"
      describe "height" do
        it "as number" $ (C.chart := (height := 33.0)) `shouldBeOption` "{\"chart\":{\"height\":33}}"
        it "as string" $ (C.chart := (height := "44px")) `shouldBeOption` "{\"chart\":{\"height\":\"44px\"}}"
      it "id" $ (C.chart := (C.id := "c1")) `shouldBeOption` "{\"chart\":{\"id\":\"c1\"}}"
      describe "locales" do
        it "name" $ (C.chart := (L.locales := [L.name := "en"])) `shouldBeOption` "{\"chart\":{\"locales\":[{\"name\":\"en\"}]}}" 
        describe "options" do
          it "months" $ (C.chart := (L.locales := [L.options := (L.months := ["Ja", "Fe"])])) 
            `shouldBeOption` "{\"chart\":{\"locales\":[{\"options\":{\"months\":[\"Ja\",\"Fe\"]}}]}}" 
          it "shortMonths" $ (C.chart := (L.locales := [L.options := (L.shortMonths := ["J", "F"])])) 
            `shouldBeOption` "{\"chart\":{\"locales\":[{\"options\":{\"shortMonths\":[\"J\",\"F\"]}}]}}" 
          it "days" $ (C.chart := (L.locales := [L.options := (L.days := ["Mo", "Di"])])) 
            `shouldBeOption` "{\"chart\":{\"locales\":[{\"options\":{\"days\":[\"Mo\",\"Di\"]}}]}}" 
          it "shortDays" $ (C.chart := (L.locales := [L.options := (L.shortDays := ["M", "D"])])) 
            `shouldBeOption` "{\"chart\":{\"locales\":[{\"options\":{\"shortDays\":[\"M\",\"D\"]}}]}}" 
          describe "toolbar" do
            it "download" $ (C.chart := (L.locales := [L.options := (L.toolbar := (L.zoomIn := "z" <> L.download := "Dl"))])) 
              `shouldBeOption` "{\"chart\":{\"locales\":[{\"options\":{\"toolbar\":{\"zoomIn\":\"z\",\"download\":\"Dl\"}}}]}}"
            it "selection" $ (C.chart := (L.locales := [L.options := L.toolbar := (L.zoomIn := "z" <> L.selection := "s")]))
              `shouldBeOption` "{\"chart\":{\"locales\":[{\"options\":{\"toolbar\":{\"zoomIn\":\"z\",\"selection\":\"s\"}}}]}}" 
            it "selectionZoom" $ (C.chart := (L.locales := [L.options := (L.toolbar := (L.selectionZoom := "sz"))])) 
              `shouldBeOption` "{\"chart\":{\"locales\":[{\"options\":{\"toolbar\":{\"selectionZoom\":\"sz\"}}}]}}" 
            it "zoomIn" $ (C.chart := (L.locales := [L.options := (L.toolbar := (L.zoomIn := "zi"))])) 
              `shouldBeOption` "{\"chart\":{\"locales\":[{\"options\":{\"toolbar\":{\"zoomIn\":\"zi\"}}}]}}" 
            it "zoomOut" $ (C.chart := (L.locales := [L.options := (L.toolbar := (L.zoomOut := "zo"))])) 
              `shouldBeOption` "{\"chart\":{\"locales\":[{\"options\":{\"toolbar\":{\"zoomOut\":\"zo\"}}}]}}" 
            it "pan" $ (C.chart := (L.locales := [L.options := (L.toolbar := (L.zoomIn := "z" <> L.pan := "p"))])) 
              `shouldBeOption` "{\"chart\":{\"locales\":[{\"options\":{\"toolbar\":{\"zoomIn\":\"z\",\"pan\":\"p\"}}}]}}" 
            it "reset" $ (C.chart := (L.locales := [L.options := (L.toolbar := (L.zoomIn := "z" <> L.reset := "r"))])) 
              `shouldBeOption` "{\"chart\":{\"locales\":[{\"options\":{\"toolbar\":{\"zoomIn\":\"z\",\"reset\":\"r\"}}}]}}" 
      it "offsetX" $ (C.chart := (C.offsetX := 0.0)) `shouldBeOption` "{\"chart\":{\"offsetX\":0}}"          
      it "offsetY" $ (C.chart := (C.offsetY := 1.0)) `shouldBeOption` "{\"chart\":{\"offsetY\":1}}"          
      it "parentHeightOffset" $ (C.chart := (C.parentHeightOffset := 2.0)) `shouldBeOption` "{\"chart\":{\"parentHeightOffset\":2}}"          
      it "redrawOnParentResize" $ (C.chart := (C.redrawOnParentResize := true)) `shouldBeOption` "{\"chart\":{\"redrawOnParentResize\":true}}"          
      it "selection" $ (C.chart := (S.selection := (S.enabled := true <> S.type' := X
        <> S.fill := (CF.color := "#24292e" <> CF.opacity := 0.1)
        <> S.selectionStroke := (S.width := 1.0 <> S.dashArray := 3.0 <> S.color := "#294820" <> S.opacity := 0.4 )
        <> S.xaxis := (S.min := 1.0 <> S.max := 3.0)
        <> S.yaxis := (S.min := 7.0 <> S.max := 11.0)))) 
          `shouldBeOption` ("{\"chart\":{\"selection\":{\"enabled\":true,\"type\":\"x\","
            <> "\"fill\":{\"color\":\"#24292e\",\"opacity\":0.1},"
            <> "\"stroke\":{\"width\":1,\"dashArray\":3,\"color\":\"#294820\",\"opacity\":0.4},"
            <> "\"xaxis\":{\"min\":1,\"max\":3},"
            <> "\"yaxis\":{\"min\":7,\"max\":11}}}}")
      it "sparkline" $ (C.chart := (C.sparkline := (C.enabled := true))) `shouldBeOption` "{\"chart\":{\"sparkline\":{\"enabled\":true}}}"
      it "stacked" $ (C.chart := (C.stacked := true)) `shouldBeOption` "{\"chart\":{\"stacked\":true}}"
      it "stackType" $ (C.chart := (C.stackType := NormalStack)) `shouldBeOption` "{\"chart\":{\"stackType\":\"normal\"}}"
      describe "toolbar" do
        it "show" $ (C.chart := (CT.toolbar := (CT.show := true <> CTT.tools := (CTT.download := true)))) 
          `shouldBeOption` "{\"chart\":{\"toolbar\":{\"show\":true,\"tools\":{\"download\":true}}}}"
        it "offsetX" $ (C.chart := (CT.toolbar := (CT.offsetX := 3.0 <> CTT.tools := (CTT.download := true)))) 
          `shouldBeOption` "{\"chart\":{\"toolbar\":{\"offsetX\":3,\"tools\":{\"download\":true}}}}"
        it "offsetY" $ (C.chart := (CT.toolbar := (CT.offsetY := 4.0 <> CTT.tools := (CTT.download := true)))) 
          `shouldBeOption` "{\"chart\":{\"toolbar\":{\"offsetY\":4,\"tools\":{\"download\":true}}}}"
        it "tools" $ (C.chart := (CT.toolbar := (CTT.tools := (CTT.zoomin := true <> CTT.zoom := true 
          <> CTT.download := true <> CTT.selection := true 
          <> CTT.zoomout := true <> CTT.pan := true <> CTT.reset := true)))) 
            `shouldBeOption` ("{\"chart\":{\"toolbar\":{\"tools\":{\"zoomin\":true,\"zoom\":true,\"download\":true," 
              <> "\"selection\":true,\"zoomout\":true,\"pan\":true,\"reset\":true}}}}")
      it "type" $ (C.chart := (C.type' := Line)) `shouldBeOption` "{\"chart\":{\"type\":\"line\"}}"
      it "width" $ (C.chart := (width := "100%")) `shouldBeOption` "{\"chart\":{\"width\":\"100%\"}}"
      describe "zoom" do
        it "enabled" $ (C.chart := (Z.zooming := (Z.enabled := true))) `shouldBeOption` "{\"chart\":{\"zoom\":{\"enabled\":true}}}"
        it "type" $ (C.chart := (Z.zooming := (Z.type' := X))) `shouldBeOption` "{\"chart\":{\"zoom\":{\"type\":\"x\"}}}"
        it "autoScaleYaxis" $ (C.chart := (Z.zooming := (Z.autoScaleYaxis := true))) `shouldBeOption` "{\"chart\":{\"zoom\":{\"autoScaleYaxis\":true}}}"
        it "fill" $ (C.chart := (Z.zooming := (Z.fill := (CF.color := "#fff" <> CF.opacity := 0.4)))) 
          `shouldBeOption` "{\"chart\":{\"zoom\":{\"fill\":{\"color\":\"#fff\",\"opacity\":0.4}}}}"
        it "stroke" $ (C.chart := (Z.zooming := (Z.zoomStroke := (Z.color := "#fff" <> Z.opacity := 0.4 <> Z.width := 1.0)))) 
          `shouldBeOption` "{\"chart\":{\"zoom\":{\"stroke\":{\"color\":\"#fff\",\"opacity\":0.4,\"width\":1}}}}"
    let 
      opts = colors := ["#fff", "#aaa"]
    it "colors" $ opts `shouldBeOption` "{\"colors\":[\"#fff\",\"#aaa\"]}"
    it "labels" $ (labels := ["Beer", "Bar"]) `shouldBeOption` "{\"labels\":[\"Beer\",\"Bar\"]}"
    
    describe "series" do
      it "name" $ (SE.series := [SE.name := "Series 1"]) `shouldBeOption` "{\"series\":[{\"name\":\"Series 1\"}]}"
      describe "data" do
        it "single values" $ (SE.series := [SE.data' := [23.0, 42.0]]) `shouldBeOption` "{\"series\":[{\"data\":[23,42]}]}"
        it "paired values" $ (SE.series := [SE.data' := [[22.0,23.0], [11.0, 42.0]]]) `shouldBeOption` "{\"series\":[{\"data\":[[22,23],[11,42]]}]}"
        it "paired values xy" $ (SE.series := [SE.data' := [(SE.x := 22.0 <> SE.y := 23.0), (SE.x := 11.0 <> SE.y := 42.0)]]) 
          `shouldBeOption` "{\"series\":[{\"data\":[{\"x\":22,\"y\":23},{\"x\":11,\"y\":42}]}]}"
    
    describe "xaxis" do
      it "type" $ (xaxis := (Ax.type' := Category)) `shouldBeOption` "{\"xaxis\":{\"type\":\"category\"}}"
      it "categories" $ (xaxis := (categories := ["Apples", "Bananas"])) `shouldBeOption` "{\"xaxis\":{\"categories\":[\"Apples\",\"Bananas\"]}}"
    
    describe "dataLabels" do
      it "enabled" $ (dataLabels := (DL.enabled := true)) `shouldBeOption` "{\"dataLabels\":{\"enabled\":true}}"
      it "enabledOnSeries" $ (dataLabels := (DL.enabledOnSeries := [1.0, 3.0])) `shouldBeOption` "{\"dataLabels\":{\"enabledOnSeries\":[1,3]}}"
      it "textAnchor" $ (dataLabels := (DL.textAnchor := Middle)) `shouldBeOption` "{\"dataLabels\":{\"textAnchor\":\"middle\"}}"
      it "distributed" $ (dataLabels := (DL.distributed := true)) `shouldBeOption` "{\"dataLabels\":{\"distributed\":true}}" 
      it "offsetX" $ (dataLabels := (DL.offsetX := 1.0)) `shouldBeOption` "{\"dataLabels\":{\"offsetX\":1}}"
      it "offsetY" $ (dataLabels := (DL.offsetY := 3.0)) `shouldBeOption` "{\"dataLabels\":{\"offsetY\":3}}"
      it "style" $ (dataLabels := (DLS.style := (DLS.fontSize := "14px" <> DLS.fontFamily := "Helvetica, Arial" 
        <> DLS.fontWeight := Bold <> DLS.colors := ["#aaa", "#bbb"]))) 
          `shouldBeOption` ("{\"dataLabels\":{\"style\":{\"fontSize\":\"14px\",\"fontFamily\":\"Helvetica, Arial\","
            <> "\"fontWeight\":{},\"colors\":[\"#aaa\",\"#bbb\"]}}}")
      it "background" $ (dataLabels := (DLB.background := (DLB.enabled := true <> DLB.foreColor := "#fff" <> DLB.padding := 4 <>
          DLB.borderRadius := 2 <> DLB.borderWidth := 1 <> DLB.borderColor := "#fff" <> DLB.opacity := 0.9 <> DLB.dropShadow := (
          DS.enabled := false <> DS.top := 1 <> DS.left := 1 <> DS.blur := 1 <> DS.color := "#000" <> DS.opacity := 0.45))))
          `shouldBeOption` ("{\"dataLabels\":{\"background\":{\"enabled\":true,\"foreColor\":\"#fff\",\"padding\":4,"
            <> "\"borderRadius\":2,\"borderWidth\":1,\"borderColor\":\"#fff\",\"opacity\":0.9,\"dropShadow\":{"
            <> "\"enabled\":false,\"top\":1,\"left\":1,\"blur\":1,\"color\":\"#000\",\"opacity\":0.45}}}}")
      it "dropShadow" $ (dataLabels := (DL.dropShadow := (DS.enabled := false <> DS.top := 1 <> DS.left := 1 
        <> DS.blur := 1 <> DS.color := "#000" <> DS.opacity := 0.45))) `shouldBeOption` 
            "{\"dataLabels\":{\"dropShadow\":{\"enabled\":false,\"top\":1,\"left\":1,\"blur\":1,\"color\":\"#000\",\"opacity\":0.45}}}"

    describe "fill" do
      it "colors" $ (F.fill := (F.colors := (["#aaa", "#bbb"]))) `shouldBeOption` "{\"fill\":{\"colors\":[\"#aaa\",\"#bbb\"]}}"
      it "opacity" $ (F.fill := (F.opacity := 0.9)) `shouldBeOption` "{\"fill\":{\"opacity\":0.9}}"
      it "type" $ (F.fill := F.type' := Solid) `shouldBeOption`  "{\"fill\":{\"type\":\"solid\"}}"
      it "gradient" $ (F.fill := FG.gradient := (FG.shade := Dark <> FG.type' := GradientHorizontal <> FG.shadeIntensity := 0.5
        <> FG.gradientToColors := ["#aaa", "#bbb"] <> FG.inverseColors := true <> FG.opacityFrom := 1.0 <> FG.opacityTo := 2.0
        <> FG.stops := [0, 50, 100])) `shouldBeOption`  ("{\"fill\":{\"gradient\":{\"shade\":\"dark\",\"type\":\"horizontal\","
        <> "\"shadeIntensity\":0.5,\"gradientToColors\":[\"#aaa\",\"#bbb\"],\"inverseColors\":true,"
        <> "\"opacityFrom\":1,\"opacityTo\":2,\"stops\":[0,50,100]}}}")
      it "image" $ (F.fill := (FI.image := (FI.src := ["img.png"] <> FI.width := 10 <> FI.height := 12))) 
        `shouldBeOption` "{\"fill\":{\"image\":{\"src\":[\"img.png\"],\"width\":10,\"height\":12}}}"
      it "pattern" $ (F.fill := (FP.pattern := (FP.style := VerticalLines <> FP.width := 10 <> FP.height := 12 <> FP.strokeWidth := 2)))
        `shouldBeOption` "{\"fill\":{\"pattern\":{\"style\":\"verticalLines\",\"width\":10,\"height\":12,\"strokeWidth\":2}}}"

    describe "grid" do
      it "basics" $ (AG.grid := (AG.show := true <> AG.borderColor := "#90A4AE" <> AG.strokeDashArray := 3.0 <> AG.position := Front)) 
        `shouldBeOption` "{\"grid\":{\"show\":true,\"borderColor\":\"#90A4AE\",\"strokeDashArray\":3,\"position\":\"front\"}}"
      it "xaxis" $ (AG.grid := (AG.position := Front <> AG.xaxis := (AG.lines := (AG.show := false)))) 
        `shouldBeOption` "{\"grid\":{\"position\":\"front\",\"xaxis\":{\"lines\":{\"show\":false}}}}"
      it "yaxis" $ (AG.grid := (AG.position := Front <> AG.yaxis := (AG.lines := (AG.show := false)))) 
        `shouldBeOption` "{\"grid\":{\"position\":\"front\",\"yaxis\":{\"lines\":{\"show\":false}}}}"
      it "row" $ (AG.grid := (AG.row := (AG.colors := ["#aaa"] <> AG.opacity := 0.5))) 
        `shouldBeOption` "{\"grid\":{\"row\":{\"colors\":[\"#aaa\"],\"opacity\":0.5}}}"
      it "column" $ (AG.grid := (AG.column := (AG.colors := ["#aaa"] <> AG.opacity := 0.5))) 
        `shouldBeOption` "{\"grid\":{\"column\":{\"colors\":[\"#aaa\"],\"opacity\":0.5}}}"
      it "padding" $ (AG.grid := (AG.padding := (AG.top := 0 <> AG.right := 0 <> AG.bottom := 0 <> AG.left := 0)))
        `shouldBeOption` "{\"grid\":{\"padding\":{\"top\":0,\"right\":0,\"bottom\":0,\"left\":0}}}"

    describe "stroke" do
      it "show" $ (AS.stroke := (AS.show := true)) `shouldBeOption` "{\"stroke\":{\"show\":true}}"
      it "curve"  $ (AS.stroke := (AS.curve := Smooth)) `shouldBeOption` "{\"stroke\":{\"curve\":\"smooth\"}}"
      it "lineCap" $ (AS.stroke := (AS.lineCap := Butt)) `shouldBeOption` "{\"stroke\":{\"lineCap\":\"butt\"}}"
      it "colors" $ (AS.stroke := (AS.colors := ["#fff", "#aaa"])) `shouldBeOption` "{\"stroke\":{\"colors\":[\"#fff\",\"#aaa\"]}}"
      it "width"  $ (AS.stroke := (AS.width := 2.0)) `shouldBeOption` "{\"stroke\":{\"width\":2}}"
      it "dashArray"   $ (AS.stroke := (dashArray := 3.0)) `shouldBeOption` "{\"stroke\":{\"dashArray\":3}}"

    describe "title" do
      it "text" $ (AT.title := (AT.text := "Der Text")) `shouldBeOption` "{\"title\":{\"text\":\"Der Text\"}}"
      it "align" $ (AT.title := (AT.align := Left)) `shouldBeOption` "{\"title\":{\"align\":\"left\"}}"


shouldBeOption :: forall a. Options a -> String -> Aff Unit
shouldBeOption opti expected = (stringify $ Opt.options opti) `shouldEqual` expected

foreign import stringify :: Foreign -> String


