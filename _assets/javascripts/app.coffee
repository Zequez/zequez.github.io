$ = -> document.querySelectorAll.apply(document, arguments)
Element.prototype.$ = -> this.querySelectorAll.apply(this, arguments)
Element.prototype.toggleClass = (className, toggle)->
  regex = new RegExp("(^| )#{className}($| )")
  if (toggle)
    if not regex.test this.className
      this.className += ' ' + className
  else
    this.className = this.className.replace(regex, '')


#####################################################
# Highlighting of the categories when hovering index
#####################################################

categoriesHashEl = {}

for categoryEl in $('.categories-list li')
  # Text node element, without the category count number
  categoryTextNode = categoryEl.children[0].childNodes[0]
  categoryName = categoryTextNode.nodeValue.replace(/^\s+|\s+$/g, '')
  categoriesHashEl[categoryName] = categoryEl

for indexPostEl in $('.index-post')
  do ->
    postCategories = JSON.parse indexPostEl.getAttribute('data-categories')
    indexPostTitleEl = indexPostEl.$('.index-post-title')[0]

    # TODO: Optimize into just one event hook when I have thousands of posts

    indexPostTitleEl.addEventListener 'mouseover', ->
      for categoryName, categoryEl of categoriesHashEl
        isActiveCategory = postCategories.indexOf(categoryName) != -1
        categoryEl.toggleClass 'active', isActiveCategory

    indexPostTitleEl.addEventListener 'mouseout', ->
      for categoryName, categoryEl of categoriesHashEl
        categoryEl.toggleClass 'active', false

#############################
# Code highlight enwidthener
#############################

for high in $('.highlight')
  do (high)->
    pre = high.children[0]
    if pre.offsetWidth != pre.scrollWidth
      width = pre.scrollWidth +
              parseInt(window.getComputedStyle(high)['padding-left']) +
              parseInt(window.getComputedStyle(high)['padding-right'])
      
      previous_width = high.style.width
      high.addEventListener 'mouseover', ->
        previous_width = high.style.width
        high.style.width = width + 'px'
      high.addEventListener 'mouseout', ->
        high.style.width = previous_width


######
# Egg
######

depreMode = (activated = true)->
  b = document.body
  # When we change the body background, it won't repaint unscrolled areas on Webkit
  # so we need to force repainting, but if we do, the transitions will run instantly
  # So well, we have to use an extra class
  b.toggleClass('dark-zequez-body-repaint-fix', activated)
  previousScroll = b.scrollTop
  b.style.display = 'none'
  b.offsetHeight
  b.style.display = ''
  b.scrollTop = previousScroll

  setTimeout ->
    document.body.toggleClass('dark-zequez', activated)
  , 10
  

if localStorage.depre
  lastDepre = parseInt localStorage.depre
  if Date.now() - lastDepre < 1000*60*5 # 5 minutes
    depreMode()

$('.egg')[0].addEventListener 'click', ->
  depreMode()
  localStorage.depre = Date.now()

$('.anti-egg')[0].addEventListener 'click', ->
  depreMode false
  delete localStorage.depre