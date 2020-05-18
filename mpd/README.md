# mpd

You'll want to make sure that a config directory for mpd is present before starting up.
```bash
mkdir $HOME/.mpd
stow -t $HOME mpd
```
You should then be able to start up a user service for mpd using the system unit file.
```bash
systecmtl --user start mpd
```
