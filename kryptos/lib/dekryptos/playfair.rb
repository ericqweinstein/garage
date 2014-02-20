# encoding: UTF-8

# Author:: Eric Weinstein
# Copyright:: (c) 2013 Eric Weinstein
# License:: MIT (see LICENSE)

module Playfair
  ##
  # Encryption/decryption using Playfair ciphers
  # (http://en.wikipedia.org/wiki/Playfair_cipher)

  # Public: builds the 5 x 5 grid for our Playfair cipher.
  #
  # === Parameter(s)
  # +key+ - +String+: the key forms the first +key.length+ letters of the 5 x 5
  # grid from left to right (after repeats are omitted), followed by the remaining
  # letters of the alphabet in order. In this algorithm, the letter 'Q' is removed
  # from the table entirely to make it 5 x 5.
  #
  # === Return Value
  # +Array+: a two-dimensional array of characters (5 x 5).
  #
  # === Example
  # +build_table('KRYPTOS')+
  #
  # (See +EXAMPLE_PLAYFAIR_TABLE+ in +kryptos.rb+ for the result.)
  def build_table(key)
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

  # Public: encrypts plaintext using a Playfair cipher.
  #
  # * If both elements of the pair are in the same row, we add the element to the right
  #   to the ciphertext.
  # * If the elements of the pair are in _different_ rows, we store the location as a
  #   (row, index) tuple in +matches+ for evaluation as follows:
  #   * Comparing two +matches+ at a time, if they share an index value, they must be in
  #     the same column. We then push the values in the ensuing rows to the ciphertext string.
  #   * If the two +matches+ do _not_ share an index value, they must form nonconsecutive vertices
  #     (opposing corners) of a rectangle. We then push their complements to the ciphertext string,
  #     which is equivalent to simply swapping their indices.
  #   * After comparing each set of two +matches+, we shift them off the +matches+ array and continue.
  #
  # === Parameter(s)
  # +plaintext+ - +String+: the text to be encrypted.
  # +grid+ - +Array+: the grid generated by +build_table+.
  #
  # === Return Value
  # +String+: the encrypted text.
  #
  # === Example
  # +encrypt('ATTACKATDAWN', EXAMPLE_PLAYFAIR_TABLE)+
  # +=> "CYYCOTCYFOZL"+
  def encrypt(plaintext, grid)
    ciphertext = []
    pairs = bigramify(plaintext)
    matches = []

    pairs.each do |pair|
      grid.each_with_index do |row, index|
        if row.include?(pair[0]) && row.include?(pair[1])
          ciphertext << row[(row.index(pair[0]) + 1) % 5]
          ciphertext << row[(row.index(pair[1]) + 1) % 5]
        else
          matches[0] = [index, row.index(pair[0])] if row.include?(pair[0])
          matches[1] = [index, row.index(pair[1])] if row.include?(pair[1])
        end
      end
      unless matches.empty?
        if matches[0][1] == matches[1][1]
          ciphertext << grid[(matches[0][0] + 1) % 5][matches[0][1]]
          ciphertext << grid[(matches[1][0] + 1) % 5][matches[1][1]]
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

  # Public: decrypts ciphertext using a Playfair cipher.
  #
  # * If both elements of the pair are in the same row, we add the element to the left 
  #   to the ciphertext.
  # * If the elements of the pair are in _different_ rows, we store the location as a
  #   (row, index) tuple in +matches+ for evaluation as follows:
  #   * Comparing two +matches+ at a time, if they share an index value, they must be in
  #     the same column. We then push the values in the preceding rows to the ciphertext string.
  #   * If the two +matches+ do _not_ share an index value, they must form nonconsecutive vertices
  #     (opposing corners) of a rectangle. We then push their complements to the ciphertext string,
  #     which is equivalent to simply swapping their indices.
  #   * After comparing each set of two +matches+, we shift them off the +matches+ array and continue.
  #
  # === Parameter(s)
  # +ciphertext+ - +String+: the text to be decrypted.
  # +grid+ - +Array+: the grid generated by +build_table+.
  #
  # === Return Value
  # +String+: the decrypted text.
  #
  # === Example
  # +encrypt('CYYCOTCYFOZL', EXAMPLE_PLAYFAIR_TABLE)+
  # +=> "ATTACKATDAWN"+
  def decrypt(ciphertext, grid)
    plaintext = []
    pairs = bigramify(ciphertext)
    matches = []

    pairs.each do |pair|
      grid.each_with_index do |row, index|
        if row.include?(pair[0]) && row.include?(pair[1])
          plaintext << row[(row.index(pair[0]) + 9) % 5]
          plaintext << row[(row.index(pair[1]) + 9) % 5]
        else
          matches[0] = [index, row.index(pair[0])] if row.include?(pair[0])
          matches[1] = [index, row.index(pair[1])] if row.include?(pair[1])
        end
      end
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

  private

  # Private: converts text to bigrams for processing by our encryption/decryption methods.
  #
  # * If we encounter a double-letter bigram, we break it up with an X.
  # * If we end up with an odd number of letters, we pad with a final X.
  # * We replace any Qs with Xs (since +build_table+ omits Qs).
  #
  # === Parameter(s)
  # +text+ - +String+: the text to convert to bigrams.
  #
  # === Return Value
  # +Array+: an array of two-character strings (bigrams).
  def bigramify(text)
    text_array = text.upcase.split('')

    text_array.each_with_index do |char, index|
      if index.even?
        if char == text_array[index + 1]
          text_array.insert(index + 1, 'X')
          text = text_array.join('')
          bigramify(text)
        end
      end
    end

    text_array << 'X' if text_array.length.odd?
    text = text_array.join('')
    text.gsub!('Q', 'X')

    pairs = text.split(/(.{2})/).reject { |pair| pair if pair.empty? }
    return pairs
  end
end
