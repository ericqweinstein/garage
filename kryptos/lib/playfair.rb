#!/usr/bin/env ruby -w
# encoding: UTF-8

# Author:: Eric Weinstein
# Copyright:: (c) 2013 Eric Weinstein
# License:: MIT (see LICENSE)

module Playfair
  ##
  # Encryption/decryption using Playfair ciphers
  # (http://en.wikipedia.org/wiki/Playfair_cipher)

  def build_table(key)
    # The key forms the first key.length letters
    # of the 5 x 5 grid from left to right (after
    # repeats are omitted), followed by the
    # remaining letters of the alphabet in order.
    # In this algorithm, the letter 'Q' is removed
    # from the table entirely to make it 5 x 5.
    #
    # (See kryptos.rb for an example.)
    key = key.upcase.split('').uniq
    grid = [[], [], [], [], []]
    grid_letters = key
    rest_of_grid = ('A'..'Z').to_a
    rest_of_grid.each do |letter|
      grid_letters << letter unless key.include? letter
    end

    grid_letters.delete('Q')

    grid.each_with_index do |row, index|
      grid[index] = grid_letters[index * 5, 5]
    end

    grid
  end

  def encrypt(plaintext, grid)
    ciphertext = []
    pairs = bigramify(plaintext)
    matches = []

    pairs.each do |pair|
      # If both elements of the pair are in the same row,
      # add the element to the right to the ciphertext
      grid.each_with_index do |row, index|
        if row.include?(pair[0]) && row.include?(pair[1])
          ciphertext << row[(row.index(pair[0]) + 1) % 5]
          ciphertext << row[(row.index(pair[1]) + 1) % 5]
        else
        # If elements of the pair are in different rows,
        # store locations as (row, index) tuples for evaluation
          matches[0] = [index, row.index(pair[0])] if row.include?(pair[0])
          matches[1] = [index, row.index(pair[1])] if row.include?(pair[1])
        end
      end
      # If our two matches share an index value, they're in the
      # same column and we push the values in the ensuing rows
      # to the ciphertext string; otherwise, we swap indices
      unless matches.empty?
        if matches[0][1] == matches[1][1]
          ciphertext << grid[(matches[0][0] + 1) % 5][matches[0][1]]
          ciphertext << grid[(matches[1][0] + 1) % 5][matches[1][1]]
          # Remove our matches in preparation for the next go 'round
          2.times { matches.shift }
        else
          ciphertext << grid[matches[0][0]][matches[1][1]]
          ciphertext << grid[matches[1][0]][matches[0][1]]
          2.times { matches.shift }
        end
      end
    end

    ciphertext = ciphertext.join('')

    ciphertext
  end

  def decrypt(ciphertext, grid)
    plaintext = []
    pairs = bigramify(ciphertext)
    matches = []

    pairs.each do |pair|
      # If both elements of the pair are in the same row,
      # add the element to the left to the ciphertext
      grid.each_with_index do |row, index|
        if row.include?(pair[0]) && row.include?(pair[1])
          plaintext << row[(row.index(pair[0]) + 9) % 5]
          plaintext << row[(row.index(pair[1]) + 9) % 5]
        else
        # If elements of the pair are in different rows,
        # store locations as (row, index) tuples for evaluation
          matches[0] = [index, row.index(pair[0])] if row.include?(pair[0])
          matches[1] = [index, row.index(pair[1])] if row.include?(pair[1])
        end
      end
      # If our two matches share an index value, they're in the
      # same column and we push the values in the preceding rows
      # to the ciphertext string; otherwise, we swap indices
      unless matches.empty?
        if matches[0][1] == matches[1][1]
          plaintext << grid[(matches[0][0] + 9) % 5][matches[0][1]]
          plaintext << grid[(matches[1][0] + 9) % 5][matches[1][1]]
          2.times { matches.shift }
        else
          plaintext << grid[matches[0][0]][matches[1][1]]
          plaintext << grid[matches[1][0]][matches[0][1]]
          2.times { matches.shift }
        end
      end
    end

    plaintext = plaintext.join('')

    plaintext
  end

  # Helpers

  def bigramify(text)
    # Returns an array of two-character strings.

    text_array = text.upcase.split('')

    text_array.each_with_index do |char, index|
      # If we get a double-letter bigram, break it up with an X
      if index.even?
        if char == text_array[index + 1]
          text_array.insert(index + 1, 'X')
          text = text_array.join('')

          # Recurse because we never want to modify
          # and iterate over an array at the same time
          bigramify(text)
        end
      end
    end

    # Pad with an extra X if the length is an odd number
    text_array << 'X' if text_array.length.odd?

    text = text_array.join('')

    # Replace any Qs with Xs (since build_table omits Qs)
    text.gsub!('Q', 'X')

    # Split into bigrams and kick out any empty strings
    pairs = text.split(/(.{2})/).reject { |pair| pair if pair.empty? }
    return pairs
  end
end
