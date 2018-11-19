# human(1)

`human` is a heuristics utility for [man(1)](https://linux.die.net/man/1/man).

Its primary intent is to improve manpage lookups by analyzing shell aliases and shell functions during the lookup process.

## Table of Contents

- [Installation](#installation)
- [Configuration](#configuration)
- [Notes](#notes)
- [Examples](#examples)

## Installation

```
git clone https://github.com/nickolasburr/human.git
cd human
make install
```

The default prefix is `/usr/local/opt`. To install to an alternate location, pass `PREFIX` to `make install`.

```
make install PREFIX=/opt
```

To install human(1) manpage:

```
make manpage
```

## Configuration

Since `human` requires access to the shell environment, it is implemented as a shell function. Likewise, it
will need to be sourced from a shell configuration file (e.g. `.bashrc`).

```
[[ -f /usr/local/opt/human/src/human.sh ]] && . /usr/local/opt/human/src/human.sh
```

## Notes

Only shell aliases are supported as of this version.

## Examples

Get manpage for GNU [tail(1)](https://linux.die.net/man/1/tail) instead of BSD [tail(1)](https://man.openbsd.org/tail.1).

```
alias tail='gtail'
human tail
```
