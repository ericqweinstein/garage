#!/usr/bin/env ruby -w
# encoding: UTF-8

# Author:: Eric Weinstein
# Copyright:: (c) 2013 Eric Weinstein
# License:: MIT (see LICENSE)

module Transposition
  ##
  # Encryption/decryption using keyed columnar substitution
  # (http://en.wikipedia.org/wiki/Transposition_cipher)

  # Public: encrypts text via keyed columnar transposition.
  def encrypt(plaintext)
    letters = plaintext.split('')
    matrix  = [[], [], [], []]

    matrix[0] = plaintext[0..85]
    matrix[1] = plaintext[86..171]
    matrix[2] = plaintext[172..257]
    matrix[3] = plaintext[258..336]

    matrix
  end
  
  # Public: decrypts text via keyed columnar transposition
  def decrypt(ciphertext)
  end
end

