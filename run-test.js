var exec = require('child_process').exec, child;

/**
 * Execute simple shell command (async wrapper).
 * @param {String} cmd
 * @return {Object} { stdout: String, stderr: String }
 */
async function sh(cmd) {
  return new Promise(function (resolve, reject) {
    exec(cmd, (err, stdout, stderr) => {
      if (err) {
        reject(err);
      } else {
        resolve({ stdout, stderr });
      }
    });
  });
}

async function main() {
    (await getExamples()).forEach(async el => {
        doLog(await sh(`pulp browserify --include examples --main Examples.${el} --to examples/build/${el}.js`));
        doLog(await sh(`taiko ./taiko/test-${el}.js --observe`));    
    });
}

function doLog(res) {
    console.log(res.stdout);
    console.log(res.stderr);
}


async function getExamples() {
    var files = (await sh('ls examples/*.purs')).stdout.split('\n');
    var res = [];
    files.forEach(element => {
        var m = element.match(/examples\/(.+)\.purs/i);
        if(m !== null) {
            res.push(m[1]);
        }
    });
    return res;
}
  
main();