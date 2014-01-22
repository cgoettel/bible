#!/usr/bin/perl

use strict;
use warnings;

my $DEBUG = 0;

# Open sandbox directory.
opendir SANDBOX, "sandbox" or die "Cannot open SANDBOX: $!\n";
my @files = sort readdir(SANDBOX);

# Run through each file in open directory translating % to %%.
while ( my $current_file = shift @files )
{
    next if $current_file =~ /^\./;
    print "Current file: " . $current_file . "\n" if $DEBUG;
    
    open IN, "<sandbox/$current_file" or die "Failed to open IN: $!\n";
    open TMP, ">/tmp/translate-character.tmp" or die "Failed to open TMP: $!\n";
    
    while ( <IN> )
    {
        chomp(my $current_line = $_);
        print "\$_:\t" . $current_line . "\n" if $DEBUG;
        $current_line =~ s/\%/\%\%/;
        print "cl:\t" . $current_line . "\n" if $DEBUG;
        print TMP $current_line . "\n";
    }
    
    close IN;
    close TMP;
    
    # Read from TMP file, print to original IN file.
    open TMP_IN, "</tmp/translate-character.tmp" or die "Failed to open TMP: $!\n";
    open OUT, ">sandbox/$current_file" or die "Failed to open OUT: $!\n";
    
    while ( <TMP_IN> )
    {
        print OUT $_;
    }
    
    close TMP_IN;
    close OUT;
}

closedir SANDBOX;
close IN;
close OUT;
