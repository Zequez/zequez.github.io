(function() {
  var EggInverter, eggInverter, konamiCode;

  konamiCode = function(callback) {
    var keys, konamiSequence;
    keys = [];
    konamiSequence = [38, 38, 40, 40, 37, 39, 37, 39, 66, 65];
    return window.addEventListener('keyup', function(ev) {
      var correctKeys, i, key, _i, _len;
      keys.push(ev.keyCode);
      if (keys.length > konamiSequence.length) {
        keys.shift();
      }
      correctKeys = 0;
      for (i = _i = 0, _len = keys.length; _i < _len; i = ++_i) {
        key = keys[i];
        if (key === konamiSequence[i]) {
          correctKeys++;
        } else {
          break;
        }
      }
      if (correctKeys === konamiSequence.length) {
        return callback();
      }
    });
  };

  EggInverter = (function() {
    EggInverter.prototype.onTransition = false;

    function EggInverter() {
      this.window = window;
      this.doc = document;
      this.body = this.doc.body;
      this.docEl = this.doc.documentElement;
      if (this.isBrowserSupported()) {
        this.activated = localStorage.egg === 'true';
        if (this.activated) {
          this.togglePermanent(true);
        }
        konamiCode((function(_this) {
          return function() {
            if (!_this.eggFilter) {
              _this.buildElements();
            }
            _this.activated = localStorage.egg = !_this.activated;
            if (_this.activated) {
              return _this.activate();
            } else {
              return _this.deactivate();
            }
          };
        })(this));
      } else {
        konamiCode((function(_this) {
          return function() {
            return alert("Sorry, only Chrome can digest this egg");
          };
        })(this));
      }
    }

    EggInverter.prototype.isBrowserSupported = function() {
      return !!this.window.navigator.userAgent.match(/chrome/i);
    };

    EggInverter.prototype.activate = function() {
      this.appendEggElement();
      this.startScrollSync();
      this.calculateCircleRadius();
      this.setClipPath(this.circleRadius);
      this.onTransition = true;
      return this.afterTransition((function(_this) {
        return function() {
          _this.onTransition = false;
          _this.togglePermanent(true);
          return _this.removeEggElement();
        };
      })(this));
    };

    EggInverter.prototype.deactivate = function() {
      this.appendEggElement();
      this.togglePermanent(false);
      this.startScrollSync();
      this.setClipPath(0);
      this.onTransition = true;
      return this.afterTransition((function(_this) {
        return function() {
          _this.onTransition = false;
          return _this.removeEggElement();
        };
      })(this));
    };

    EggInverter.prototype.buildElements = function() {
      this.container = this.doc.getElementsByClassName('container')[0].cloneNode(true);
      this.eggFilter = this.doc.createElement('div');
      this.eggFilter.id = 'egg-filter';
      if (this.activated) {
        this.calculateCircleRadius();
        this.setClipPath(this.circleRadius);
      }
      return this.eggFilter.appendChild(this.container);
    };

    EggInverter.prototype.calculateCircleRadius = function() {
      return this.circleRadius = Math.ceil(Math.sqrt(Math.pow(this.docEl.clientWidth / 2, 2) + Math.pow(this.docEl.clientHeight, 2)));
    };

    EggInverter.prototype.appendEggElement = function() {
      return this.body.appendChild(this.eggFilter);
    };

    EggInverter.prototype.removeEggElement = function() {
      return this.eggFilter.remove();
    };

    EggInverter.prototype.startScrollSync = function() {
      this.stopScrollSync();
      this.scrollEvEggWin = (function(_this) {
        return function() {
          return _this.eggFilter.scrollTop = _this.body.scrollTop;
        };
      })(this);
      this.scrollEvWinEgg = (function(_this) {
        return function() {
          return _this.body.scrollTop = _this.eggFilter.scrollTop;
        };
      })(this);
      this.scrollEvEggWin();
      this.window.addEventListener('scroll', this.scrollEvEggWin);
      return this.eggFilter.addEventListener('scroll', this.scrollEvWinEgg);
    };

    EggInverter.prototype.stopScrollSync = function() {
      this.window.removeEventListener('scroll', this.scrollEvEggWin);
      return this.eggFilter.removeEventListener('scroll', this.scrollEvWinEgg);
    };

    EggInverter.prototype.setClipPath = function(circleRadius) {
      var clipPathStyle;
      clipPathStyle = "circle(" + circleRadius + "px at 50% 50px)";
      this.eggFilter.style.webkitClipPath = clipPathStyle;
      return this.eggFilter.style.clipPath = clipPathStyle;
    };

    EggInverter.prototype.togglePermanent = function(value) {
      return this.docEl.classList.toggle('activated-egg-filter', value);
    };

    EggInverter.prototype.afterTransition = function(callback) {
      if (this.transitionCallbackEv) {
        this.eggFilter.removeEventListener('transitionend', this.transitionCallbackEv);
      }
      this.transitionCallbackEv = (function(_this) {
        return function() {
          _this.eggFilter.removeEventListener('transitionend', _this.transitionCallbackEv);
          return callback();
        };
      })(this);
      return this.eggFilter.addEventListener('transitionend', this.transitionCallbackEv);
    };

    return EggInverter;

  })();

  eggInverter = new EggInverter;

}).call(this);
(function() {
  var href, link, links, text, _i, _len;

  links = document.querySelectorAll('[hiddenlink]');

  for (_i = 0, _len = links.length; _i < _len; _i++) {
    link = links[_i];
    href = link.getAttribute('hiddenlink');
    text = link.innerText;
    console.log(href, btoa(href));
    link.href = atob(href.slice(0, -1));
    link.innerText = atob(text);
  }

}).call(this);

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
