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
  #
  # Notes TK
  #
  # === Parameter(s)
  # +plaintext+ - +String+: the text to be encrypted.
  # +width+ - +Integer+: the width of each row in the intermediary
  # table required for transposition. (If the number of characters
  # in the plaintext is not a multiple of the width, the last row
  # will be shorter than the rest of the rows.)
  #
  # === Return Value
  # +String+: the encrypted text.
  #
  # === Example
  # TK
  def encrypt(plaintext, width)
  end
  
  # Public: decrypts text via keyed columnar transposition.
  #
  # Notes TK
  #
  # === Parameter(s)
  # +ciphertext+ - +String+: the text to be decrypted.
  # +width+ - +Integer+: the width of each row in the intermediary
  # table required for transposition. (If the number of characters
  # in the ciphertext is not a multiple of the width, the last row
  # will be shorter than the rest of the rows.)
  #
  # === Return Value
  # +String+: the decrypted text.
  #
  # === Example
  # TK
  def decrypt(ciphertext, width)
    matrix = ciphertext.chars.each_slice(width).map(&:join)
    matrix.each_with_index do |row, index|
      matrix[index] = matrix[index].split('')
    end

    matrix.map(&:reverse).transpose.join('')
  end
end

