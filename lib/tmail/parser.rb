#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.8
# from Racc grammer file "".
#

require 'racc/parser.rb'

#
# parser.rb
#
# Copyright (c) 1998-2007 Minero Aoki
#
# This program is free software.
# You can distribute/modify this program under the terms of
# the GNU Lesser General Public License version 2.1.
#

require 'tmail/scanner'
require 'tmail/utils'

module TMail
  class Parser < Racc::Parser

module_eval(<<'...end parser.y/module_eval...', 'parser.y', 360)

  include TextUtils

  def self.parse( ident, str, cmt = nil )
    str = special_quote_address(str) if ident.to_s =~ /M?ADDRESS/
    new.parse(ident, str, cmt)
  end

  def self.special_quote_address(str) #:nodoc:
    # Takes a string which is an address and adds quotation marks to special
    # edge case methods that the RACC parser can not handle.
    #
    # Right now just handles two edge cases:
    #
    # Full stop as the last character of the display name:
    #   Mikel L. <mikel@me.com>
    # Returns:
    #   "Mikel L." <mikel@me.com>
    #
    # Unquoted @ symbol in the display name:
    #   mikel@me.com <mikel@me.com>
    # Returns:
    #   "mikel@me.com" <mikel@me.com>
    #
    # Any other address not matching these patterns just gets returned as is.
    case
    # This handles the missing "" in an older version of Apple Mail.app
    # around the display name when the display name contains a '@'
    # like 'mikel@me.com <mikel@me.com>'
    # Just quotes it to: '"mikel@me.com" <mikel@me.com>'
    when str =~ /\A([^"].+@.+[^"])\s(<.*?>)\Z/
      return "\"#{$1}\" #{$2}"
    # This handles cases where 'Mikel A. <mikel@me.com>' which is a trailing
    # full stop before the address section.  Just quotes it to
    # '"Mikel A." <mikel@me.com>'
    when str =~ /\A(.*?\.)\s(<.*?>)\s*\Z/
      return "\"#{$1}\" #{$2}"
    else
      str
    end
  end

  MAILP_DEBUG = false

  def initialize
    self.debug = MAILP_DEBUG
  end

  def debug=( flag )
    @yydebug = flag && Racc_debug_parser
    @scanner_debug = flag
  end

  def debug
    @yydebug
  end

  def parse( ident, str, comments = nil )
    @scanner = Scanner.new(str, ident, comments)
    @scanner.debug = @scanner_debug
    @first = [ident, ident]
    result = yyparse(self, :parse_in)
    comments.map! {|c| to_kcode(c) } if comments
    result
  end

  private

  def parse_in( &block )
    yield @first
    @scanner.scan(&block)
  end

  def on_error( t, val, vstack )
    raise TMail::SyntaxError, "parse error on token #{racc_token2str t}"
  end
...end parser.y/module_eval...
##### State transition tables begin ###

