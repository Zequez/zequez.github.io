## What is this?

This is the source of Zequez.com, powered by [Github pages](https://pages.github.com/)
and [Middleman](https://middlemanapp.com/).

## Why isn't this on the `master` branch?

Github processes this repository `master` branch with
Jekyll and hosts it as a static website. This is the root of the project, the source, and `master`
is the `build` directory created by Middleman.

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

## Development and publishing scripts

To mount the project for development or previewing something you're writing,
use:

```bash
./server.sh
```

If you want to preview the static server of the build directory to see that everything
is alright (it should be):

```bash
./static_server.sh
```

And after you're done and want to commit your changes to Github:

```bash
./publish.sh
```

Edit: Thank you, me from the past for writing these instructions and scripts.
