! Copyright (C) 2012 Guillermo Alcantara
! See http://factorcode.org/license.txt for BSD license.
USING: kernel peg peg.ebnf peg.parsers math.parser ideal.ast
  strings sequences ;
IN: ideal

! Digit = [0-9] => [[digit> ]]
! Number = (Digit)+ => [[ 10 digits>integer ]]

: join-characters ( chr-Vchr -- str )
  first2 swap prefix >string ;

EBNF: ideal-identifier
Identifier = [a-z] [a-zA-Z0-9]* => [[ join-characters ast-identifier boa ]]
;EBNF

EBNF: ideal-symbol
Symbol = "#" [a-zA-Z0-9?_!-+=/*%$:@]+ => [[ first2 nip >string ast-symbol boa ]]
;EBNF

EBNF: ideal
Space = " " | "\t" | "\n"
Spaces = Space* => [[ ignore ]]
Expression = <foreign ideal-identifier>
Expressions = Expression* => [[ ast-root boa ]]
TopLevel = Expressions Spaces
;EBNF

: parse-ideal ( string -- ast )
  ideal ;
