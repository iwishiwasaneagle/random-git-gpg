#!/bin/bash

gpg --batch --gen-key <<-END
  %no-protection
  Key-Type: 1
  Key-Length: 2048
  Subkey-Type: 1
  Subkey-Length: 2048
  Name-Real: $1
  Name-Email: $2
  Expire-Date: 0
END
git config --global user.signingkey $(gpg --list-secret-keys --keyid-format=long $2 | grep 'sec' | awk 'match($0, /[0-9A-Z]{16}/) {print substr($0, RSTART, RLENGTH)}')

