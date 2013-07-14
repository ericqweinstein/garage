# encoding: UTF-8

require_relative '../playfair.rb'

describe Playfair do
  include Playfair

  before do
    @grid = [
      %w[K R Y P T],
      %w[O S A B C],
      %w[D E F G H],
      %w[I J L M N],
      %w[U V W X Z]
    ]
    
    @ciphertext = 'CYYCOTCYFOZL'
    @plaintext  = 'ATTACKATDAWN'
  end

  describe '#build_table' do
    it 'should generate a playfair grid given a key' do
      build_table('kryptos').should eq(@grid)
    end
  end
  describe '#encrypt' do
    it 'correctly encrypts plaintext given a grid' do
      encrypt(@plaintext, @grid).should eq(@ciphertext)
    end
  end
  describe '#decrypt' do
    it 'needs tests' do
    end
  end
  describe '#bigramify' do
    it 'should handle even-lettered strings' do
      bigramify('ELEPHANT').should eq(%w[EL EP HA NT])
    end
    it 'should handle odd-lettered strings' do
      bigramify('PANDA').should eq(%w[PA ND AX])
    end
    it 'should handle bigrams with repeated letters' do
      bigramify('ABOOKKEEPER').should eq(%w[AB OX OK KE EP ER])
      bigramify('GIRAFFE').should eq(%w[GI RA FX FE])
    end
  end
end