racc_action_table = [
   -69,   133,   -70,    23,    25,   156,    98,    29,    32,   145,
   146,    16,    17,    20,    22,   102,   -69,   157,   -70,    33,
   -69,   110,   -70,   148,   149,    82,   -69,    95,   -70,    77,
   -70,    23,    25,   123,    92,    29,    32,   108,   109,    16,
    17,    20,    22,    85,    27,    30,    30,    33,    23,    25,
   115,   100,    29,    32,    84,   120,    16,    17,    20,    22,
    83,    27,    82,    30,    33,    23,    25,   126,   104,    29,
    32,   128,   129,    16,    17,    20,    22,    95,    27,   131,
    30,    33,    23,    25,   132,    30,    29,    32,    30,    77,
    16,    17,    20,    22,    79,    23,    25,    30,    33,    29,
    32,    67,   136,    16,    17,    20,    22,    82,    27,    64,
    30,    33,    23,    25,   139,    62,    29,    32,    46,   142,
    16,    17,    20,    22,    30,    54,    30,    30,    33,    23,
    25,   104,   104,    29,    32,   116,   118,    16,    17,    20,
    22,    30,    23,    25,    30,    33,    29,    32,   150,   151,
    16,    17,    20,    22,   154,    23,    25,   155,    33,    29,
    32,    44,   159,    16,    17,    20,    22,   161,    27,    42,
    30,    33,    23,    25,    15,   166,    29,    32,    42,   168,
    16,    17,    20,    22,   169,    23,    25,   nil,    33,    29,
    32,    76,   nil,    16,    17,    20,    22,   nil,   nil,    96,
    30,    33,    23,    25,   nil,    70,    29,    32,   nil,   nil,
    16,    17,    20,    22,   nil,    27,   nil,    30,    33,    23,
    25,   nil,   nil,    29,    32,    76,   nil,    16,    17,    20,
    22,   nil,    23,    25,    30,    33,    29,    32,   nil,   nil,
    16,    17,    20,    22,   nil,    27,   nil,    30,    33,    23,
    25,   nil,   nil,    29,    32,   nil,   nil,    16,    17,    20,
    22,   nil,    23,    25,    30,    33,    29,    32,   nil,   nil,
    16,    17,    20,    22,   nil,    23,    25,    81,    33,    29,
    32,   nil,   nil,    16,    17,    20,    22,   nil,    23,    25,
   nil,    33,    29,    32,   nil,   nil,    16,    17,    20,    22,
   nil,    27,   nil,    30,    33,    23,    25,   123,   nil,    29,
    32,   nil,   nil,    16,    17,    20,    22,   nil,    27,   nil,
    30,    33,    23,    25,   nil,   nil,    29,    32,   nil,   nil,
    16,    17,    20,    22,   nil,    23,    25,   112,    33,    29,
    32,   nil,   nil,    16,    17,    20,    22,   nil,    88,    25,
   nil,    33,    29,    32,   nil,    91,    16,    17,    20,    22,
    88,    25,   nil,   112,    29,    32,   nil,    91,    16,    17,
    20,    22,    88,    25,   nil,   nil,    29,    32,   nil,    91,
    16,    17,    20,    22,    88,    25,   nil,   nil,    29,    32,
   nil,    91,    16,    17,    20,    22,    88,    25,   nil,   nil,
    29,    32,   nil,    91,    16,    17,    20,    22,    88,    25,
   nil,   nil,    29,    32,   nil,    91,    16,    17,    20,    22,
     4,     6,     7,     8,     9,    10,    11,    12,    13,     1,
     2,     3,    88,    25,   nil,   nil,    29,    32,   nil,    91,
    16,    17,    20,    22 ]

