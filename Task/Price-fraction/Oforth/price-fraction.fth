[.06, .11, .16, .21, .26, .31, .36, .41, .46, .51, .56, .61, .66, .71, .76, .81, .86, .91, .96, 1.01] const: IN
[.10, .18, .26, .32, .38, .44, .50, .54, .58, .62, .66, .70, .74, .78, .82, .86, .90, .94, .98, 1.00] const: OUT

: priceFraction(f)
| i |
   IN size loop: i [ f IN at(i) < ifTrue: [ OUT at(i) return ] ]
   null ;