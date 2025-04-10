main :- 
	read_lines(Lines),     % uses read_lines/1 from input2.pl
    split_lines(Lines, S), % also from input2.pl
    writeln(S),
    halt.
