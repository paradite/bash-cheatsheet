# bash cheatsheet

> Specific to OS X only

# TOC

- [nginx](#nginx)
- [Git](#git)

## kill gpg-agent

```bash
$ killall gpg-agent
# or
$ gpgconf --kill gpg-agent
```

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
# check current config and print config path
$ nginx -t

# update the config
$ open /usr/local/etc/nginx/

# run
$ nginx

# stop
$ nginx -s stop

# restart
$ nginx -s reload
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

# count tsx or ts files, excluding *.test.ts and .test.tsx, sort by LOC
$ wc -l `find ./src -type f '(' -name "*.tsx" -or -name "*.ts" ')' -not '(' -name "*.test.ts" -or -name ".test.tsx" ')'` | sort -n

# alias
alias wct=$'wc -l `find ./src -type f -name "*.tsx" | sort -n`'
```

[count example](./count-example)

## Git

### remove old merged git branches that are no longer in remote

```bash
# prune remote-tracking branches no longer on remote
$ git fetch --prune

# print local branches that are not found on remote
$ git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}'

# remove local branches that are not found on remote
$ git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d

#alias
alias gfp="git fetch --prune"
alias gcz="git cz"
alias grm=$'git branch -r | awk \'{print $1}\' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk \'{print $1}\' | xargs git branch -d'
```

### Revert to remote origin master

```bash
$ git checkout origin/master filename
```

### Sort files by git modified date

> https://serverfault.com/questions/401437/how-to-retrieve-the-last-modification-date-of-all-files-in-a-git-repository#comment1118135_401450

```bash
$ git ls-tree -r --name-only HEAD | while read filename; do   echo "$(git log -1 --format="%ai" -- $filename) $filename"; done | sort
```


## Android emulator

> https://stackoverflow.com/a/48729278/1472186

```bash
# list devices with identifiers
$ ~/Library/Android/sdk/emulator/emulator -list-avds

# run in background
$ ~/Library/Android/sdk/emulator/emulator -avd Pixel_2_API_28 &

$ alias android="~/Library/Android/sdk/emulator/emulator -avd Pixel_2_API_28 &"
```

## iOS Simulator

```bash
# list devices with identifiers
$ instruments -s devices

# start Simulator
$ open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app/

$ alias ios="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app/"
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

## Remove node_modules

```bash
# check
$ find . -name "node_modules" -type d -prune | xargs du -chs

# remove
$ find . -name "node_modules" -type d -prune -exec rm -rf '{}' +
```

## Remove .DS_Store

```bash
$ find . -name ".DS_Store" -delete
```

## Spotlight indexing

```bash
# turn off
$ sudo mdutil -a -i off

# turn on
$ sudo mdutil -a -i on
```

## virtualenv

```bash
$ virtualenv venv
$ source venv/bin/activate
$ deactivate
```

---

## Other cheatsheets
- [d3-cheatsheet](https://github.com/paradite/d3-cheatsheet)
- [pure-bash-bible](https://github.com/dylanaraps/pure-bash-bible)

## License

MIT
