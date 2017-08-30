# mgodwin's dotfiles

## dotfiles

Your dotfiles are how you personalize your system. These are mine.
They only work on OSX currently, but I'd be happy to accept a PR for 'nix.  
These are specifically for **bash**.

## philosophy

Simplicity is the focus of these dotfiles.  They should do the minimum amount
possible to get you setup but also provide hooks for you to customize where
appropriate.  I don't believe in displaying 5000 things to you on your bash
prompt.  They should be *fast*.

## prompt theme

My prompt is structured to only show you the minimum amount of information you need
at any given time to have a productive experience inside your terminal.  It will, based
on the context of where you are in your file system, show you:

```sh
# Your current path
~/Development

# Your current git branch, if in a dir that has a git repo (sorry hg and svn users)
~/Development/Project(master)

# Your current ruby version (only if using rbenv, and if different than system ruby version)
~/Development/RubyProject(master)(2.1.2)
```

Colors are used to visually distinguish the prompt from other commands running
in your terminal.  This prompt is so simple, and so effective!

## install

Fork the repo and customize based on your preferences. The install script
will make sure you have everything needed to get going.

```sh
git clone https://github.com/mgodwin/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
# Optionally you can install apps as well (via homebrew-cask)
./install-apps.sh
```

## ansible-based

If you peek through the repo, I'm using ansible to manage all configuration.
If you've never used ansible, the file `setup.yml` is a good place to start,
then visit the `roles` directory.

My Roles
* **applications** - various software apps I like to use, installed via homebrew cask.
* **bash** - where prompt theming magic happens and where you can customize your PATH, aliases etc.
* **git** - Just copies over the gitconfig here, you should probably customize your name at the very least!
* **ruby** - installs rbenv and ruby-build, so you can install your favorite ruby version.

Add whatever roles make sense for you - maybe you use node or python as well?
Just don't forget to add them to `setup.yml` or `install-apps.yml`.

After you make any changes, you can re-run `./install.sh` as many times as you'd like,
ansible will figure out what to change to make everything end up in the right state.

## keep it private

Use the `~/.localrc` hook to store secret stuff you wouldn't want checked
into your repo (see `roles/bash/templates/bashrc.j2`).

## keep it lean

Currently these dotfiles take < 1s to load.  

    time source ~/.bashrc

    real	0m0.559s
    user	0m0.329s
    sys	0m0.180s

You open and close a lot of terminals over your life time.  Keep things quick

## Thanks

The original inspiration for these comes from holman's dotfiles,
but have since diverged substantially.
