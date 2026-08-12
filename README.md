<!--
SPDX-FileCopyrightText: 2025 The University of St Andrews
SPDX-License-Identifier: CC-BY-SA-4.0
-->

# Citescoop Protobuf Definitions

This repo provides the protobuf definitions library for citescoop
datafiles.

## Files

Citescoop generates a number of different file types during it's
operation depending upon what it is doing.

## File format

All files store a series of protobuf messages in the same format. Each
file will contain a file header indicating the number of messages
followed by zero or more of the following:

```
uint32 - Size of next message
Message - The protobuf message
```

### Extracted Citations

Files generated from the extraction procedure for citescoop contain
messages in the following order.

Citation extraction will generate two output files:

- `pages.pbf` - Contains zero or more `Page` messages (see [/src/citescoop/proto/page.proto](/src/citescoop/proto/page.proto))
- `revisions.pbf` - Contains zero or more `Revision` messages (see [/src/citescoop/proto/revision.proto](/src/citescoop/proto/revision.proto))

### OpenAlex datasets

When processing the OpenAlex datasets for use with citescoop, the
following files are generated:

- `authors.pbf` - Contains zero or more `Author` messages (see
  [/src/citescoop/proto/openalex/author.proto](/src/citescoop/proto/openalex/author.proto))
- `institutions.pbf` - Contains zero or more `Institution` messages (see [/src/citescoop/proto/openalex/institution.proto](/src/citescoop/proto/openalex/institution.proto)
  )
- `works.pbf` - Contains zero or more `Work` messages (see [/src/citescoop/proto/openalex/work.proto](/src/citescoop/proto/openalex/work.proto))

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
