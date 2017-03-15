Problem #1
============

## Description

### Convert hex to base64

The string:

`49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d`

Should produce:

`SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t`

So go ahead and make that happen. You'll need to use this code for the rest of the exercises.


## Solution

For this I decided to take a more general approach, the program can convert arbitray hex -> base64.

### Setup

To compile the program follow these steps:

```
opam install base64
make
```

### Usage

```
./hex2b64.native <hex>
```