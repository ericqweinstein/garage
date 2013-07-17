#!/usr/bin/env ruby -w
# encoding: UTF-8

# Author:: Eric Weinstein
# Copyright:: (c) 2013 Eric Weinstein
# License:: MIT (see LICENSE)

module Autokey
  ##
  # Encryption/decryption using autokey ciphers
  # (http://en.wikipedia.org/wiki/Autokey_cipher)

  # Public: encrypts plaintext via autokey cipher.
  def encrypt(plaintext, keyword)
  end

  # Public: decrypts ciphertext via autokey cipher.
  def decrypt(ciphertext, keyword)
  end

  # Private: generates the tabula recta needed to encrypt text via autokey cipher.
  def build_tabula_recta
  end

  # Private: generates an alphabet.
  def alphabet
    ('A'..'Z').to_a
  end
end

