# encoding: UTF-8

require_relative '../lib/autokey.rb'

describe Autokey do
  include Autokey

  before do
    @plaintext  = 'ATTACKATDAWN'
    @keyword    = 'TEST'
    @ciphertext = 'TXLTCDTTFKWG'
  end

  describe '#encrypt' do
    it 'should correctly encrypt plaintext given a keyword' do
      # encrypt(@plaintext, @key).should eq(@ciphertext)
    end
  end
  describe '#decrypt' do
    it 'should correctly decrypt ciphertext given a keyword' do
      # decrypt(@ciphertext, @key).should eq(@plaintext)
    end
  end
end

