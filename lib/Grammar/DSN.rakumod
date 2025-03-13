 unit grammar Grammar::DSN; 

    token TOP {^ <driver> '://' [  <user> ':' '"' <password> '"' ]? '@' <host> [':' <port> ]? '/'[<database>]? $}
    token driver {:i sqlite | mysql | pg | postgres} 
    token user { <-[:"]>+ } 
    token password { <-[:"]>+ } 

    token host { <-[:/]>+ } 
    token port { \d+ }
    token database { <-[/]>* } 
 
