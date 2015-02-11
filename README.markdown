# mgodwin's dotfiles

## dotfiles

Your dotfiles are how you personalize your system. These are mine. 
They should work on 'nix and OSX.  Additional setup tasks will be present
for 'nix, but it will guide you through what to do.  These are specifically for **bash**.

## philosophy

Simplicity is the focus of these dotfiles.  They should do the minimum amount
possible to get you setup but also provide hooks for you to customize where
appropriate.  I don't believe in displaying 5000 things to you on your bash
prompt.  I've integrated pieces of the bashit project.

## prompt theme

My prompt is structured to only show you the minimum amount of information you need
at any given time to have a productive experience inside your terminal.  It will, based
on the context of where you are in your file system, show you:

```sh
# Your current path
~/Development

# Your current git branch
~/Development/Project(master)

# Your current ruby version (only if using rbenv, and if different than system ruby version)
~/Development/RubyProject(master)(2.1.2)

# Machine hostname, if dotfiles are installed on remote host
hiro:/etc/apache2
```

Colors are used to visually distinguish the prompt from other commands running
in your terminal.  This prompt is so simple, and so effective!

## install

You'll need ruby installed to set things up.  Make sure you fork the repo and change the gitconfig!

Run this:

```sh
git clone https://github.com/mgodwin/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
# Edit git/gitconfig.symlink
setup/bootstrap
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`, though.

## components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **bash/\*.sh**: Any files ending in `.sh` get loaded into your
  environment.
- **\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `rake install`.

## customizing

Use the ~/.localrc hook to store secret stuff you wouldn't want checked into your repo.

## keep it lean

Currently these dotfiles take approx 1s to load.  

    time source ~/.bashrc

    real  0m1.042s
    user  0m0.612s
    sys 0m0.402s

You open and close a lot of terminals over your life time.  It'd be better if startup time was reduced to half a second or less, however between autojump, bash completion, and prompt theming the time goes up to just over a second.  Would love to receive a PR that can reduce the startup time even further.

## Thanks

The original inspiration for these comes from holman's dotfiles, but have since diverged substantially.
