# encoding: UTF-8

require_relative '../lib/dekryptos/vigenere.rb'

describe Vigenere do
  include Vigenere

  before do
    @table = [
      %w[K R Y P T O S A B C D E F G H I J L M N Q U V W X Z],
      %w[P T O S A B C D E F G H I J L M N Q U V W X Z K R Y],
      %w[A B C D E F G H I J L M N Q U V W X Z K R Y P T O S],
      %w[L M N Q U V W X Z K R Y P T O S A B C D E F G H I J],
      %w[I J L M N Q U V W X Z K R Y P T O S A B C D E F G H],
      %w[M N Q U V W X Z K R Y P T O S A B C D E F G H I J L],
      %w[P T O S A B C D E F G H I J L M N Q U V W X Z K R Y],
      %w[S A B C D E F G H I J L M N Q U V W X Z K R Y P T O],
      %w[E F G H I J L M N Q U V W X Z K R Y P T O S A B C D],
      %w[S A B C D E F G H I J L M N Q U V W X Z K R Y P T O],
      %w[T O S A B C D E F G H I J L M N Q U V W X Z K R Y P]
    ]

    @ciphertext = 'EMUFPHZLRFAXYUSDJKZLDKRNSHGNFIVJYQTQUXQBQVYUVLLTREVJYQTMKYRDMFD'
    @plaintext  = 'BETWEENSUBTLESHADINGANDTHEABSENCEOFLIGHTLIESTHENUANCEOFIQLUSION'
    @key        = 'palimpsest'
  end

  describe '#build_table' do
    it 'should create a correct Vigenère table' do
      build_table('kryptos', 'palimpsest').should eq(@table)
    end
  end
  describe '#encrypt' do
    it 'should correctly encrypt plaintext given a table and key' do
      encrypt(@plaintext, @table, @key).should eq(@ciphertext)
    end
  end
  describe '#decrypt' do
    it 'should correctly decrypt ciphertext given a table and key' do
      decrypt(@ciphertext, @table, @key).should eq(@plaintext)
    end
  end
end

