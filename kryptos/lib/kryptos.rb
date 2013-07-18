#!/usr/bin/env ruby -w
# encoding: UTF-8

# Author:: Eric Weinstein
# Copyright:: (c) 2013 Eric Weinstein
# License:: MIT (see LICENSE)

module Kryptos
  ##
  # == K1, K2, K3, K4
  #
  # These are the four parts of the Kryptos sculpture
  # (http://en.wikipedia.org/wiki/Kryptos).
  #
  # == Example Tables
  #
  # These are examples of Vigenère and Playfair cipher
  # tables.

  K1 = 'EMUFPHZLRFAXYUSDJKZLDKRNSHGNFIVJYQTQUXQ'\
  'BQVYUVLLTREVJYQTMKYRDMFD'

  # I've added an extra 'S' eight characters before the
  # end of K2 in order to correct Jim's error (the final
  # words should be "X LAYER TWO" and not "ID BY ROWS").
  K2 = 'VFPJUDEEHZWETZYVGWHKKQETGFQJNCEGGWHKK?D'\
  'QMCPFQZDQMMIAGPFXHQRLGTIMVMZJANQLVKQEDAGDVFRPJUNGEU'\
  'NAQZGZLECGYUXUEENJTBJLBQCRTBJDFHRRYIZETKZEMVDUFKSJH'\
  'KFWHKUWQLSZFTIHHDDDUVH?DWKBFUFPWNTDFIYCUQZEREEVLDKF'\
  'EZMOQQJLTTUGSYQPFEUNLAVIDXFLGGTEZ?FKZBSFDQVGOGIPUFX'\
  'HHDRKFFHQNTGPUAECNUVPDJMQCLQUMUNEDFQELZZVRRGKFFVOEE'\
  'XBDMVPNFQXEZLGREDNQFMPNZGLFLPMRJQYALMGNUVPDXVKPDQUM'\
  'EBEDMHDAFMJGZNUPLGESWJLLAETG'

  # I've omitted the final '?' from K3 in order to
  # facilitate correct transposition.
  K3 = 'ENDYAHROHNLSRHEOCPTEOIBIDYSHNAIACHTNR'\
  'EYULDSLLSLLNOHSNOSMRWXMNETPRNGATIHNRARPESLNNELEBLPI'\
  'IACAEWMTWNDITEENRAHCTENEUDRETNHAEOETFOLSEDTIWENHAEI'\
  'OYTEYQHEENCTAYCREIFTBRSPAMHHEWENATAMATEGYEERLBTEEFO'\
  'ASFIOTUETUAEOTOARMAEERTNRTIBSEDDNIAAHTTMSTEWPIEROAG'\
  'RIEWFEBAECTDDHILCEIHSITEGOEAOSDDRYDLORITRKLMLEHAGTD'\
  'HARDPNEOHMGFMFEUHEECDMRIPFEIMEHNLSSTTRTVDOHW'

  K4 = 'OBKRUOXOGHULBSOLIFBBWFLRVQQPRNGKSSOTWT'\
  'QSJQSSEKZZWATJKLUDIAWINFBNYPVTTMZFPKWGDKZXTJCDIGKUH'\
  'UAUEKCAR'

  EXAMPLE_VIGENERE_TABLE = [
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

  EXAMPLE_PLAYFAIR_TABLE = [
    %w[K R Y P T],
    %w[O S A B C],
    %w[D E F G H],
    %w[I J L M N],
    %w[U V W X Z]
  ]
end

