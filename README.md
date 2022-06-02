# Inform Starter

So you want to be able to compile and run [Inform](http://inform7.com/) from the command line? 

I mean, obviously - this is for me, *I* am that person who wants to be like the cool kids and start using the [Open sourced Inform](https://github.com/ganelson/inform). 

This is what I've learned. Disclaimer: I have no idea what I'm doing. These instructions may be wrong. Don't use this in aviation industries.

I'm using Mac OS and [fish](https://fishshell.com/) (but using fish shell should not actually matter here). 

## Quick start

### Once: set up inform compilers 

Decide where you want to install inform. We call this `INFORM_HOME` (this is a name I made up, it has no special meaning to Inform itself, as far as I know). It can be in your documents, or wherever you like (but ideally not in Applications or some temporary folder). I use `~/Documents/private/inform10`.

```shell
cd ~Documents/private
mkdir inform10
cd inform10
git clone https://github.com/ganelson/inweb.git
bash inweb/scripts/first.sh macos
git clone https://github.com/ganelson/intest.git
bash intest/scripts/first.sh
git clone https://github.com/ganelson/inform.git
cd inform/
bash scripts/first.sh
```

Alright. You could add those to your path, I guess, but what I settled on is actually just dropping in a [`Makefile`](Makefile) in my project folder. 

So here's how. 

### Starting a new project 

Create a folder for your project, with another folder called `Source` in it, and your story.ni file in Source. And then copy in the Makefile from this project and put it next to the Source folder, so you have this: 

```
myproject/Makefile
myproject/Source/story.ni
```

The most minimal `story.ni` file you can try this with is this:

```inform
There is a room.
```

Then cd to your project folder, and once create a uuid: 

```shell
make uuid
```

And then whenever you want to compile, just go

```shell
make
```

If you want to play it straight in the terminal, you also need to `brew install glulxe` and then you just type `make play`. Another good way is to install [Spatterlight](http://ccxvii.net/spatterlight/) - `brew install spatterlight` - and open the output blorb file. Once you've installed that, you should be able to just use `open` from the command line to open the blorb file in Spatterlight, which is exactly what the `make open` command does. 

### Adding extensions

What I have done is to clone [i7/extensions](https://github.com/i7/extensions/) - also in the `INFORM_HOME` folder, by the way.

You can add a parameter `-external ${INFORM_HOME}` to the `inform7` line in the Makefile, but then it tries to compile all extensions.
What I do instead is to just copy the extensions I use, including the folder with the author's name, to my project folder, and then import it in the story.ni file just like always. 

### Keeping inform updated

I am really not sure if this is the "right" way to do it, but it seems that it works to cd into your three cloned git repos and pull from master:

```shell
cd inweb
git pull
cd ../intest
git pull
cd ../inform
git pull
cd ..
```

Then start over with the bash build scripts
```shell
bash inweb/scripts/first.sh macos
bash intest/scripts/first.sh
cd inform/
bash scripts/first.sh
```

