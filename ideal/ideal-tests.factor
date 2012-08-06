! Copyright (C) 2012 Guillermo Alcantara
! See http://factorcode.org/license.txt for BSD license.
!
USING: kernel tools.test locals ideal ideal.ast ;
IN: ideal.tests

{ T{ ast-identifier f "a" } } [ "a" ideal-identifier ]
    unit-test

[ "1a" ideal-identifier ] must-fail

! Test cases
: ideal-test-suit ( -- )
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

} drop ;

! ranges
! collections
