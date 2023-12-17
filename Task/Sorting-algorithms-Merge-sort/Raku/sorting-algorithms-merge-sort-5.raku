say "x" x 10 ~ " Testing " ~ "x" x 10;
use Test;
my @functions-under-test = &mergesort, &mergesort-parallel-naive, &mergesort-parallel;
my @testcases =
		() => (),
		<a>.List => <a>.List,
		<a a> => <a a>,
		("b", "a", 3) => (3, "a", "b"),
		<h b a c d f e g> => <a b c d e f g h>,
		<a 🎮 3 z 4 🐧> => <a 🎮 3 z 4 🐧>.sort
		;

plan @testcases.elems * @functions-under-test.elems;
for @functions-under-test -> &fun {
	say &fun.name;
	is-deeply &fun(.key), .value, .key ~ "  =>  " ~ .value for @testcases;
}
done-testing;
