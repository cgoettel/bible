bible
=====

Colby Goettel's translation of the _Biblia Hebraica Stuttgartensia_, typeset in XeTeX.

More information about the translation can be found in the [preface](https://github.com/cgoettel/bible/blob/master/preface.tex).

#Style guide
This style guide is a work in progress. It's an effort to make sure there is consistency throughout this work.

##Appendices
Don't use more than &frac12;&ndash;&frac34;&nbsp;page for a single footnotes, because there should be more information readily accessible to the reader than otherwise. Anything longer than that limit should be placed in an appendix and referenced. However, if the information needs to be said in more than one place, add it to an appendix instead of having every other place refer to that verse.

##Footnote formatting
The `\footnote` command should never be used. There is a specific footnote marking for every season. If, for some reason, there is not, add it.

Footnotes should always come after punctuation, including periods, commas, colons, semi-colons, and quotes, both single and double.

###Alternate and literal readings, explanations, and editorial notes
Match the punctuation and capitalization of the verse to give context. For example:

> LIT number (Gen&nbsp;13:16)

> LIT not numbered from great. (Gen&nbsp;16:10)

> ED Some translations give "stands at," but this verb is not present in L. (Ps&nbsp;45:10)

However, if the footnote is a fragment sentence, do not capitalize the first word (unless a proper noun) and do not conclude with a period.

> in reference to her beauty; easy on the eyes (Ps&nbsp;45:13)

In cases where a fragment sentence is followed by a complete sentence, reword so that only complete sentences are given. A notable exception to this rule is illustrated in the footnote to Ps&nbsp;1:3:

> IE so even in the heat it will grow.

This is not capitalized at the beginning but concluded with a period because it is a complete thought and a continuation of the verse. Additionally, _id est_ is the beginning of the complete sentence. Finally, if there are multiple, comma-separated words in a LIT or ALT at the end of a sentence, separate the words with commas and end with a period, as follows:

> case, lawsuit. (Ex&nbsp;23:3)

When adding an editorial note to a LIT or ALT, begin with the LIT or ALT, then a semi-colon, then the editorial note. For instance,

> from afar.; but this is written from his perspective (Gen&nbsp;22:4)

###Critical apparatus
Always quote the critical apparatus in whole. The explanation should always begin in lowercase (unless a proper noun). It is not necessary to match the punctuation of the critical apparatus when providing a translation, simply write idiomatically.

When explaining, be idiomatic and take a little liberty, but put in brackets anything else. Here's a good guide:

> 𝔊 suff 3 sg

can well be translated and explained:

> the Septuagint has a third singular pronominal suffix [i.e., "his king"]

The last item per page in the critical apparatus ends with a period. Do not include this.

Do not conclude translations and explanations with a period, even when the translation is a complete thought. The only exception is if the translation ends with context-relevant punctuation, as in this example from Ps&nbsp;47:7:

> the Peshitta says "in splendor" [instead of "Praise!"]

Often, the critical apparatus will give excerpts from both the Septuagint and Peshitta. Simply say "the Septuagint and Peshitta" and not "the Septuagint and the Peshitta."

Some Hebrew quotations will be preceded with a strange tick character. Use this: ´. Don't use ``\`{}``.

When a reference is given to a specific manuscript (e.g., a manuscript of the Septuagint), give the Latin name of the manuscript and leave it to the reader to decipher.

Known issues:
- No standard for backtick looking characters that precede Hebrew words.
- No standard for mdashes (ndashes?) that precede Hebrew words.

###Quotations from HALOT
Only provide complete quotations. Match bolding. However, when the material contains abbreviations, spell things out. We're not as interested in saving space as they are. For instance, this excerpt from the entry on נַחֲלָה:

> (inalienable) __hereditary possession__, __heritage__, acquired by individual or family by conquest or inheritance, both property (i.e., [originally "i.e."] land and [originally &] buildings) and \[originally &] (movable) goods

If it's necessary to deviate, put editorial comments in brackets. If only a small part of the reference is needed compared to the amount of editorial comments, it is better to give an editorial footnote and provide quotations from HALOT in quotes with the referenced item following in parentheses. For example:

> ED In HALOT this verb is defined as "[provided definition]" ([referenced word, page number in HALOT]) which is interesting because....

The default assumption is that the definition comes from _A Concise Hebrew and Aramaic Lexicon of the Old Testament_ by Holladay. If references are given from the unabridged HALOT, use the `\halotu` command.

When HALOT uses an mdash, it is always preceded and followed by a space, but not a non-breaking space. For instance,

> __animals__, חַיּוֺת or collective singular, rarely a single animal Gn&nbsp;37<sub>20</sub>: --- 1.\ __animals__ of all kinds, mostly untamed... land animals... beasts of burden... water animals... --- 2. __wild, predatory animals__

##Non-breaking spaces
If a verse reference is a quotation from HALOT, use the `\haref` command and corresponding abbreviation. If it's an editorial reference, use the `\vref` command and corresponding abbreviation.

If there are multiple verses or chapters being referenced in longhand, follow these examples:

- `see verse~13`
- `see further in verses~1 and~2`
- `as it says in verses~13--17 of chapter~5`
- `as seen in verses~12,13, and~14` (stylistic choice, not an incorrect form)

Use the above rules for formatting units (e.g., ft, m, years) as well.

##Numbers and units
Numbers smaller than one hundred should generally be written out in longhand. Larger numbers should be written in Arabic numerals with a `\thinspace` delimiting thousands. However, if a sentence has both large and small values, be consistent, as in:

> The king of Aram said, "Go! I will send a letter to the king of Israel." So he went and took 10&nbsp;talents of silver, 6000&nbsp;gold pieces, and 10&nbsp;changes of clothes with him. (2&nbsp;Kings&nbsp;5:5)

Ages should always be written in Arabic numerals.

Units should be attached to their respective numbers with non-breaking spaces. See examples in [non-breaking spaces](README.md#Non-breaking-spaces).

##Poetry
Sometimes quotations or partial quotations will be typeset as poetry. In this instances, always start as unindented as possible. For instance, see 1&nbsp;Sam~15:22&ndash;23. Here, the first line of poetry is typeset at depth `b` because verse~23 is the least indented so it must be at depth `a`.

##Proper nouns
The following list should be treated as proper nouns and capitalized as follows:
- Ark of the Covenant
- Atonement (but only when referring to the Atonement of Jesus Christ)
- Heaven
- Kadesh-Barne'a. But always differentiate when the text says "Kadesh" instead of "Kadesh-Barne'a".
- Lord of Hosts
- Promised Land
- relevant pronouns (He, Him, Me, My, etc.)
- Tabernacle
- Testimony (when it refers to the Ark of the Covenant)

##Punctuation
When a single quote and double quote must be together, separate them with a `\thinspace`.

##README.md formatting
> Use this style for quotations. Either put the reference before the quote or after (in parentheses).

Use a `&nbsp;` when referencing Biblical books (e.g., `Ps&nbsp;45:18`). Note that no period follows the abbreviated book name.

##References to deity
Always capitalize the proper names of deity. Additionally, always capitalize pronouns referring to God. However, do not capitalize "god" or "gods" when it refers to the gods of other nations, but do capitalize the proper names of foreign gods (e.g., Baal).

When there is ambiguity about a name of a foreign deity (for instance, does Asherah refer to the god of that name or to the consort of another god? Is that god's consort's name, Asherah?) and always leave footnotes explaining the choice that was made, its justification, and a literal rendering of the verse.

##Specific renderings
Use the following rules when rendering non-idiomatic Hebrew:
- children of Israel (instead of sons of Israel, unless only men are being referred to)

##TODO work
Mark all TODO work with `xxxx`, always in lowercase.

Any inconsistencies found should be cataloged in [issue 51](https://github.com/cgoettel/bible/issues/51).

##Why is there a %% at the end of every line?
LaTeX sometimes freaks out and is inconsistent with vertical spacing. Adding a % to the end of each line fixes this problem. However, there are two percent signs at the end of every line because when revise the translation (starting around 2030 (the year)), I will remove one of the percent signs as a signal that that verse/line has been revised. The %% is just long-term planning ahead.

Be sure to include %% even after footnotes in poetry verses.
