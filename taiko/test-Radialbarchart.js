const { openBrowser, goto, $, closeBrowser } = require('taiko');
const assert = require("assert");
(async () => {
    try {
        console.log(`Current directory: ${process.cwd()}`);
        await openBrowser({args: [" --window-position=2000,3000"]});
        await goto("file:///" + process.cwd() + "/examples/Radialbarchart.html");
        assert.ok(await $(".apexcharts-radial-series").exists());
    } finally {
        await closeBrowser();
    }
})();