racc_action_check = [
    28,   115,    77,    57,    57,   146,    58,    57,    57,   137,
   137,    57,    57,    57,    57,    64,    28,   146,    77,    57,
    28,    75,    77,   139,   139,    53,    28,    52,    77,    28,
    77,   130,   130,   130,    47,   130,   130,    74,    74,   130,
   130,   130,   130,    44,   130,    80,   130,   130,     3,     3,
    84,    62,     3,     3,    43,    93,     3,     3,     3,     3,
    42,     3,    38,     3,     3,   154,   154,   100,   101,   154,
   154,   102,   104,   154,   154,   154,   154,   105,   154,   107,
   154,   154,    73,    73,   108,   111,    73,    73,   114,    72,
    73,    73,    73,    73,    34,     7,     7,    73,    73,     7,
     7,    13,   120,     7,     7,     7,     7,   124,     7,    12,
     7,     7,     8,     8,   129,    11,     8,     8,     6,   133,
     8,     8,     8,     8,   134,     8,    69,     8,     8,     9,
     9,   138,    68,     9,     9,    90,    90,     9,     9,     9,
     9,   141,    10,    10,    90,     9,    10,    10,   142,   143,
    10,    10,    10,    10,   144,     2,     2,   145,    10,     2,
     2,     5,   150,     2,     2,     2,     2,   153,     2,     4,
     2,     2,   125,   125,     1,   159,   125,   125,   161,   165,
   125,   125,   125,   125,   166,    54,    54,   nil,   125,    54,
    54,    54,   nil,    54,    54,    54,    54,   nil,   nil,    54,
    54,    54,    26,    26,   nil,    26,    26,    26,   nil,   nil,
    26,    26,    26,    26,   nil,    26,   nil,    26,    26,    27,
    27,   nil,   nil,    27,    27,    27,   nil,    27,    27,    27,
    27,   nil,    70,    70,    27,    27,    70,    70,   nil,   nil,
    70,    70,    70,    70,   nil,    70,   nil,    70,    70,   157,
   157,   nil,   nil,   157,   157,   nil,   nil,   157,   157,   157,
   157,   nil,    37,    37,   157,   157,    37,    37,   nil,   nil,
    37,    37,    37,    37,   nil,    98,    98,    37,    37,    98,
    98,   nil,   nil,    98,    98,    98,    98,   nil,    40,    40,
   nil,    98,    40,    40,   nil,   nil,    40,    40,    40,    40,
   nil,    40,   nil,    40,    40,    94,    94,    94,   nil,    94,
    94,   nil,   nil,    94,    94,    94,    94,   nil,    94,   nil,
    94,    94,    78,    78,   nil,   nil,    78,    78,   nil,   nil,
    78,    78,    78,    78,   nil,    61,    61,    78,    78,    61,
    61,   nil,   nil,    61,    61,    61,    61,   nil,   117,   117,
   nil,    61,   117,   117,   nil,   117,   117,   117,   117,   117,
    46,    46,   nil,   117,    46,    46,   nil,    46,    46,    46,
    46,    46,    76,    76,   nil,   nil,    76,    76,   nil,    76,
    76,    76,    76,    76,   116,   116,   nil,   nil,   116,   116,
   nil,   116,   116,   116,   116,   116,   132,   132,   nil,   nil,
   132,   132,   nil,   132,   132,   132,   132,   132,    92,    92,
   nil,   nil,    92,    92,   nil,    92,    92,    92,    92,    92,
     0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     0,     0,    79,    79,   nil,   nil,    79,    79,   nil,    79,
    79,    79,    79,    79 ]

racc_action_pointer = [
   418,   143,   141,    34,   154,   161,   100,    81,    98,   115,
   128,   101,    78,    70,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   188,   205,     0,   nil,
   nil,   nil,   nil,   nil,    74,   nil,   nil,   248,    36,   nil,
   274,   nil,    44,    40,    43,   nil,   346,    15,   nil,   nil,
   nil,   nil,    11,    -1,   171,   nil,   nil,   -11,   -10,   nil,
   nil,   321,    22,   nil,   -17,   nil,   nil,   nil,   106,    97,
   218,   nil,    60,    68,    21,    -7,   358,     2,   308,   418,
    16,   nil,   nil,   nil,    35,   nil,   nil,   nil,   nil,   nil,
   115,   nil,   394,    33,   291,   nil,   nil,   nil,   261,   nil,
    53,    42,    40,   nil,    41,    61,   nil,    51,    64,   nil,
   nil,    56,   nil,   nil,    59,   -13,   370,   334,   nil,   nil,
    87,   nil,   nil,   nil,    81,   158,   nil,   nil,   nil,    81,
    17,   nil,   382,   105,    95,   nil,   nil,   -14,   105,    -7,
   nil,   112,   131,   134,   129,   142,   -10,   nil,   nil,   nil,
   148,   nil,   nil,   141,    51,   nil,   nil,   235,   nil,   158,
   nil,   163,   nil,   nil,   nil,   151,   170,   nil,   nil,   nil ]

