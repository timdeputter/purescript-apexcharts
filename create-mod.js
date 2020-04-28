const fs = require('fs');



var desc = {  
    


    xaxis: {
        type: 'category',
        categories: [],
        labels: {
            show: true,
            rotate: -45,
            rotateAlways: false,
            hideOverlappingLabels: true,
            showDuplicates: false,
            trim: false,
            minHeight: 3,
            maxHeight: 120,
            style: {
                colors: [],
                fontSize: '12px',
                fontFamily: 'Helvetica, Arial, sans-serif',
                fontWeight: 400,
                cssClass: 'apexcharts-xaxis-label',
            },
            offsetX: 0,
            offsetY: 0,
            format: "undefined",
            datetimeUTC: true,
            datetimeFormatter: {
                year: 'yyyy',
                month: "MMM 'yy",
                day: 'dd MMM',
                hour: 'HH:mm',
            },
        },
        axisBorder: {
            show: true,
            color: '#78909C',
            height: 1,
            width: '100%',
            offsetX: 0,
            offsetY: 0
        },
        axisTicks: {
            show: true,
            borderType: 'solid',
            color: '#78909C',
            height: 6,
            offsetX: 0,
            offsetY: 0
        },
        tickAmount: 3,
        tickPlacement: 'between',
        min: 2,
        max: 3,
        range: 4,
        floating: false,
        position: 'bottom',
        title: {
            text: "undefined",
            offsetX: 0,
            offsetY: 0,
            style: {
                color: "undefined",
                fontSize: '12px',
                fontFamily: 'Helvetica, Arial, sans-serif',
                fontWeight: 600,
                cssClass: 'apexcharts-xaxis-title',
            },
        },
        crosshairs: {
            show: true,
            width: 1,
            position: 'back',
            opacity: 0.9,        
            stroke: {
                color: '#b6b6b6',
                width: 0,
                dashArray: 0,
            },
            fill: {
                type: 'solid',
                color: '#B1B9C4',
                gradient: {
                    colorFrom: '#D8E3F0',
                    colorTo: '#BED1E6',
                    stops: [0, 100],
                    opacityFrom: 0.4,
                    opacityTo: 0.5,
                },
            },
            dropShadow: {
                enabled: false,
                top: 0,
                left: 0,
                blur: 1,
                opacity: 0.4,
            },
        },
        tooltip: {
            enabled: true,
            offsetY: 0,
            style: {
              fontSize: 0,
              fontFamily: 0,
            },
        },
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
    var parentModuleImport = modparents[0] == "Apexoptions" || modparents.length == 0 ? "import Apexcharts" : "import Apexcharts." + joinStrs(modparents) + " (" + modparents[modparents.length-1] + ")";
    var moduleName = modparents.length == 0 
        ? "Apexcharts." + capitalizeFLetter(currentName)
        : "Apexcharts." + joinStrs(modparents) + "." + capitalizeFLetter(currentName); 
    if(parents.length > 0) {
    var sourceCode = `
module ${moduleName} where


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
    var fnName = currentName === 'type' ? 'type\'' : (currentName === 'class' 
        ? 'class\'' : (currentName == 'data' ? 'data\'': currentName));
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


