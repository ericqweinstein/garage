#!/usr/bin/env ruby -w
# encoding: UTF-8

module Monoalphabetic
  # A pretty hacky ROT13 method.
  # (https://en.wikipedia.org/wiki/ROT13)
  def rot_13(plaintext) 
    letters    = plaintext.upcase.split('')
    ciphertext = []

    letters.each do |letter|
      index_to_check = alphabet.index(letter)
      if index_to_check < 13
        ciphertext << alphabet[index_to_check + 13]
      else
        ciphertext << alphabet[index_to_check - 13]
      end
    end

    ciphertext = ciphertext.join('')

    ciphertext
  end

  def alphabet
    ('A'..'Z').to_a
  end
end

