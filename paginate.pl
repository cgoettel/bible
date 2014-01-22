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

print OUT "\\section{$book $chapter}\\label{$book $chapter}\n";
print OUT "\\heading{xxxx}\n";
print OUT "\\begin{enumerate}[align=center]\n";

for ( $i = 1; $i <= $total_verses; $i++ )
{
    print OUT "    \\verse{$chapter:$i} %%\n";
}

print OUT "\\end{enumerate}\n";

close OUT;
