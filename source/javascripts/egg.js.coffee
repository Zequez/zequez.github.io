konamiCode = (callback)->
  keys = []
  konamiSequence = [38, 38, 40, 40, 37, 39, 37, 39, 66, 65]
  window.addEventListener 'keyup', (ev)->
    keys.push ev.keyCode
    keys.shift() if keys.length > konamiSequence.length
    # Up Up Down Down Left Right Left Right B A
    correctKeys = 0
    for key, i in keys
      if key == konamiSequence[i]
        correctKeys++
      else
        break
    if correctKeys == konamiSequence.length
      callback()

class EggInverter
  onTransition: false

  constructor: ->
    @window = window
    @doc = document
    @body = @doc.body
    @docEl = @doc.documentElement

    if @isBrowserSupported()
      @activated = localStorage.egg == 'true'

      if @activated
        @togglePermanent(true)

      konamiCode =>
        @buildElements() unless @eggFilter
        @activated = localStorage.egg = !@activated
        if @activated
          @activate()
        else
          @deactivate()
    else
      konamiCode => alert("Sorry, only Chrome can digest this egg")

  isBrowserSupported: ->
    # The only browser that supports clip-path and filter: invert() in a non-buggy way
    !!@window.navigator.userAgent.match(/chrome/i)

  activate: ->
    @appendEggElement()
    @startScrollSync()
    @calculateCircleRadius()
    @setClipPath(@circleRadius)
    @onTransition = true
    @afterTransition =>
      @onTransition = false
      @togglePermanent(true)
      @removeEggElement()

  deactivate: ->
    @appendEggElement()
    @togglePermanent(false)
    @startScrollSync()
    @setClipPath(0)
    @onTransition = true
    @afterTransition =>
      @onTransition = false
      @removeEggElement()

  buildElements: ->
    @container = @doc.getElementsByClassName('container')[0].cloneNode(true)
    @eggFilter = @doc.createElement('div')
    @eggFilter.id = 'egg-filter'
    if @activated
      @calculateCircleRadius()
      @setClipPath(@circleRadius)
    @eggFilter.appendChild(@container)
    

  calculateCircleRadius: ->
    @circleRadius = Math.ceil(Math.sqrt(Math.pow(@docEl.clientWidth/2, 2) + Math.pow(@docEl.clientHeight, 2)))

  appendEggElement: ->
    @body.appendChild(@eggFilter)

  removeEggElement: ->
    @eggFilter.remove()

  startScrollSync: ->
    @stopScrollSync()
    @scrollEvEggWin = => @eggFilter.scrollTop = @body.scrollTop
    @scrollEvWinEgg = => @body.scrollTop = @eggFilter.scrollTop
    @scrollEvEggWin()

    @window.addEventListener 'scroll', @scrollEvEggWin
    @eggFilter.addEventListener 'scroll', @scrollEvWinEgg

  stopScrollSync: ->
    @window.removeEventListener 'scroll', @scrollEvEggWin
    @eggFilter.removeEventListener 'scroll', @scrollEvWinEgg

  setClipPath: (circleRadius)->
    clipPathStyle = "circle(" + circleRadius + "px at 50% 50px)"
    @eggFilter.style.webkitClipPath = clipPathStyle
    @eggFilter.style.clipPath = clipPathStyle

  togglePermanent: (value)->
    @docEl.classList.toggle('activated-egg-filter', value)

  afterTransition: (callback)->
    @eggFilter.removeEventListener 'transitionend', @transitionCallbackEv if @transitionCallbackEv
    @transitionCallbackEv = =>
      @eggFilter.removeEventListener 'transitionend', @transitionCallbackEv
      callback()
    @eggFilter.addEventListener 'transitionend', @transitionCallbackEv

eggInverter = new EggInverter