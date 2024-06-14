function fetchAndDisplayScript(containerId, scriptUrl) {
  var container = document.getElementById(containerId);

  if (container.style.display === "none" || container.style.display === "") {
    fetch(scriptUrl)
      .then(response => response.text())
      .then(data => {
        container.innerHTML = '<pre><code>' + data + '</code></pre>';
        container.style.display = "block";
      })
      .catch(error => {
        console.error('Error fetching the script:', error);
        container.innerHTML = '<pre><code>Error fetching the script.</code></pre>';
        container.style.display = "block";
      });
  } else {
    container.style.display = "none";
  }
}
