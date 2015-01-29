bible
=====

Colby Goettel's translation of the _Biblia Hebraica Stuttgartensia_, typeset in XeTeX.

#Style guide
This style guide is a work in progress. It's an effort to make sure there is consistency throughout this work.

##Why is there a %% at the end of every line?
LaTeX sometimes freaks out and is inconsistent with vertical spacing. Adding a % to the end of each line fixes this problem. However, there are two percent signs at the end of every line because when revise the translation (starting around 2030 (the year)), I will remove one of the percent signs as a signal that that verse/line has been revised. The %% is just long-term planning ahead.

##Footnote capitalization
###Alternate and literal readings
Match the punctuation and capitalization of the verse to give context. For example:

> LIT number (Gen 13:16)

> LIT not numbered from great. (Gen 16:10)

###Critical apparatus
Always quote the critical apparatus in whole. The explanation should always begin in lowercase (unless a proper noun).

Known issues:
- No standard for backtick looking characters that precede Hebrew words.
- No standard for mdashes (ndashes?) that precede Hebrew words.

When a reference is given to a Septuagint manuscript, give the Latin name of the manuscript and leave it to the reader to decipher.

###Editor's notes
If the footnote is a complete sentence it should be punctuated and capitalized accordingly.

> Some translations give "stands at," but this verb is not present in L. (Ps 45:10)

However, if the footnote is a fragment sentence, do not capitalize the first word (unless a proper noun) and do not conclude with a period.

> in reference to her beauty; easy on the eyes (Ps 45:13)

In cases where a fragment sentence is followed by a complete sentence, reword so that only complete sentences are given.

###Quotations from HALOT
Only provide complete quotations. Match bolding.

If it's necessary to deviate, put editorial comments in brackets. If only a small part of the reference is needed compared to the amount of editorial comments, it is better to give an editorial footnote and provide quotations from HALOT in quotes with the referenced item following in parentheses. For example:

> ED In HALOT this verb is defined as ``[provided definition]'' ([referenced word, page number in HALOT]) which is interesting because....

The default assumption is that the definition comes from _A Concise Hebrew and Aramaic Lexicon of the Old Testament_ by Holladay. If references are given from the unabridged HALOT, use the `\halotu` command.

##Non-breaking spaces
If a verse reference is a quotation from HALOT, use the `\haref` command and corresponding abbreviation. If it's an editorial reference, use the `\vref` command and corresponding abbreviation.

If there are multiple verses or chapters being referenced in longhand, follow these examples:

- `see verse~13`
- `see further in verses~1 and~2`
- `as it says in verses~13--17 of chapter~5`
- `as seen in verses~12,13, and~14` (stylistic choice, not an incorrect form)

##TODO work
Mark all TODO work with `xxxx`, always in lowercase.

Any inconsistencies found should be cataloged in [issue 51](https://github.com/cgoettel/bible/issues/51).
