# human(1)

`human` is a heuristics utility for [man(1)](https://linux.die.net/man/1/man).

Its primary intent is to improve manpage lookups by analyzing shell aliases and shell functions during the lookup process.

## Table of Contents

- [Installation](#installation)
- [Notes](#notes)
- [Examples](#examples)

## Installation

```
git clone https://github.com/nickolasburr/human.git
cd human
make
```

To install human(1) manpage:

```
make man
```

## Notes

Only shell aliases are supported as of this version.

## Examples

Get manpage for GNU [tail(1)](https://linux.die.net/man/1/tail) instead of BSD [tail(1)](https://man.openbsd.org/tail.1).

```
alias tail='gtail'
human tail
```
