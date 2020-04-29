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

async function runTaikoExamples() {
  var examples = await getExamples();
  var failed = 0;
    await asyncForEach(examples, async el => {
      if(await runExample(el) == "failed") failed++;
    });
    var count = examples.length;
    console.log(`${count} examples finished. ${failed} failed.`);
    if(failed > 0) process.exit(-1);
}

async function runExample(el) {
  console.log("Running example " + el + ":"); 
  doLog(await sh(`pulp browserify --include examples --main Examples.${el} --to examples/build/${el}.js`));
  try {
    doLog(await sh(`taiko ./taiko/test-${el}.js --observe`));  
  } catch (error) {
    console.error(`Example ${el} failed!`)
    return "failed";
  }
  return "success";
}

async function buildExamples() {
  await asyncForEach(await getExamples(), async el => {
    console.log("Building example " + el + ":"); 
    doLog(await sh(`pulp browserify --include examples --main Examples.${el} --to examples/build/${el}.js`));
  });
  console.log("build finished");
}

function doLog(res) {
    console.log(res.stdout);
    console.error(res.stderr);
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

async function asyncForEach(array, callback) {
    for (let index = 0; index < array.length; index++) {
      await callback(array[index], index, array);
    }
}

var args = process.argv.slice(2);

if(args.length > 0) {
  var cmd = args[0];
  if(cmd === "test") runTaikoExamples();
  if(cmd === "build") buildExamples();
} else {
  runExample("Radialbarchart");
}

