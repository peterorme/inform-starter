# Inform Starter

So you want to be able to compile and run Inform from the command line? 

I mean, obviously - this is for me, *I* am that person who wants to be like the cool kids and start using the [Open sourced Inform](https://github.com/ganelson/inform). 

This is what I've learned. 

I'm using Mac OS and [fish](https://fishshell.com/) (but using fish shell should not actually matter here). 

## Quick start

### Once: set up inform compilers 

Decide where you want to install inform. We call this `INFORM_HOME` (this is a name I made up, it has no special meaning to Inform itself, as far as I know). It can be in your documents, or wherever you like (but ideally not in Applications or some temporary folder). I use `~/Documents/private/inform10`.

```shell
cd ~Documents/private
mkdir inform10
cd inform10
git clone https://github.com/ganelson/inweb.git
bash inweb/scripts/first.sh linux
git clone https://github.com/ganelson/intest.git
bash intest/scripts/first.sh
git clone https://github.com/ganelson/inform.git
cd inform/
bash scripts/first.sh
```

Alright. You could add those to your path, I guess, but what I settled on is actually just dropping in a Makefile in my project folder. 

So here's how. 

### Starting a new project 

Create a folder for your project, with another folder called `Source` in i, and your story.ni file in Source. And then copy in the Makefile from this project and put it next to the Source folder, so you have this: 

myproject/Makefile
myproject/Source/story.ni

The most minimal story.ni file you can try this with is this:

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

If you want to play it straight in the terminal, you also need to `brew install glulxe` and then you just type `make play`. 

Enjoy! 
