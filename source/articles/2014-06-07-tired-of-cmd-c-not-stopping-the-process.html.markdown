---
title: 'Tired of Cmd+C not stopping the process?'
date: 2014-06-07
tags: scripts
lang: en
---

So, you are happily using a terminal program, and then you try to stop it with Cmd+C. And it ignores your command.

Program... I COMMAND YOU. TO STOP! RIGHT. NOW.

```bash
>$ assprogram
Super program loaded!
^CTerminating program...

# *...*

^C^C^C

# "Sup man, still terminating..."

# *...*

^C^C^C^C^C^C^C^C

# "Calm down man, I'm terminating, just wait..."

# *I DON'T HAVE TIME FOR THIS!!!*
# *AGGGGGGGGHHHHHHHHHHHHHHHHHHHHHHHHHHHH*

^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C^C

# "Haha just kidding you can't stop me now!"

# *Oh yeah?*

# "Wait... what are you doing!?"

^Z
Use "fg" to return to assprogram.

[1]+  Stopped                 assprogram

>$ px aux | grep assprogram
user   4179  0.0  0.4   5420  1772 pts/0    T    01:36   0:00 assprogram
user   4184  0.0  0.2   4364   836 pts/0    S+   01:38   0:00 grep --color=auto assprogram
>$ kill 4179

# *DIEEEEEEEEEEEEEEEEEE*
```

Touching story.

Anyway, what if it were EASIER THAN THAT?

```bash
^Z
Use "fg" to return to assprogram.

[1]+  Stopped                 assprogram
$> jobs -l
[1]+  4176 Stopped (signal)        assprogram
$>kill 4176
```

"Wow that's really cool! I didn't know that you could do that!"

But wait! There is more! It can be EASIER!

Open up your `~/.bashrc` and add the following on the end:

```bash
alias zpid="echo \`jobs -l | grep -oh -w '[0-9]\\{2,\\}'\`"
alias killz="kill \`zpid\` && fg"
```

There, now if a nasty program doesn't want to stop you can Cmd+Z, and then type `killz` and you murder it for good.

Note: I tried to check that the number was surounded by spaces on the grep regular expression, but grep regular expresions are fucked up and don't like spaces. So the shitty alternative I though was to just check if the number has 2 or more digits. So if you have a process with a number of 2 or more digits this will break.