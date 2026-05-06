# homebrew-glnc

The official [Homebrew](https://brew.sh) tap for [`glnc`](https://github.com/aryarahimi1/glnc),
a blockchain inspection CLI for EVM, Bitcoin, and Solana.

## Install

> **First-release note:** `brew install` only works after the main repo has
> cut at least one tagged release. Until then `Formula/glnc.rb` carries
> placeholder SHA256 values and `brew install` will fail the checksum step.

```sh
brew install aryarahimi1/glnc/glnc
```

The shorter two-step form works too:

```sh
brew tap aryarahimi1/glnc
brew install glnc
```

This installs a prebuilt binary for your platform (darwin-arm64, darwin-x64,
linux-arm64, or linux-x64). No source compilation is performed.

## Upgrading

```sh
brew update
brew upgrade glnc
```

## Uninstall

```sh
brew uninstall glnc
brew untap aryarahimi1/glnc
```

## Contributing

This tap is **automated**. `Formula/glnc.rb` is rewritten by the
[`bump.yml`](.github/workflows/bump.yml) workflow on every release of the main
repo, so manual edits to `version`, `url`, or `sha256` will be overwritten.

Please file issues and feature requests in the main repo:
<https://github.com/aryarahimi1/glnc>

If you find a bug in the formula itself (style, install logic, etc.), a PR
against `Formula/glnc.rb` is welcome — just avoid touching the auto-managed
fields listed above.

## License

The formula in this repo is published under the same license as `glnc`. See
the main repository for details.
