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

Some of the casks in this repository are not publicly usable as the files they reference are not publicly available. One example of such a cask is `font-yorkten`. In order to install such a cask you need to provide appropriate authorization. In most cases this means setting the `HOMEBREW_B2_KEY_ID` and `HOMEBREW_B2_APPLICATION_KEY` environment variables. These will be used to authenticate against backblaze where the yorkten font files are located.


If you do not have a username/password to access the protected files you cannot use the cask.

## Licensing

The contents of this repository are licensed under the MIT license. Note however that the software that is referenced in this repo may be licensed under different terms.

## `brew` Documentation

Run `brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
