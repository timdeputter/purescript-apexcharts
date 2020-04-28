const fs = require('fs');



var desc = {  

    annotations: {
        position: 'front' ,
        yaxis: [{
            y: 0,
            y2: null,
            strokeDashArray: 1,
            borderColor: '#c2c2c2',
            fillColor: '#c2c2c2',
            opacity: 0.3,
            offsetX: 0,
            offsetY: -3,
            yAxisIndex: 0,
            label: {
                borderColor: '#c2c2c2',
                borderWidth: 1,
                text: undefined,
                textAnchor: 'end',
                position: 'right',
                offsetX: 0,
                offsetY: 0,
                style: {
                    background: '#fff',
                    color: '#777',
                    fontSize: '12px',
                    fontWeight: 400,
                    fontFamily: undefined,
                    cssClass: 'apexcharts-yaxis-annotation-label',
                    padding: {
                      left: 5,
                      right: 5,
                      top: 0,
                      bottom: 2,
                    }
                },
            },
        }],
        xaxis: [{
          x: 0,
          x2: null,
          strokeDashArray: 1,
          borderColor: '#c2c2c2',
          fillColor: '#c2c2c2',
          opacity: 0.3,
          offsetX: 0,
          offsetY: 0,
          label: {
              borderColor: '#c2c2c2',
              borderWidth: 1,
              text: undefined,
              textAnchor: 'middle',
              position: 'top',
              orientation: 'vertical',
              offsetX: 0,
              offsetY: 0,
              style: {
                  background: '#fff',
                  color: '#777',
                  fontSize: '12px',
                  fontWeight: 400,
                  fontFamily: undefined,
                  cssClass: 'apexcharts-xaxis-annotation-label',
              },
          },
        }],
        points: [{
          x: 0,
          y: null,
          yAxisIndex: 0,
          seriesIndex: 0,
          marker: {
            size: 0,
            fillColor: "#fff",
            strokeColor: "#333",
            strokeWidth: 3,
            shape: "circle",
            radius: 2,
            OffsetX: 0,
            OffsetY: 0,
            cssClass: '',
          },
          label: {
              borderColor: '#c2c2c2',
              borderWidth: 1,
              text: undefined,
              textAnchor: 'middle',
              offsetX: 0,
              offsetY: -15,
              style: {
                  background: '#fff',
                  color: '#777',
                  fontSize: '12px',
                  fontWeight: 400,
                  fontFamily: undefined,
                  cssClass: 'apexcharts-point-annotation-label',
                  padding: {
                    left: 5,
                    right: 5,
                    top: 0,
                    bottom: 2,
                  }
              },
          },
          image: {
            path: undefined,
            width: 20,
            height: 20,
            offsetX: 0,
            offsetY: 0,
          }
        }],
        
        texts: [{
          x: 0,
          y: 0,
          text: '',
          textAnchor: 'start',
          foreColor: undefined,
          fontSize: '13px',
          fontFamily: undefined,
          fontWeight: 400,
          appendTo: '.apexcharts-annotations',
          backgroundColor: 'transparent',
          borderColor: '#c2c2c2',
          borderRadius: 0,
          borderWidth: 0,
          paddingLeft: 4,
          paddingRight: 4,
          paddingTop: 2,
          paddingBottom: 2,
        }],
      
        shapes: [{
          x: 0,
          y: 0,
          type: 'rect',
          width: '100%',
          height: 50,
          appendTo: '.apexcharts-annotations',
          backgroundColor: '#fff',
          opacity: 1,
          borderColor: '#c2c2c2',
          borderRadius: 4,
          borderWidth: 0,
        }],
        images: [{
          path: '',
          x: 0,
          y: 0,
          width: 20,
          height: 20,
          appendTo: '.apexcharts-annotations'
        }],
      }

};


var createTypeDefinitions = function(toCheck, currentName, parents, arr, isArray) {
    arr.push({
        filename: getFilename(parents, currentName), 
        code: createFunctions(toCheck, currentName, parents, arr, 
            createModuleAndDataDef(currentName, parents, isArray))
    });
};

