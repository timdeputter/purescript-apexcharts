const { openBrowser, goto, text, $, closeBrowser, below } = require('taiko');
(async () => {
    try {
        console.log(`Current directory: ${process.cwd()}`);
        await openBrowser({args: [" --window-position=2000,3000"]});
        await goto("file:///" + process.cwd() + "/examples/Timelinechart.html");
        await $(".apexcharts-rangebar-area").exists();
    } catch (error) {
        console.error(error);
    } finally {
        await closeBrowser();
    }
})();