racc_action_default = [
  -112,  -112,  -112,  -112,   -14,  -112,   -20,  -112,  -112,  -112,
  -112,  -112,  -112,  -112,   -10,   -97,  -108,  -109,   -79,   -44,
  -110,   -11,  -111,   -81,   -43,  -105,  -112,  -112,   -60,  -106,
   -77,   -55,  -107,   -80,   -68,   -54,   -71,  -112,   -45,   -12,
  -112,    -1,  -112,  -112,  -112,    -2,  -112,   -22,   -51,   -48,
   -50,    -3,   -40,   -41,  -112,   -46,    -4,   -88,    -5,   -90,
    -6,   -92,  -112,    -7,   -97,    -8,    -9,  -101,  -103,   -61,
   -59,   -56,   -69,  -112,  -112,  -112,  -112,   -77,   -73,  -112,
   -72,   -77,   -57,   -15,  -112,   170,   -75,   -82,   -84,   -21,
   -24,   -83,  -112,   -27,  -112,   -85,   -47,   -91,  -112,   -93,
  -112,  -103,  -112,  -102,  -104,   -58,   -52,  -112,  -112,   -64,
   -63,   -65,   -78,   -74,   -67,  -112,  -112,  -112,   -26,   -23,
  -112,   -29,   -49,   -86,   -42,   -89,   -94,   -96,   -97,  -100,
  -112,   -62,  -112,  -112,   -25,   -76,   -28,   -31,  -103,  -112,
   -53,   -66,  -112,  -112,   -34,  -112,  -112,   -95,   -98,   -99,
  -112,   -18,   -13,   -38,  -112,   -30,   -33,  -112,   -32,   -16,
   -19,   -14,   -35,   -36,   -37,  -112,  -112,   -39,   -87,   -17 ]

racc_goto_table = [
    41,    69,    72,    75,    40,    68,    71,    24,    39,    59,
    61,    78,    80,    38,    57,    69,   111,   103,    89,   114,
    71,    94,    51,    55,   160,   137,   144,   153,   121,    72,
    75,    93,    47,   158,   162,   152,    87,   143,    21,    14,
    19,   122,   105,    66,    65,    63,    60,   135,    72,   107,
   127,    58,    78,    56,   101,    78,   134,    97,    45,     5,
   nil,    99,   nil,    78,   119,   nil,    87,   nil,   nil,    87,
   nil,    40,   141,   117,   130,   106,   nil,   nil,   113,   nil,
   nil,   nil,    87,   nil,   nil,   nil,   nil,   147,   nil,   nil,
   nil,   nil,   nil,   nil,   117,   nil,   nil,   117,    59,   nil,
   nil,   nil,   nil,   125,   nil,   124,    87,    87,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   117,   138,   nil,
   nil,   nil,    87,   nil,   117,    97,   nil,   nil,   nil,    72,
   164,    40,    72,   165,   163,   140,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   167 ]

racc_goto_check = [
     2,    37,    37,    29,    36,    46,    28,    13,    13,    41,
    41,    42,    37,    31,    45,    37,    25,    47,    24,    25,
    28,    32,     4,     4,    23,    20,    21,    22,    19,    37,
    29,    18,    17,    26,    27,    16,    44,    15,    12,    11,
    33,    34,    35,    10,     9,     8,     7,    43,    37,    29,
    47,     6,    42,     5,    46,    42,    25,    41,     3,     1,
   nil,    41,   nil,    42,    24,   nil,    44,   nil,   nil,    44,
   nil,    36,    25,    42,    32,    13,   nil,   nil,    41,   nil,
   nil,   nil,    44,   nil,   nil,   nil,   nil,    47,   nil,   nil,
   nil,   nil,   nil,   nil,    42,   nil,   nil,    42,    41,   nil,
   nil,   nil,   nil,    45,   nil,    31,    44,    44,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,    42,    46,   nil,
   nil,   nil,    44,   nil,    42,    41,   nil,   nil,   nil,    37,
    29,    36,    37,    29,    28,    13,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,     2 ]

racc_goto_pointer = [
   nil,    59,    -4,    52,    15,    45,    42,    36,    34,    32,
    30,    38,    36,     5,   nil,   -96,  -108,    26,   -16,   -65,
   -96,  -111,  -117,  -129,   -28,   -60,  -113,  -120,   -20,   -24,
   nil,    11,   -31,    38,   -53,   -28,     1,   -25,   nil,   nil,
   nil,     0,   -17,   -70,   -10,     5,   -10,   -51 ]

