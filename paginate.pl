#!/usr/bin/perl

print "What book are we working on? ";
chomp($book = <>);
$book = ucfirst($book);
# $book = substr($book,0,1) . " " . substr($book,1) if ( $book =~ /^[0-9]/ );
print "Which chapter? ";
chomp($chapter = <>);
print "How many verses are there? ";
chomp($total_verses = <>);

# The append is a fail safe so that if the chapter exists, it's not erased. And yes, I know that you can go into Git and retrieve the old version, but this is easier. And now we don't even have to check for existence. Oh, but Colby, it's only an "if ( -e whatever )". Well whatever.
open OUT,">>$book/$chapter.tex" or die "Failed to open OUT: $!\n";

print OUT "\\heading{$chapter}{xxxx}\n\n";
print OUT "\\begin{inparaenum}\n";

for ( $i = 1; $i <= $total_verses; $i++ )
{
    print OUT "    \\verse{$chapter:$i} %%\n";
}

print OUT "\\end{inparaenum}\n";

close OUT;

print "Adding file to git... ";
`git add $book/$chapter.tex`;
print "done.\n";

print "\nADD FILE TO bible.tex\n";
