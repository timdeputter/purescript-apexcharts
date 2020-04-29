const { openBrowser, goto, text, $, closeBrowser, below } = require('taiko');
(async () => {
    try {
        console.log(`Current directory: ${process.cwd()}`);
        await openBrowser();
        await goto("file:///" + process.cwd() + "/examples/Donutchart.html");
        await $(".apexcharts-donut-slice-2").exists();
    } catch (error) {
        console.error(error);
    } finally {
        await closeBrowser();
    }
})();