racc_goto_default = [
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,    50,    43,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,    90,   nil,   nil,    31,    35,
    52,    53,   nil,    48,    49,   nil,    26,    28,    73,    74,
    34,    36,    37,    86,    18,   nil,   nil,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  2, 35, :_reduce_1,
  2, 35, :_reduce_2,
  2, 35, :_reduce_3,
  2, 35, :_reduce_4,
  2, 35, :_reduce_5,
  2, 35, :_reduce_6,
  2, 35, :_reduce_7,
  2, 35, :_reduce_8,
  2, 35, :_reduce_9,
  2, 35, :_reduce_10,
  2, 35, :_reduce_11,
  2, 35, :_reduce_12,
  6, 36, :_reduce_13,
  0, 48, :_reduce_none,
  2, 48, :_reduce_none,
  3, 49, :_reduce_16,
  5, 49, :_reduce_17,
  1, 50, :_reduce_18,
  7, 37, :_reduce_19,
  0, 51, :_reduce_none,
  2, 51, :_reduce_21,
  0, 52, :_reduce_none,
  2, 52, :_reduce_23,
  1, 58, :_reduce_24,
  3, 58, :_reduce_25,
  2, 58, :_reduce_26,
  0, 53, :_reduce_none,
  2, 53, :_reduce_28,
  0, 54, :_reduce_29,
  3, 54, :_reduce_30,
  0, 55, :_reduce_none,
  2, 55, :_reduce_32,
  2, 55, :_reduce_33,
  0, 56, :_reduce_none,
  2, 56, :_reduce_35,
  1, 61, :_reduce_36,
  1, 61, :_reduce_37,
  0, 57, :_reduce_none,
  2, 57, :_reduce_39,
  1, 38, :_reduce_none,
  1, 38, :_reduce_none,
  3, 38, :_reduce_none,
  1, 46, :_reduce_none,
  1, 46, :_reduce_none,
  1, 46, :_reduce_none,
  1, 39, :_reduce_none,
  2, 39, :_reduce_47,
  1, 64, :_reduce_48,
  3, 64, :_reduce_49,
  1, 68, :_reduce_none,
  1, 68, :_reduce_none,
  1, 69, :_reduce_52,
  3, 69, :_reduce_53,
  1, 47, :_reduce_none,
  1, 47, :_reduce_none,
  2, 47, :_reduce_56,
  2, 67, :_reduce_none,
  3, 65, :_reduce_58,
  2, 65, :_reduce_59,
  1, 70, :_reduce_60,
  2, 70, :_reduce_61,
  4, 62, :_reduce_62,
  3, 62, :_reduce_63,
  2, 72, :_reduce_none,
  2, 73, :_reduce_65,
  4, 73, :_reduce_66,
  3, 63, :_reduce_67,
  1, 63, :_reduce_68,
  1, 74, :_reduce_none,
  2, 74, :_reduce_70,
  1, 71, :_reduce_71,
  2, 71, :_reduce_72,
  2, 71, :_reduce_73,
  3, 71, :_reduce_74,
  1, 59, :_reduce_75,
  3, 59, :_reduce_76,
  1, 76, :_reduce_77,
  2, 76, :_reduce_78,
  1, 75, :_reduce_none,
  1, 75, :_reduce_none,
  1, 75, :_reduce_none,
  1, 77, :_reduce_none,
  1, 77, :_reduce_none,
  1, 77, :_reduce_none,
  1, 66, :_reduce_none,
  2, 66, :_reduce_none,
  3, 60, :_reduce_87,
  1, 40, :_reduce_88,
  3, 40, :_reduce_89,
  1, 79, :_reduce_none,
  2, 79, :_reduce_91,
  1, 41, :_reduce_92,
  2, 41, :_reduce_93,
  3, 42, :_reduce_94,
  5, 43, :_reduce_95,
  3, 43, :_reduce_96,
  0, 80, :_reduce_97,
  5, 80, :_reduce_98,
  5, 80, :_reduce_99,
  3, 80, :_reduce_100,
  1, 44, :_reduce_101,
  3, 45, :_reduce_102,
  0, 81, :_reduce_none,
  1, 81, :_reduce_none,
  1, 78, :_reduce_none,
  1, 78, :_reduce_none,
  1, 78, :_reduce_none,
  1, 78, :_reduce_none,
  1, 78, :_reduce_none,
  1, 78, :_reduce_none,
  1, 78, :_reduce_none ]

