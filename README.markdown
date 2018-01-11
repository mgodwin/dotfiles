# mgodwin's dotfiles

## dotfiles

Your dotfiles are how you personalize your system. These are mine.
They almost work on ubuntu, but primarily only work on OSX.
These are specifically for **bash**.

## install

Fork the repo and customize based on your preferences. The install script
will make sure you have everything needed to get going.

```sh
git clone https://github.com/mgodwin/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

## ansible-based

If you peek through the repo, I'm using ansible to manage all configuration.
If you've never used ansible, the file `setup.yml` is a good place to start,
then visit the `roles` directory.

My roles:
* **bash** - where prompt theming magic happens and where you can customize your PATH, aliases etc.
* **git** - Just copies over the gitconfig here, you should probably customize your name at the very least!
* **ruby** - installs rbenv and ruby-build, so you can install your favorite ruby version.
* **vim** - installs rbenv and ruby-build, so you can install your favorite ruby version.

Add whatever roles make sense for you - maybe you use node or python as well?
Just don't forget to add them to `setup.yml`.

After you make any changes, you can re-run `./install.sh` as many times as you'd like,
ansible will figure out what to change to make everything end up in the right state.

### Remote install
If you don't have ansible installed on a remote host that you're sshing into or the machine
might install an older version of ansible, you can locally deploy the dotfiles onto the remote
machine, since it's just ansible :the_horns:.

```
cd ~/.dotfiles
ansible-playbook -iremotehostname, --tags=vim setup.yml
```
Note the trailing `,` after the hostname.  You _have_ to have that or ansible will look for a file
named `remotehostname` on the filesystem and emit a bunch of warnings.

## prompt theme

My prompt is structured to only show you the minimum amount of information you need
at any given time to have a productive experience inside your terminal:

```sh
# Your current path
~/Development

# Your current git branch, if in a dir that has a git repo (sorry hg and svn users)
~/Development/Project(master)

# Your current ruby version (only if using rbenv, and if different than system ruby version)
~/Development/RubyProject(master)(2.1.2)
```

## keep it private

Create a file called `~/.localrc` to store secret stuff you wouldn't want checked
into your repo - it's sourced in the `.bashrc` file.

## keep it lean

Currently these dotfiles take < 1s to load.  

    time source ~/.bashrc

    real	0m0.559s
    user	0m0.329s
    sys	0m0.180s

You open and close a lot of terminals over your life time.  Keep things quick.

## Thanks

The original inspiration for these comes from holman's dotfiles,
but have since diverged substantially.