var getFilename = function(parents, currentName) {
    return "./src/" + parents.filter(p => p !== "Apexoptions")
        .join("") + capitalizeFLetter(currentName) + ".purs";
};


var createFunctions = function(toCheck, currentName, parents, arr, sourceCode) {
    var names = Object.getOwnPropertyNames(toCheck);
    names.forEach(name => {
        var val = toCheck[name];
        var type = typeof(val);
        console.log(name);
        console.log(type);
        var isArray = false;
        if(Array.isArray(val)){
            val = val[0];
            isArray = true;
        }
        if(val === null){
            sourceCode += createFn(name, capitalizeFLetter(currentName), 
                "Unknown", isArray);

        } else if(type === 'object'){
            createTypeDefinitions(val, name, parents.concat
                ([capitalizeFLetter(currentName)]), arr, isArray);
        } else {
            sourceCode += createFn(name, capitalizeFLetter(currentName), 
                capitalizeFLetter(type), isArray);
        }    
    });
    return sourceCode;
};


var createModuleAndDataDef = function(currentName, parents, isArray) {
    var modparents = parents.filter(p => p !== "Apexoptions")
    var parentModuleImport = modparents[0] == "Apexoptions" || modparents.length == 0 ? "import Apexcharts" : "import Apexcharts." + joinStrs(modparents);
    var moduleName = modparents.length == 0 
        ? "Apexcharts." + capitalizeFLetter(currentName)
        : "Apexcharts." + joinStrs(modparents) + "." + capitalizeFLetter(currentName); 
    if(parents.length > 0) {
    var sourceCode = `
module ${moduleName} where

import Prelude

${parentModuleImport}
import Data.Functor.Contravariant (cmap)
import Data.Options (Option, Options, opt)
import Data.Options as Opt

`;
    sourceCode += createDataType(currentName, parents, isArray);
    return sourceCode;
    }
    return "";
};

var createDataType = function(currentName, parents, isArray) {
    var sourceCode = 'data ' + capitalizeFLetter(currentName) + "\n\n";
    var fnName = currentName === 'type' ? 'type\'' : currentName;
    if(isArray) {
        sourceCode += fnName + ' :: Option ' + capitalizeFLetter(parents[parents.length-1]) 
            + ' (Array (Options ' + capitalizeFLetter(currentName) + '))\n';
        sourceCode += fnName + ' = cmap (map Opt.options) (opt \"' + currentName + '\")\n\n';    
    } else {
        sourceCode += fnName + ' :: Option ' + capitalizeFLetter(parents[parents.length-1]) 
            + ' (Options ' + capitalizeFLetter(currentName) + ')\n';
        sourceCode += fnName + ' = cmap Opt.options (opt \"' + currentName + '\")\n\n';    
    }
    return sourceCode;    
};

var createFn = function(name, typeName, optTypeName, isArray) {
    var res = "";
    var fnName = name === 'type' ? 'type\'' : name;
    res += fnName + ' :: Option ' + typeName + ' ' 
        + (isArray ? '(Array ' + optTypeName + ')' : optTypeName) + '\n';
    res += fnName + ' = opt \"' + name + "\"\n\n";
    return res;
}

var capitalizeFLetter = function(str) { 
    return str[0].toUpperCase() +  str.slice(1); 
};

var joinStrs = function(arr) {
    var res = "";
    arr.forEach(element => {
        res += element + ".";
    });
    return res.substring(0, res.length - 1);
}

var res = [];
createTypeDefinitions(desc, 'Apexoptions', [], res)
res.filter(e => e.filename !== "./src/Apexoptions.purs").forEach(sc => {
    console.log("Schreibe Datei: " + sc.filename);
    fs.writeFile(sc.filename, sc.code, err =>{ if(err) console.log(err)});

    console.log("done");
});


