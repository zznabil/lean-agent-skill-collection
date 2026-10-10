// Run inside OMP JavaScript Eval, where the real browser helper is available.
// Positive replay: await compositionBrowserUat(false)
// Broken-state control: await compositionBrowserUat(true) must reject.
async function compositionBrowserUat(broken = false, app = undefined) {
  const page = `<!doctype html><html lang="en"><meta charset="utf-8">
<title>Composition UAT fixture</title><h1>Working slice</h1>
<form><label for="task">Task</label><input id="task" required>
<button type="submit">Save task</button></form>
<p role="status" id="result">No task saved</p><button id="reset">Reset</button>
<script>
document.querySelector('form').onsubmit = e => {
  e.preventDefault();
  document.querySelector('#result').textContent = ${broken ? "'Wrong result'" : "'Saved: ' + document.querySelector('#task').value"};
};
document.querySelector('#reset').onclick = () => {
  document.querySelector('form').reset();
  document.querySelector('#result').textContent = 'No task saved';
};
</script></html>`;
  const tab = await browser.open({name: 'composition-uat', url: 'data:text/html,' + encodeURIComponent(page), headed: false, app});
  try {
    const start = await tab.observe();
    if (await tab.text('#result') !== 'No task saved' || await tab.value('#task') !== '') {
      throw new Error('UAT_START_FAILED');
    }
    await tab.fill('label/Task', 'Scoped delivery');
    await tab.click('role/button[name="Save task" exact]');
    const result = await tab.text('#result');
    const after = await tab.observe();
    const screenshot = await tab.screenshot({silent: true});
    if (result !== 'Saved: Scoped delivery') throw new Error('UAT_RESULT_FAILED: ' + result);
    await tab.click('role/button[name="Reset" exact]');
    if (await tab.text('#result') !== 'No task saved' || await tab.value('#task') !== '') {
      throw new Error('UAT_RESET_FAILED');
    }
    return {marker: 'COMPOSITION_UAT_PASS', startingState: start, savedState: after, screenshot, reset: true};
  } finally {
    await tab.close();
  }
}
