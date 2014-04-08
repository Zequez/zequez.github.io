---
layout: post
title: 'Deploying Jekyll with plugins to Github pages: the easy way'
date: '2014-04-08 20:06:00 -0300'
categories: Guías
---

So, you got really excited about migrating your blog to Jekyll. You thought about all those plugins! Images conversions and risizing! Assets pipelines! Minificatino! Internationalization! All working seemingless and wonderfully!

You designed your blog with the most cutting edge technologies, modified and created plugins to adapt to your desires... And then... You realized that Github will take none of that. Github will run none of your plugins.

But.. but...! There must be a way! You thought. And after googling you found guides [like these](http://davidensinger.com/2013/04/deploying-jekyll-to-github-pages/).

Well, these guides don't explain it very well, but what's actually happening there is that you are creating a new branch with all the source files that Jekyll won't run. And then you are creating a branch with only the contents of `_site`, and Github will think is a Jekyll app, and it will compile it with Jekyll, and since those are just static files, will compile in the same thing.

Anyway. If you are like me, you might have all your projects on Dropbox or any other cloud backup system. The problem with these methods is that when you switch between `master` and `source` and you start deleting and creating hundreds of files in seconds, Dropbox goes bananas.

So I decided to use a different approach. Instead of doing everything in the same place... why not use just 2 folders? One with the source and one with the `_site`?

So here is what I did:

My blog was on `MyJekyll/` so, instead, I moved all my files to `MyJekyll/source/`.

Then copy your `.git` folder from `MyJekyll/source` to `MyJekyll/_site`. Easy enough.

On `/source` change your branch to `source`. And on `_site` just delete everything and keep using `master`.

Now go to your `_config.yml` on `source/` folder. And add:

{% highlight yaml %}
  destination: ../_site
{% endhighlight %}

Now when you compile your site, the results are going to be on the `MyJekyll/_site` folder. After you finish your editing just `cd` to that folder and commit it as normal.

Done, no constant branch deleting and wizardly `filter-branch` stuff.