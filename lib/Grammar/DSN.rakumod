unit grammar Grammar::DSN; 

token TOP { <connection> }
    proto rule connection { * }
    rule connection:sym<sqlite> {^  sqlite  '://' <host> '/' $}
    rule connection:sym<mysql> {^ mysql '://' <authorization> '@' <host> ':' <port> '/' <database> $}
    rule connection:sym<pg> {^  pg | postgres '://' <authorization> '@' <host> ':' <port> '/' <database> $}
  
        token authorization { <user> ':' '"' <password> '"'}
        token user {<-[:"]>+ }
        token password { <-[:"]>+ }
        token host { <-[:/]>+ }
        token port { \d+ }
        token database { <-[/]>+ }
 
