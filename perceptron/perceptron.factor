! Copyright (C) 2011 Guillermo Alcantara
! See http://factorcode.org/license.txt for BSD license.
USING: accessors alien.c-types arrays classes.struct fry
    kernel math math.ranges math.vectors sequences vectors ;
IN: perceptron

TUPLE: weighted-perceptron { perceptron array } { weight integer } ;

: <weighted-perceptron> ( perceptron weight -- weighted-perceptron )
    weighted-perceptron boa ;

TUPLE: training-instance { instance array } { label boolean } ;

! <PRIVATE
! PRIVATE>

: test-perceptron ( instance weighted-perceptron -- vote )
    [ perceptron>> ] [ weight>> ] bi [ v. sgn ] dip * ;

: predict ( instance weighted-perceptron-set -- ? )
    swap '[ _ test-perceptron ] map-sum sgn 1 = ;

: compute-prediction ( instance perceptron -- ? ) v. sgn 1 = ;

: last-knows? ( training-instance weighted-perceptron-set -- ? )
    dupd [ label>> ] [ instance>> ] [ last perceptron>> ] tri* compute-prediction = ;

: increase-weight ( weighted-perceptron-set -- )
    last [ 1 + ] change-weight drop ;

: new-perceptron ( training-instance known-perceptron -- perceptron )
    swap [ instance>> ] [ label>> ] bi v*n v+ ;

: add-perceptron ( training-instance weighted-perceptron-set -- )
    swap '[ _ last perceptron>> new-perceptron 1 <weighted-perceptron> ] keep push ;

: alter-perceptrons ( training-instance weighted-perceptron-set -- )
    2dup last-knows? [ nip increase-weight ] [ add-perceptron ] if ;

: learn ( training-set weighted-perceptron-set -- )
    '[ _ alter-perceptrons ] each ;

: <v0> ( n -- 0 )
    [0,b) [ drop 0 ] map ;

: get-dimension ( training-set -- n )
    last instance>> length ;

: new-weighted-perceptron-set ( training-instance-set -- training-instance-set weighted-perceptron-set )
    dup get-dimension <v0> 0 <weighted-perceptron> 1vector ;

: train ( epochs training-instance-set -- weighted-perceptron-set )
    [ [0,b) ] dip new-weighted-perceptron-set [ [ learn ] keep ] each nip ;
