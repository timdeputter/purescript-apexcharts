const assert = require("assert");
const { openBrowser, goto, text, $, closeBrowser, below } = require('taiko');
(async () => {
    try {
        console.log(`Current directory: ${process.cwd()}`);
        await openBrowser({args: [" --window-position=2000,3000"]});
        await goto("file:///" + process.cwd() + "/examples/Donutchart.html");
        assert.ok(await $(".apexcharts-donut-slice-2").exists());
    } catch (error) {
        console.error(error);
    } finally {
        await closeBrowser();
    }
})();


