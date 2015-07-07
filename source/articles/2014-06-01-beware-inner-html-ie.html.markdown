---
title: 'Beware of using innerHTML to remove all elements from a parent if you intend to reuse the elements later'
date: 2014-06-01
tags: javascript, playtime-for-the-buck
lang: en
---

So, while working on PlaytimeForTheBuck, I finally decided I was going to test the site on IE. And I found a bizarre bug. When I searched the games, after a searching a couple of letters the table wouldn't render anything! The filters were working and the call to the rendering methods were being made, with the correct games. After a while I looked at the DOM and to my surprice, the row elements were there... but were empty?

After debugging a little more I found that the innerHTML of the rows being added to the DOM were empty! So then I changed my call to `innerHTML = ''` to erase the table, to a `@e.removeChild @e.firstChild while @e.firstChild`, and the problem was gone.

## What happened?

On IE innerHTML empties your children elements too! This means, that if you have a reference to a children element with it's own children, and then you apply `parent.innerHTML = ''`, the grandchildren are going to be removed from the children, and then if you add the children again to the DOM, they are going to be empty!

A JSFiddle is worth more than a thousand words. Just test the following on Chrome/Firefox and IE.

<iframe width="100%" height="300" src="http://jsfiddle.net/zequez/fBEnL/1/embedded/" allowfullscreen="allowfullscreen" frameborder="0"></iframe>