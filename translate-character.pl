#!/usr/bin/perl

use strict;
use warnings;

my $DEBUG = 1;

# Open directory.
# my @directories = ("Sandbox");
my @directories = ("1Kings", "1Samuel", "2Chronicles", "2Kings", "2Samuel", "Daniel", "Deuteronomy", "Exodus", "Ezra", "Genesis", "Isaiah", "Jeremiah", "Joshua", "Judges", "Malachi", "Nehemiah", "Numbers", "Obadiah", "Ruth", "Zephaniah");

foreach ( @directories )
{
    print "Current dir:\t$_\n" if $DEBUG;
    translate($_);
}

sub translate
{
    my $directory = shift;
    opendir DIR, "$directory" or die "Cannot open DIR: $!\n";
    my @files = sort readdir(DIR);

    # Run through each file in open directory translating % to %%.
    while ( my $current_file = shift @files )
    {
        next if $current_file =~ /^\./;
        print "Current file:\t$directory/$current_file\n" if $DEBUG;
        
        open IN, "<$directory/$current_file" or die "Failed to open IN: $!\n";
        open TMP, ">/tmp/translate-character.tmp" or die "Failed to open TMP: $!\n";
        
        while ( <IN> )
        {
            chomp(my $current_line = $_);
            # print "\$_:\t" . $current_line . "\n" if $DEBUG;
            $current_line =~ s/\\begin{enumerate\*}/\\begin{enumerate\*}[mode=unboxed]/;
            # print "cl:\t" . $current_line . "\n" if $DEBUG;
            print TMP $current_line . "\n";
        }
        
        close IN;
        close TMP;
        
        # Read from TMP file, print to original IN file.
        open TMP_IN, "</tmp/translate-character.tmp" or die "Failed to open TMP: $!\n";
        open OUT, ">$directory/$current_file" or die "Failed to open OUT: $!\n";
        
        while ( <TMP_IN> )
        {
            print OUT $_;
        }
        
        close TMP_IN;
        close OUT;
    }

    closedir DIR;
    close IN;
    close OUT;
}
