! Copyright (C) 2012 Guillermo Alcantara
! See http://factorcode.org/license.txt for BSD license.
!
USING: kernel tools.test locals ideal ideal.ast ;
IN: ideal.tests

! Helper functions
:: ast-with-value ( value -- array )
{ T{ ast-root f V{ T{ ast-send f T{ ast-target f "a" }
                                  T{ ast-symbol f ":=" }
                                  V{ value } }
                  } } } ;

! Test cases
{
    ! Symbols and Basic Send Message
{ "a := #ok" T{ ast-symbol f "ok" } }
    ! Numbers
{ "a := 0" T{ ast-fixnum f 0 } }
{ "a := -1234" T{ ast-fixnum f -1234 } }
{ "a := 678" T{ ast-fixnum f 678 } }
{ "a := 012" T{ ast-fixnum f 10 } }
{ "a := 0x3e" T{ ast-fixnum f 62 } }
{ "a := 0b101" T{ ast-fixnum f 5 } }
{ "a := 1.23" T{ ast-number f 1.23 } }
    ! Regex
    ! Strings
    ! Tables

} [ first2 [ 1array ] [ [ parse-ideal ] curry ] bi*
    unit-test ] each

! ranges
! collections
