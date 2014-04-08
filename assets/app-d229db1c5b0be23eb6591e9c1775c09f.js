(function() {
  var $, categoriesHashEl, categoryEl, categoryName, categoryTextNode, depreMode, high, indexPostEl, lastDepre, _fn, _fn1, _i, _j, _k, _len, _len1, _len2, _ref, _ref1, _ref2;

  $ = function() {
    return document.querySelectorAll.apply(document, arguments);
  };

  Element.prototype.$ = function() {
    return this.querySelectorAll.apply(this, arguments);
  };

  Element.prototype.toggleClass = function(className, toggle) {
    var regex;
    regex = new RegExp("(^| )" + className + "($| )");
    if (toggle) {
      if (!regex.test(this.className)) {
        return this.className += ' ' + className;
      }
    } else {
      return this.className = this.className.replace(regex, '');
    }
  };

  categoriesHashEl = {};

  _ref = $('.categories-list li');
  for (_i = 0, _len = _ref.length; _i < _len; _i++) {
    categoryEl = _ref[_i];
    categoryTextNode = categoryEl.children[0].childNodes[0];
    categoryName = categoryTextNode.nodeValue.replace(/^\s+|\s+$/g, '');
    categoriesHashEl[categoryName] = categoryEl;
  }

  _ref1 = $('.index-post');
  _fn = function() {
    var indexPostTitleEl, postCategories;
    postCategories = JSON.parse(indexPostEl.getAttribute('data-categories'));
    indexPostTitleEl = indexPostEl.$('.index-post-title')[0];
    indexPostTitleEl.addEventListener('mouseover', function() {
      var isActiveCategory, _results;
      _results = [];
      for (categoryName in categoriesHashEl) {
        categoryEl = categoriesHashEl[categoryName];
        isActiveCategory = postCategories.indexOf(categoryName) !== -1;
        _results.push(categoryEl.toggleClass('active', isActiveCategory));
      }
      return _results;
    });
    return indexPostTitleEl.addEventListener('mouseout', function() {
      var _results;
      _results = [];
      for (categoryName in categoriesHashEl) {
        categoryEl = categoriesHashEl[categoryName];
        _results.push(categoryEl.toggleClass('active', false));
      }
      return _results;
    });
  };
  for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
    indexPostEl = _ref1[_j];
    _fn();
  }

  _ref2 = $('.highlight');
  _fn1 = function(high) {
    var pre, previous_width, width;
    pre = high.children[0];
    if (pre.offsetWidth !== pre.scrollWidth) {
      width = pre.scrollWidth + parseInt(window.getComputedStyle(high)['padding-left']) + parseInt(window.getComputedStyle(high)['padding-right']);
      previous_width = high.style.width;
      high.addEventListener('mouseover', function() {
        previous_width = high.style.width;
        return high.style.width = width + 'px';
      });
      return high.addEventListener('mouseout', function() {
        return high.style.width = previous_width;
      });
    }
  };
  for (_k = 0, _len2 = _ref2.length; _k < _len2; _k++) {
    high = _ref2[_k];
    _fn1(high);
  }

  depreMode = function(activated) {
    var b, previousScroll;
    if (activated == null) {
      activated = true;
    }
    b = document.body;
    b.toggleClass('dark-zequez-body-repaint-fix', activated);
    previousScroll = b.scrollTop;
    b.style.display = 'none';
    b.offsetHeight;
    b.style.display = '';
    b.scrollTop = previousScroll;
    return setTimeout(function() {
      return document.body.toggleClass('dark-zequez', activated);
    }, 10);
  };

  if (localStorage.depre) {
    lastDepre = parseInt(localStorage.depre);
    if (Date.now() - lastDepre < 1000 * 60 * 5) {
      depreMode();
    }
  }

  $('.egg')[0].addEventListener('click', function() {
    depreMode();
    return localStorage.depre = Date.now();
  });

  $('.anti-egg')[0].addEventListener('click', function() {
    depreMode(false);
    return delete localStorage.depre;
  });

}).call(this);
