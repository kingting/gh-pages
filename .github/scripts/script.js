<script>
function fetchAndDisplayScript(containerId, scriptUrl, button) {
  var container = document.getElementById(containerId);

  if (container.style.display === "none" || container.style.display === "") {
    fetch(scriptUrl)
      .then(response => response.text())
      .then(data => {
        container.innerHTML = '<pre><code>' + data + '</code></pre>';
        container.style.display = "block";
        button.textContent = "Hide " + button.getAttribute('data-script-name');
      })
      .catch(error => {
        console.error('Error fetching the script:', error);
        container.innerHTML = '<pre><code>Error fetching the script.</code></pre>';
        container.style.display = "block";
        button.textContent = "Hide " + button.getAttribute('data-script-name');
      });
  } else {
    container.style.display = "none";
    button.textContent = "Show " + button.getAttribute('data-script-name');
  }
}
</script>


