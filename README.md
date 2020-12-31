# interpreter-pl

An interpreter for a simple programming language written in the Prolog programming language.
<br/>
<br/>
At the moment the language mainly supports arithmetic expressions using a combination of the following symbols "+, -, =, <, >, <=, >=, =:=, =\\=, /, *".
We have added support for brackets "(" and ")" which are correctly interpreted in the usual sense. Simple "if then else"-statements are also supported.
<br/>
<br/>
The Backus-Naur-Form of our language is given as follows:
<br/>
<br/>
\<statement> ::= \<abstract-expression> \<add-op> \<abstract-expression> ";" | \<abstract-expression> ";" | "if" \<bool-expression> "then" \<statement> | "if" \<bool-expression> "then" \<statement> "else" \<statement><br/> 
\<abstract-expression> ::= \<mult-expression> | \<bool-expression><br/>
\<mult-expression> ::= \<expression> \<mult-op> \<expression> | \<expression> <br/>
\<expression> ::= "(" \<statement> ")" | \<digit> +<br/>
\<bool-expression> ::= \<expression> \<bool-op> \<expression><br/>

\<add-op> ::= "+" | "-" <br/>
\<mult-op> ::= "\*" | "\\"<br/>
\<bool-op> ::= "=:=" | "=\\=" | "<=" | ">=" | "<" | ">"  <br/> 
\<digit\> ::= "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" <br/>
## License
### MIT License
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
