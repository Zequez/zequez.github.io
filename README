## What is this?

This is the source of Zequez.com, powered by [Github pages](https://pages.github.com/)
and [Middleman](https://middlemanapp.com/).

## This doesn't look like a Middleman project? Where is the source?

That's correct, this is the `master` branch, Github processes this repository with
Jekyll and hosts it as a static website. This is the build directory created by Middleman, you
can see the source on the `source` branch.

## How is the build workflow?

I copied the `.git` folder into the `build` folder, then I switched the root
of the project to the `source` branch, and the `build` folder to the `master` branch.
Then when I want to commit a change in the source I commit from the root of the project
and when I want to commit a change in the build, I commit from the build folder.

So basically do the following:

```bash
git clone https://github.com/Zequez/zequez.github.io
cd zequez.github.io
mkdir build
cp -R .git build
checkout source
cd build
checkout master
```