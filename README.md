<!--
SPDX-FileCopyrightText: 2025 The University of St Andrews
SPDX-License-Identifier: CC-BY-SA-4.0
-->

# Citescoop Protobuf Definitions

This repo provides the protobuf definitions library for citescoop
datafiles.

## File format

Citescoop `.pbf` files have the following format:

```
uint32 - Size of header
FileHeader - see src/file_header.proto
uint32 - Size of revisions map
RevisionMap - see src/revision_map.proto
```

Followed by a number (specified in the file header) of pages as follows:

```
uint32 - Size of page
Page - see src/page.proto
```

## Building and installing

See the [BUILDING](BUILDING.md) document.

## Contributing

See the [CONTRIBUTING](CONTRIBUTING.md) document.

## Licensing

This repo uses the [REUSE](https://reuse.software) standard in order to
communicate the correct license for the file. For those unfamiliar with
the standard the license for each file can be found in one of three
places. The license will either be in a comment block at the top of the
file, in a `.license` file with the same name as the file, or in the
dep5 file located in the `.reuse` directory. All files committed to this
repo must contain valid licensing information or the pull request can
not be accepted.
