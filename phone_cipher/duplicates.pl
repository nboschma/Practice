#! /usr/bin/perl
###################################################################
# Author: Nicholas Boschman
# Date: 1/20/2017
#
# outputs duplicates lines from my phone cipher. only checks the first word
# up the the first while space to see if the line is a duplicate.
#
# Note doesn't output the first occurance of a word with a duplicate encoding
# also doesn't group together duplicates.
#
# Usage: ./duplicate.pl encoded.txt > dups.txt
#
# Note very rough code, that was done quickly. 
#
# Workaround for not outputing the first occurance: run once on the data
# and then append that to the start of the encoded.txt and then run again 
# on the new encoded.txt
#####################################################################
use strict;
use warnings;

sub builddupes($);

my $numArgs = scalar @ARGV;
my %seen;

if ($numArgs != 1) {
	print "expected 2 command line arguments \n";
	exit 0;
}
else {
	my $filenamein = $ARGV[0];
	builddupes($filenamein);
}

sub builddupes($)
{
	my $filenamein = $_[0];
	my $fin;
	my $line;
	my @split;

	open $fin, '<' , $filenamein
		or die "unable to open $filenamein for reading.\n";

	while (<$fin>) {
		$line = $_;
		@split = split / /, $line;
		print if $seen{$split[0]}++;
	}

	close $fin;

}