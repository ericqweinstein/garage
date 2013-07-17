#!/usr/bin/env ruby -w
# encoding: UTF-8

# Author:: Eric Weinstein
# Copyright:: (c) 2013 Eric Weinstein
# License:: MIT (see LICENSE)

module Vigenere
  ##
  # Encryption/decryption using Vigenère ciphers
  # (http://en.wikipedia.org/wiki/Vigen%C3%A8re_cipher)

  def build_table(key1=alphabet, key2)
    # key1 is the key found in each row (optional; the
    # default is a normal alphabet). key2 is the key
    # that forms an acrostic down the left-hand side.
    #
    # (See kryptos.rb for an example.)
    table = []

    key1.upcase!
    key2.upcase!

    table[0] = key1.split('')
    table[0] = populate_row(table[0], key1)
    row = table[0]

    key2.split('').each do |letter|
      table << row.rotate(row.index(letter))
    end

    table
  end

  def encrypt(plaintext, table, key)
    # For each letter in the plaintext, loop through the
    # first row and add the corresponding character from
    # whatever row we're on to the ciphertext string.
    ciphertext = ''
    key.upcase!

    plaintext.tr('?','').split('').each_with_index do |char, char_index|
      table[0].each_with_index do |letter, letter_index|
        ciphertext << table[char_index % key.length + 1][letter_index] if letter == char
      end
    end

    ciphertext
  end

  def decrypt(ciphertext, table, key)
    # For each letter in the ciphertext, loop through the
    # table (starting at row 1) and add the corresponding
    # character from row 0 to the plaintext string.
    plaintext = ''
    key.upcase!

    ciphertext.tr('?','').split('').each_with_index do |char, char_index|
      table[char_index % key.length + 1].each_with_index do |letter, letter_index|
        plaintext << table[0][letter_index] if letter == char
      end
    end

    plaintext
  end

  # Helpers

  def populate_row(row, key)
    # Build a row in our Vigenère table.
    alphabet.each do |letter|
      row << letter unless key.include? letter
    end

    row
  end

  def alphabet
    ('A'..'Z').to_a
  end
end

