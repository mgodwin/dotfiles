# mgodwin's dotfiles

## dotfiles

Your dotfiles are how you personalize your system. These are mine. 
They should work on 'nix and OSX.  Additional setup tasks will be present
for 'nix, but it will guide you through what to do.

## Philosophy

Simplicity is the focus of these dotfiles.  They should do the minimum amount
possible to get you setup but also provide hooks for you to customize where
appropriate.  I don't believe in displaying 5000 things to you on your bash
prompt.  I've integrated pieces of the bashit project.

## Prompt Theme

My prompt is structured to only show you the minimum amount of information you need
at any given time to have a productive experience inside your terminal.  It will, based
on the context of where you are in your file system, show you:

    # Your current path
    ~/Development

    # Your current git branch
    ~/Development/Project(master)

    # Your current ruby version (only if using rbenv, and if different than system ruby version)
    ~/Development/RubyProject(master)(2.1.2)

    # Machine hostname, if dotfiles are installed on remote host
    hiro:/etc/apache2

Colors are used to visually distinguish the prompt from other commands running
in your terminal.  This prompt is so simple, and so effective!

Make it your own!  If you don't like what I've done or you need more, you can
very easily extend what I've done to make it yours.  The prompt is largely based on
the bashit project, so you can make updates using their same syntax.

## install

You'll need ruby installed to set things up.

Run this:

```sh
git clone https://github.com/mgodwin/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`, though.

## topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.sh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `rake install`.

## components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.sh**: Any files ending in `.sh` get loaded into your
  environment.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `rake install`.
- **topic/\*.completion.sh**: Any files ending in `completion.sh` get loaded
  last so that they get loaded after we set up bash autocomplete functions.

## Thanks

The original inspiration for these comes from holman's dotfiles, but have since
diverged substantially.
