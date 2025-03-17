unit grammar Grammar::DSN; 
  token TOP {  <connection> }

      proto rule connection { * }
      rule connection:sym<sqlite> {^ $<driver>=<sym> '://' <host> '/' $}
      rule connection:sym<mysql> {^ $<driver>=<sym> '://' <user> ':' '"' <password> '"' '@' <host> ':' <port> '/' <database> $}
      rule connection:sym<pg> {^  $<driver>=<sym> '://' <user> ':' '"' <password> '"' '@' <host> ':' <port> '/' <database> $}
        
          token user {<-[:"]>+ }
          token password { <-[:"]>+ }
          token host { <-[:/]>+ }
          token port { \d+ }
          token database { <-[/]>+ }
