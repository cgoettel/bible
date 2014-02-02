#!/usr/bin/perl

print "What book are we working on? ";
chomp($book = <>);
$book = ucfirst($book);
# $book = substr($book,0,1) . " " . substr($book,1) if ( $book =~ /^[0-9]/ );
print "Which chapter? ";
chomp($chapter = <>);
print "How many verses are there? ";
chomp($total_verses = <>);

open OUT,">$book/$chapter.tex" or die "Failed to open OUT: $!\n";

print OUT "\\heading{$chapter}{xxxx}\n\n";
print OUT "\\begin{enumerate*}[mode=unboxed]\n";

for ( $i = 1; $i <= $total_verses; $i++ )
{
    print OUT "    \\verse{$chapter:$i} %%\n";
}

print OUT "\\end{enumerate*}\n";

close OUT;
