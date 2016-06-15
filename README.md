# dotfiles
My dotfiles repo setup is inspired by [Xero's](https://github.com/xero/dotfiles).
dotfiles are managed with `stow`.

## Example
```
$ git clone -q https://github.com/mauved/dotfiles.git
$ cd dotfiles
$ stow -t $HOME -vv amethyst
stow dir is /home/sofia/dotfiles
stow dir path relative to target /home/sofia is dotfiles
Planning stow of package amethyst...
LINK: .amethyst => dotfiles/amethyst/.amethyst
Planning stow of package amethyst... done
Processing tasks...
Processing tasks... done
```

