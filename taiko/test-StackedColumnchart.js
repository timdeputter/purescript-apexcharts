const assert = require("assert");
const { openBrowser, goto, text, $, closeBrowser, below } = require('taiko');
(async () => {
    try {
        console.log(`Current directory: ${process.cwd()}`);
        await openBrowser({args: [" --window-position=2000,3000"]});
        await goto("file:///" + process.cwd() + "/examples/StackedColumnchart.html");
        assert.ok(await $(".apexcharts-bar-area").exists());
        assert.ok(await $("g[seriesName=\"PRODUCTxA\"]").exists());
        assert.ok(await $("g[seriesName=\"PRODUCTxB\"]").exists());
        assert.ok(await $("g[seriesName=\"PRODUCTxC\"]").exists());
    } finally {
        await closeBrowser();
    }
})();


