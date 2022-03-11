# DEPRECATED
With the arrival of [Corepack](https://nodejs.org/dist/latest/docs/api/corepack.html) I'm no longer installing yarn from Homebrew, and have no more need of this project. I think the stdenv concept is still useful & so this project is archived for you to fork &amp; modify to your needs.

# homebrew-stdenv
Tap of [Homebrew](https://github.com/Homebrew) formulae modified to use the standard environment &amp; look for non-Homebrew dependency fulfillment.

## Usage
```sh
brew install gfguthrie/stdenv/<formula>
```

## Supported Dependencies
- [go](https://github.com/gfguthrie/homebrew-stdenv/blob/master/std_requirements/std_go_requirement.rb)
- [node](https://github.com/gfguthrie/homebrew-stdenv/blob/master/std_requirements/std_node_requirement.rb)

## Formulae
- [opa](https://github.com/gfguthrie/homebrew-stdenv/blob/master/Formula/opa.rb)
- [svgo](https://github.com/gfguthrie/homebrew-stdenv/blob/master/Formula/svgo.rb)
- [yarn](https://github.com/gfguthrie/homebrew-stdenv/blob/master/Formula/yarn.rb)

## Contributions
Want to see something added here? Create an [issue](https://github.com/gfguthrie/homebrew-stdenv/issues/new)!

Or create a pull request if you have code you'd like to contribute.