racc_reduce_n = 112

racc_shift_n = 170

racc_token_table = {
  false => 0,
  :error => 1,
  :DATETIME => 2,
  :RECEIVED => 3,
  :MADDRESS => 4,
  :RETPATH => 5,
  :KEYWORDS => 6,
  :ENCRYPTED => 7,
  :MIMEVERSION => 8,
  :CTYPE => 9,
  :CENCODING => 10,
  :CDISPOSITION => 11,
  :ADDRESS => 12,
  :MAILBOX => 13,
  :DIGIT => 14,
  :ATOM => 15,
  "," => 16,
  ":" => 17,
  :FROM => 18,
  :BY => 19,
  "@" => 20,
  :DOMLIT => 21,
  :VIA => 22,
  :WITH => 23,
  :ID => 24,
  :FOR => 25,
  ";" => 26,
  "<" => 27,
  ">" => 28,
  "." => 29,
  :QUOTED => 30,
  :TOKEN => 31,
  "/" => 32,
  "=" => 33 }

racc_nt_base = 34

racc_use_result_var = false

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "DATETIME",
  "RECEIVED",
  "MADDRESS",
  "RETPATH",
  "KEYWORDS",
  "ENCRYPTED",
  "MIMEVERSION",
  "CTYPE",
  "CENCODING",
  "CDISPOSITION",
  "ADDRESS",
  "MAILBOX",
  "DIGIT",
  "ATOM",
  "\",\"",
  "\":\"",
  "FROM",
  "BY",
  "\"@\"",
  "DOMLIT",
  "VIA",
  "WITH",
  "ID",
  "FOR",
  "\";\"",
  "\"<\"",
  "\">\"",
  "\".\"",
  "QUOTED",
  "TOKEN",
  "\"/\"",
  "\"=\"",
  "$start",
  "content",
  "datetime",
  "received",
  "addrs_TOP",
  "retpath",
  "keys",
  "enc",
  "version",
  "ctype",
  "cencode",
  "cdisp",
  "addr_TOP",
  "mbox",
  "day",
  "hour",
  "zone",
  "from",
  "by",
  "via",
  "with",
  "id",
  "for",
  "received_datetime",
  "received_domain",
  "domain",
  "msgid",
  "received_addrspec",
  "routeaddr",
  "spec",
  "addrs",
  "group_bare",
  "commas",
  "group",
  "addr",
  "mboxes",
  "addr_phrase",
  "local_head",
  "routes",
  "at_domains",
  "local",
  "word",
  "dots",
  "domword",
  "atom",
  "phrase",
  "params",
  "opt_semicolon" ]

Racc_debug_parser = true

##### State transition tables end #####

# reduce 0 omitted

module_eval(<<'.,.,', 'parser.y', 16)
  def _reduce_1(val, _values)
     val[1] 
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 17)
  def _reduce_2(val, _values)
     val[1] 
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 18)
  def _reduce_3(val, _values)
     val[1] 
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 19)
  def _reduce_4(val, _values)
     val[1] 
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 20)
  def _reduce_5(val, _values)
     val[1] 
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 21)
  def _reduce_6(val, _values)
     val[1] 
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 22)
  def _reduce_7(val, _values)
     val[1] 
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 23)
  def _reduce_8(val, _values)
     val[1] 
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 24)
  def _reduce_9(val, _values)
     val[1] 
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 25)
  def _reduce_10(val, _values)
     val[1] 
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 26)
  def _reduce_11(val, _values)
     val[1] 
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 27)
  def _reduce_12(val, _values)
     val[1] 
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 33)
  def _reduce_13(val, _values)
                      t = Time.gm(val[3].to_i, val[2], val[1].to_i, 0, 0, 0)
                  (t + val[4] - val[5]).localtime
                
  end
