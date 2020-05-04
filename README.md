# Codello Brewery

This repository contains custom formulae and casks for [Homebrew](https://brew.sh), most notably a formula to build [LilyPond](http://lilypond.org) natively on macOS.

## Installation

`brew install codello/brewery/<formula>`

Or `brew tap codello/brewery` and then `brew install <formula>`.

Or install via URL (which will not receive updates):

```
brew install https://raw.githubusercontent.com/Codello/homebrew-brewery/master/Formula/<formula>.rb
```

## Private Resources

Some of the casks in this repository are not publicly usable as the files they reference are not publicly available. One example of such a cask is `font-yorkten`. In order to install such a cask you need to provide appropriate authorization. In most cases this means setting the `HOMEBREW_B2_KEY_ID` and `HOMEBREW_B2_APPLICATION_KEY` environment variables. These will be used to authenticate against backblaze where the yorkten font files are located. As a shorthand you can use the `–b2` command. The command will prompt you for the key id and application key. To install Yorkten for example you might use

```shell
brew --b2 cask install font-yorkten
```



If you do not have a username/password to access the protected files you cannot use the cask.

## `brew` Documentation

Run `brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
