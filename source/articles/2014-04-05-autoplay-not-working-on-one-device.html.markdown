---
title: Autoplay not working on one device on Windows
date: 2014-04-05
tags: how-to
lang: en
---

So, for some reason somewhere around this week, Dropbox stopped importing pictures from my Moto G. Looking at the autoplay settings everything was setup correctly. I tried reseting everything with no avail, and I tried restarting the __Shell Hardware Detection__ service without results.

So then I went to the __Device Manager__, I went to __Portable Devices__, and uninstalled my cellphone, listed as `XT1032`, for some reason.

Then I unplugged the phone, connected it again, let Windows detect it, and voilá! Autoplay is working again, and I got Dropbox to import my stuff! Yay!

So, the moral of the story is: if everything fails, reinstall.