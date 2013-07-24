#!/usr/bin/env ruby -w
# encoding: UTF-8

# Author:: Eric Weinstein
# Copyright:: (c) 2013 Eric Weinstein
# License:: MIT (see LICENSE)

module Transposition
  ##
  # Encryption/decryption using keyed columnar transposition
  # (http://en.wikipedia.org/wiki/Transposition_cipher)

  # Public: encrypts text via keyed columnar transposition.
  #
  # The encryption method converts the plaintext to an array,
  # each row within which comprises +width+ characters. The
  # array is then transposed and each row is reversed, after
  # which the array is converted back to a string.
  #
  # === Parameter(s)
  # +plaintext+ - +String+: the text to be encrypted.
  # +width+ - +Integer+: the width of each row in the intermediary
  # table required for transposition.
  #
  # === Return Value
  # +String+: the encrypted text.
  #
  # === Example
  # Assuming +pt+ is the plaintext version of K3:
  # +encrypt(encrypt(pt, 7), 84)+
  # +=> # Results in K3+
  def encrypt(plaintext, width)
    matrix = plaintext.chars.each_slice(width).map(&:join)
    matrix.each_with_index do |row, index|
      matrix[index] = matrix[index].split('')
    end

    matrix.transpose.map(&:reverse).join('')
  end
  
  # Public: decrypts text via keyed columnar transposition.
  #
  # The decryption method converts the ciphertext to an array,
  # each row within which comprises +width+ characters. Each
  # row in the array is reversed and the entire array is
  # transposed, after which the array is converted back to a
  # string.
  #
  # === Parameter(s)
  # +ciphertext+ - +String+: the text to be decrypted.
  # +width+ - +Integer+: the width of each row in the intermediary
  # table required for transposition.
  #
  # === Return Value
  # +String+: the decrypted text.
  #
  # === Example
  # Assuming +K3+ is part 3 of the Kryptos sculpture:
  # +decrypt(decrypt(K3, 4), 48)+
  # +=> # Results in the plaintext+
  def decrypt(ciphertext, width)
    matrix = ciphertext.chars.each_slice(width).map(&:join)
    matrix.each_with_index do |row, index|
      matrix[index] = matrix[index].split('')
    end

    matrix.map(&:reverse).transpose.join('')
  end
end

