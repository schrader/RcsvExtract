RcsvExtract
==============

_Extracts a random subset from a CSV data file while preserving the header (unless you don't want that)._

## How To Use

**RcsvExtract** counts the lines in a given CSV data file, extracts a subset of a chosen size and optionally saves the generated subset to a new file. 

### Count Lines

Calling RcsvExtract with a path as the only parameter will tell you the line count and quit:

`./ExtractRandomSubSet.rb some/file.csv`

**Note:** You may have to call `ruby ExtractRandomSubSet.rb some/file.csv` instead if RcsvExtract is not executable (`chmod +x ExtractRandomSubSet.rb`) on your system.

### Extract Subset to Console

Adding a number as the second parameter will provide you with a random subset of the size you specified and flood your console with it:

`./ExtractRandomSubSet.rb some/file.csv 3000`

### Extract Subset to New File

If you rather want to save your subset to a new CSV file, just add a third parameter specifying its name like this:

`./ExtractRandomSubSet.rb some/file.csv 3000 my/subset.csv`

### No_Header

RcsvExtract expects to find a CSV header in the first line and per default preserves this line in your subset. If your data does not have a header, add the `no_header` flag to have RcsvExtract ignore the first line _in any case_.

## Roadmap

* `no_header` parameter set: `generate_indices` needs to include _line 0_ instead of ignoring it. Move `no_header` switch from `generate_subset` to `generate_indices` to make it happen.

## Copyright

Copyright (c) 2010 Julian Schrader, http://julianschrader.com

See LICENSE for details.