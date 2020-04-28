const fs = require('fs');



var desc = {  
    

    markers: {
        size: 0,
        colors: ['#fff'],
        strokeColors: '#fff',
        strokeWidth: 2,
        strokeOpacity: 0.9,
        strokeDashArray: 0,
        fillOpacity: 1,
        discrete: [{
            seriesIndex: 0,
            dataPointIndex: 7,
            fillColor: '#e3e3e3',
            strokeColor: '#fff',
            size: 5
          }],
        shape: "circle",
        radius: 2,
        offsetX: 0,
        offsetY: 0,
        showNullDataPoints: true,
        hover: {
          size: 3,
          sizeOffset: 3
        }
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
            type = typeof(val);
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
    var fnName = currentName === 'type' ? 'type\'' : (currentName === 'class' ? 'class\'' : currentName);
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


