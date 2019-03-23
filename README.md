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

## Android emulator

> https://stackoverflow.com/a/48729278/1472186

```bash
# list devices
$ ~/Library/Android/sdk/tools/emulator -list-avds

# run in background
$ ~/Library/Android/sdk/tools/emulator -avd Pixel_2_API_27 &
```

## List open ports

```bash
$ sudo lsof -iTCP -sTCP:LISTEN -n -P
```

---

## Other cheatsheets
- [d3-cheatsheet](https://github.com/paradite/d3-cheatsheet)

## License

MIT
