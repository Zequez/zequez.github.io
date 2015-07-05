//= require_tree .

(function() {
  var sidebar = document.getElementById('sidebar');
  var sidebarBtn = document.getElementById('sidebar-button');
  var sidebarOverlay = document.getElementById('sidebar-overlay');

  var toggleActive = function() {
    sidebar.classList.toggle('active');
    // this.className = this.className.replace(/\wactive\w/, '');
  }

  // Should really be using touch detection rather than click though
  sidebarBtn.addEventListener('click', toggleActive);
  sidebarOverlay.addEventListener('click', toggleActive);
})();