# encoding: UTF-8

require_relative '../lib/dekryptos/monoalphabetic.rb'

describe Monoalphabetic do
  include Monoalphabetic

  before do
    @plaintext  = 'SOSAYWEALL'
    @ciphertext = 'FBFNLJRNYY'
  end

  describe '#rot_13' do
    it 'should correctly encrypt plaintext' do
      rot_13(@plaintext).should eq(@ciphertext)
    end
    it 'should correctly decrypt ciphertext' do
      rot_13(@ciphertext).should eq(@plaintext)
    end
  end
end

