! Copyright (C) 2012 Guillermo Alcantara
! See http://factorcode.org/license.txt for BSD license.
USING: peg.ebnf peg.parsers math.parser ideal.ast ;
IN: ideal

EBNF: ideal
digit = [0-9] => [[digit> ]]
number = (digit)+ => [[ 10 digits>integer ]]
;EBNF

: parse-ideal ( string -- ast )
  ideal ;
