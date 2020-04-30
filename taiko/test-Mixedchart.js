const assert = require("assert");
const { openBrowser, goto, text, $, closeBrowser, below } = require('taiko');
(async () => {
    try {
        console.log(`Current directory: ${process.cwd()}`);
        await openBrowser({args: [" --window-position=2000,3000"]});
        await goto("file:///" + process.cwd() + "/examples/Mixedchart.html");
        assert.ok(await $(".apexcharts-area-series").exists());
        assert.ok(await $(".apexcharts-bar-series").exists());
    } finally {
        await closeBrowser();
    }
})();