.,.,

# reduce 14 omitted

# reduce 15 omitted

module_eval(<<'.,.,', 'parser.y', 42)
  def _reduce_16(val, _values)
                      (val[0].to_i * 60 * 60) +
                  (val[2].to_i * 60)
                
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 47)
  def _reduce_17(val, _values)
                      (val[0].to_i * 60 * 60) +
                  (val[2].to_i * 60) +
                  (val[4].to_i)
                
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 54)
  def _reduce_18(val, _values)
                      timezone_string_to_unixtime(val[0])
                
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 59)
  def _reduce_19(val, _values)
                      val
                
  end
.,.,

# reduce 20 omitted

module_eval(<<'.,.,', 'parser.y', 65)
  def _reduce_21(val, _values)
                      val[1]
                
  end
.,.,

# reduce 22 omitted

module_eval(<<'.,.,', 'parser.y', 71)
  def _reduce_23(val, _values)
                      val[1]
                
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 77)
  def _reduce_24(val, _values)
                      join_domain(val[0])
                
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 81)
  def _reduce_25(val, _values)
                      join_domain(val[2])
                
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 85)
  def _reduce_26(val, _values)
                      join_domain(val[0])
                
  end
.,.,

# reduce 27 omitted

module_eval(<<'.,.,', 'parser.y', 91)
  def _reduce_28(val, _values)
                      val[1]
                
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 96)
  def _reduce_29(val, _values)
                      []
                
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 100)
  def _reduce_30(val, _values)
                      val[0].push val[2]
                  val[0]
                
  end
.,.,

# reduce 31 omitted

module_eval(<<'.,.,', 'parser.y', 107)
  def _reduce_32(val, _values)
                      val[1]
                
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 111)
  def _reduce_33(val, _values)
                      val[1]
                
  end
.,.,

# reduce 34 omitted

module_eval(<<'.,.,', 'parser.y', 117)
  def _reduce_35(val, _values)
                      val[1]
                
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 123)
  def _reduce_36(val, _values)
                      val[0].spec
                
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 127)
  def _reduce_37(val, _values)
                      val[0].spec
                
  end
.,.,

# reduce 38 omitted

module_eval(<<'.,.,', 'parser.y', 134)
  def _reduce_39(val, _values)
                      val[1]
                
  end
.,.,

# reduce 40 omitted

# reduce 41 omitted

# reduce 42 omitted

# reduce 43 omitted

# reduce 44 omitted

# reduce 45 omitted

# reduce 46 omitted

module_eval(<<'.,.,', 'parser.y', 146)
  def _reduce_47(val, _values)
     [ Address.new(nil, nil) ] 
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 150)
  def _reduce_48(val, _values)
                      val
                
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 154)
  def _reduce_49(val, _values)
                      val[0].push val[2]
                  val[0]
                
  end
.,.,

# reduce 50 omitted

# reduce 51 omitted

module_eval(<<'.,.,', 'parser.y', 163)
  def _reduce_52(val, _values)
                      val
                
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 167)
  def _reduce_53(val, _values)
                      val[0].push val[2]
                  val[0]
                
  end
.,.,

# reduce 54 omitted

# reduce 55 omitted

module_eval(<<'.,.,', 'parser.y', 175)
  def _reduce_56(val, _values)
                      val[1].phrase = Decoder.decode(val[0])
                  val[1]
                
  end
.,.,

# reduce 57 omitted

module_eval(<<'.,.,', 'parser.y', 183)
  def _reduce_58(val, _values)
                      AddressGroup.new(val[0], val[2])
                
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 185)
  def _reduce_59(val, _values)
     AddressGroup.new(val[0], []) 
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 188)
  def _reduce_60(val, _values)
     val[0].join('.') 
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 189)
  def _reduce_61(val, _values)
     val[0] << ' ' << val[1].join('.') 
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 193)
  def _reduce_62(val, _values)
                      val[2].routes.replace val[1]
                  val[2]
                
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 198)
  def _reduce_63(val, _values)
                      val[1]
                
  end
