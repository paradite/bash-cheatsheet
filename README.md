# bash cheatsheet

> Specific to OS X only

## make shell scripts executable

```bash
$ chmod +x script.sh
```

## static http server

```bash
# python2
$ python -m SimpleHTTPServer 8000

# python3
$ python3 -m http.server

# alias
alias http="python -m SimpleHTTPServer 8000"
```

## nginx

```bash
# update the config
$ open /usr/local/etc/nginx/
# run
$ nginx
# stop
$ nginx -s stop
```

## modify files using sed

```bash
# substitute and print to stdout
$ sed -e 's/one/first/g' test-file.txt

# substitute in place with backup
$ sed -i '.backup' -e 's/one/first/g' test-file.txt

# substitute in place without backup
$ sed -i '' -e 's/another/next/g' test-file.txt
```

[sed example](./sed-example)

## count lines of code for each individual file

```bash
# count lines of code for jsx files in current folder
$ wc -l `find . -type f -name "*.jsx" | sort -n`

# count lines of code for jsx and css files in current folder
$ wc -l `find . -type f -name "*.jsx" -or -name "*.css" | sort -n`

# count lines of code for tsx files in src folder
$ wc -l `find ./src -type f -name "*.tsx" | sort -n`

# alias
alias wct=$'wc -l `find ./src -type f -name "*.tsx" | sort -n`'
```

[count example](./count-example)

## remove old merged git branches that are no longer in remote

```bash
# prune remote-tracking branches no longer on remote
git fetch --prune

# print local branches that are not found on remote
git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}'

# remove local branches that are not found on remote
git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d

#alias
alias gp="git fetch --prune"
alias grm=$'git branch -r | awk \'{print $1}\' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk \'{print $1}\' | xargs git branch -d'
```

## git revert to remote origin master

```bash
git checkout origin/master filename
```

## Android emulator

> https://stackoverflow.com/a/48729278/1472186

```bash
# list devices with identifiers
$ ~/Library/Android/sdk/emulator/emulator -list-avds

# run in background
$ ~/Library/Android/sdk/emulator/emulator -avd Pixel_2_API_28 &
```

## iOS Simulator

```bash
# list devices with identifiers
$ instruments -s devices

# start Simulator
$ open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app/
```

## List open ports

```bash
$ sudo lsof -iTCP -sTCP:LISTEN -n -P
$ sudo lsof -i -P -n | grep LISTEN
```

## List tar/zip file contents

```bash
$ tar -tvf archive.tar
```

---

## Other cheatsheets
- [d3-cheatsheet](https://github.com/paradite/d3-cheatsheet)
- [pure-bash-bible](https://github.com/dylanaraps/pure-bash-bible)

## License

MIT
