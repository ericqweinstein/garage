#!/usr/bin/env ruby -w
# encoding: UTF-8

# Author:: Eric Weinstein
# Copyright:: (c) 2013 Eric Weinstein
# License:: MIT (see LICENSE)

module Monoalphabetic
  ##
  # Assorted tools for encrypting/decrypting monoalphabetic substitution ciphers
  # (https://en.wikipedia.org/wiki/Substitution_cipher)

  # An error raised when a non-alphabetic character is passed to an encryption/
  # decryption method.
  class CharacterError < Exception; end

  # Encrypts and decrypts text via ROT13 (https://en.wikipedia.org/wiki/ROT13).
  #
  # * Each letter is shifted by 13 places in the alphabet, _e.g._ A -> N.
  # * Because encryption/decryption are symmetric, the same method is used to
  #   both encrypt and decrypt text.
  # 
  # === Parameter(s)
  # +plaintext+ - +String+: the text to be encrypted or decrypted.
  #
  # === Return Value
  # +String+: the encrypted/decrypted text.
  #
  # === Example
  #
  # +rot_13('HELLO')+
  # +=> "URYYB"+
  def rot_13(plaintext)
    raise CharacterError.new('Plaintext must be a string') unless plaintext.respond_to? :upcase
    letters = plaintext.upcase.split('')

    ciphertext = []

    letters.each do |letter|
      raise CharacterError.new('Plaintext may include only letters') unless alphabet.include? letter

      index_to_check = alphabet.index(letter)
      index_to_check < 13 ? ciphertext << alphabet[index_to_check + 13] : ciphertext << alphabet[index_to_check -13]
    end

    ciphertext = ciphertext.join('')

    ciphertext
  end

  def alphabet
    ('A'..'Z').to_a
  end
end

