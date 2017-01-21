#! /usr/bin/perl

###################################################################
# Author: Nicholas Boschman
# Date: 1/20/2017
#
# takes a text file of words seperated by new line charaters and 
# encodes them using a simple phone cipher. 
#
# Usage: ./encode.pl words.txt > encoded.txt
#
# used following linux command to then sort the output
# sort -n unsorted.txt > sorted.txt 
#####################################################################
use strict; 
use warnings;

sub fileconvert($);
sub convert($);
sub letToNum($);

my $numArgs = scalar @ARGV;

if ($numArgs != 1) {
	print "expected 1 command line arguments \n";
	exit 0;
}
else {
	my $filename = $ARGV[0];
	fileconvert($filename);
}

sub fileconvert($)
{
	my $filename = $_[0];
	my $fin;
	my $result;

	open $fin, '<' , $filename
		or die "unable to open $filename for reading.\n";

	#get the every line and convert it with our phone cipher
	while (<$fin>) {
		my $line = $_;
		$line =~ s/[\r\n]+$//; #strip out the endline character
		my $result = convert($line); #convert the line with our phone cipher
		print "$result [$line]\n"; #print a formated result
	}
	close $fin;
}

sub convert($) 
{
	my $word = $_[0];
	my $result = '';
	my $encoding;
	my $length = length ($word);
	for (my $var = 0; $var < length($word); $var++) {
		$encoding = letToNum( substr( $word, $var, 1));
		if (defined $encoding) {
			$result = $result . letToNum( substr( $word, $var, 1));
		}else{
			return "undef";
		}
	}
	return $result;
}

sub letToNum($)
{
	my $let = $_[0];
	if($let eq "a" || $let eq "b" || $let eq "c" ){
		return 2;
	}elsif($let eq "d" || $let eq "e" || $let eq "f" ){
		return 3;
	}elsif($let eq "g" || $let eq "h" || $let eq "i" ){
		return 4;
	}elsif($let eq "j" || $let eq "k" || $let eq "l" ){
		return 5;
	}elsif($let eq "m" || $let eq "n" || $let eq "o" ){
		return 6;
	}elsif($let eq "p" || $let eq "r" || $let eq "s" ){
		return 7;
	}elsif($let eq "t" || $let eq "u" || $let eq "v" ){
		return 8;
	}elsif($let eq "w" || $let eq "x" || $let eq "y" ){
		return 9;
	}else{
		return undef;
	}
	
}