.,.,

# reduce 64 omitted

module_eval(<<'.,.,', 'parser.y', 203)
  def _reduce_65(val, _values)
     [ val[1].join('.') ] 
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 204)
  def _reduce_66(val, _values)
     val[0].push val[3].join('.'); val[0] 
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 206)
  def _reduce_67(val, _values)
     Address.new( val[0], val[2] ) 
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 207)
  def _reduce_68(val, _values)
     Address.new( val[0], nil ) 
  end
.,.,

# reduce 69 omitted

module_eval(<<'.,.,', 'parser.y', 210)
  def _reduce_70(val, _values)
     val[0].push ''; val[0] 
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 212)
  def _reduce_71(val, _values)
     val 
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 215)
  def _reduce_72(val, _values)
                      dot_count = val[0] + 1
                  dot_count.times do
                    val[1].unshift ''
                  end
                  val[1]
                
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 223)
  def _reduce_73(val, _values)
                      dot_count = val[1] + 1
                  dot_count.times do
                    val[0].push ''
                  end
                  val[0]
                
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 231)
  def _reduce_74(val, _values)
                      val[1].times do
                    val[0].push ''
                  end
                  val[0].push val[2]
                  val[0]
                
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 239)
  def _reduce_75(val, _values)
     val 
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 242)
  def _reduce_76(val, _values)
                      val[1].times do
                    val[0].push ''
                  end
                  val[0].push val[2]
                  val[0]
                
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 249)
  def _reduce_77(val, _values)
     0 
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 250)
  def _reduce_78(val, _values)
     val[0] + 1 
  end
.,.,

# reduce 79 omitted

# reduce 80 omitted

# reduce 81 omitted

# reduce 82 omitted

# reduce 83 omitted

# reduce 84 omitted

# reduce 85 omitted

# reduce 86 omitted

module_eval(<<'.,.,', 'parser.y', 265)
  def _reduce_87(val, _values)
                      val[1] = val[1].spec
                  val.join('')
                
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 269)
  def _reduce_88(val, _values)
     val 
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 270)
  def _reduce_89(val, _values)
     val[0].push val[2]; val[0] 
  end
.,.,

# reduce 90 omitted

module_eval(<<'.,.,', 'parser.y', 273)
  def _reduce_91(val, _values)
     val[0] << ' ' << val[1] 
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 277)
  def _reduce_92(val, _values)
                      val.push nil
                  val
                
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 282)
  def _reduce_93(val, _values)
                      val
                
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 287)
  def _reduce_94(val, _values)
                      [ val[0].to_i, val[2].to_i ]
                
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 292)
  def _reduce_95(val, _values)
                      [ val[0].downcase, val[2].downcase, decode_params(val[3]) ]
                
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 296)
  def _reduce_96(val, _values)
                      [ val[0].downcase, nil, decode_params(val[1]) ]
                
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 301)
  def _reduce_97(val, _values)
                      {}
                
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 305)
  def _reduce_98(val, _values)
                      val[0][ val[2].downcase ] = ('"' + val[4].to_s + '"')
                  val[0]
                
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 310)
  def _reduce_99(val, _values)
                      val[0][ val[2].downcase ] = val[4]
                  val[0]
                
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 315)
  def _reduce_100(val, _values)
                      val[0][ val[2].downcase ] = nil
                  val[0]
                
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 321)
  def _reduce_101(val, _values)
                      val[0].downcase
                
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 326)
  def _reduce_102(val, _values)
                      [ val[0].downcase, decode_params(val[1]) ]
                
  end
.,.,

# reduce 103 omitted

# reduce 104 omitted

# reduce 105 omitted

# reduce 106 omitted

# reduce 107 omitted

# reduce 108 omitted

# reduce 109 omitted

# reduce 110 omitted

# reduce 111 omitted

def _reduce_none(val, _values)
  val[0]
end

  end   # class Parser
  end   # module TMail
