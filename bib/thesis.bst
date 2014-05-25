%%
%% This is file `hab.bst',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% merlin.mbs  (with options: `,seq-no,nm-init,dt-jnl,yr-par,tit-it,atit-u,jttl-rm,vol-2bf,volp-dt,jpg-1,jnm-x,isbn,blk-com,in-col,ppx,abr,ord,jabr,etal-it,nfss')
%% ----------------------------------------
%%
 %-------------------------------------------------------------------
 % The original source file contains the following version information:
 % \ProvidesFile{merlin.mbs}[1996/05/29 3.8 (PWD)]
 %
 % NOTICE:
 % This file may be used for non-profit purposes.
 % It may not be distributed in exchange for money,
 %   other than distribution costs.
 %
 % The author provides it `as is' and does not guarantee it in any way.
 %
 % Copyright (C) 1994, 1995, 1996 Patrick W. Daly
 %-------------------------------------------------------------------
 %   For use with BibTeX version 0.99a or later
 %-------------------------------------------------------------------
 % This bibliography style file is intended for texts in ENGLISH
 % This is a numerical citation style, and as such is standard LaTeX.
 % It requires no extra package to interface to the main text.
 % The form of the \bibitem entries is
 %   \bibitem{key}...
 % Usage of \cite is as follows:
 %   \cite{key} ==>>          [#]
 %   \cite[chap. 2]{key} ==>> [#, chap. 2]
 % where # is a number determined by the ordering in the reference list.
 % The order in the reference list is that by which the works were originally
 %   cited in the text, or that in the database.
 %---------------------------------------------------------------------

ENTRY
 { address
   author
   booktitle
   chapter
   edition
   editor
   howpublished
   institution
   isbn
   journal
   key
   month
   note
   number
   organization
   pages
   publisher
   school
   series
   title
   type
   volume
   year
   archive
   eprint
   report
   collaboration
 }
 {}
 { label }

INTEGERS { output.state before.all mid.sentence after.sentence after.block }

FUNCTION {init.state.consts}
{ #0 'before.all :=
 #1 'mid.sentence :=
 #2 'after.sentence :=
 #3 'after.block :=
}

STRINGS { s t }

FUNCTION {output.nonnull}
{ 's :=
 output.state mid.sentence =
   { ", " * write$ }
   { output.state after.block =
       { add.period$ write$
         newline$
         "\newblock " write$
       }
       { output.state before.all =
           'write$
           { add.period$ " " * write$ }
         if$
       }
     if$
     mid.sentence 'output.state :=
   }
 if$
 s
}

FUNCTION {output}
{ duplicate$ empty$
   'pop$
   'output.nonnull
 if$
}

FUNCTION {output.check}
{ 't :=
 duplicate$ empty$
   { pop$ "empty " t * " in " * cite$ * warning$ }
   'output.nonnull
 if$
}

FUNCTION {fin.entry}
{ add.period$
 write$
 newline$
}

FUNCTION {new.block}
{ output.state before.all =
   'skip$
   { after.block 'output.state := }
 if$
}

FUNCTION {new.sentence}
{ output.state after.block =
   'skip$
   { output.state before.all =
       'skip$
       { after.sentence 'output.state := }
     if$
   }
 if$
}

FUNCTION {add.blank}
{  " " * before.all 'output.state :=
}

FUNCTION {date.block}
{
 skip$
}

FUNCTION {not}
{   { #0 }
   { #1 }
 if$
}

FUNCTION {and}
{   'skip$
   { pop$ #0 }
 if$
}

FUNCTION {or}
{   { pop$ #1 }
   'skip$
 if$
}

FUNCTION {non.stop}
{ duplicate$
  "}" * add.period$
  #-1 #1 substring$ "." =
}

FUNCTION {new.block.checka}
{ empty$
   'skip$
   'new.block
 if$
}

FUNCTION {new.block.checkb}
{ empty$
 swap$ empty$
 and
   'skip$
   'new.block
 if$
}

FUNCTION {new.sentence.checka}
{ empty$
   'skip$
   'new.sentence
 if$
}

FUNCTION {new.sentence.checkb}
{ empty$
 swap$ empty$
 and
   'skip$
   'new.sentence
 if$
}

FUNCTION {field.or.null}
{ duplicate$ empty$
   { pop$ "" }
   'skip$
 if$
}

FUNCTION {emphasize}
{ duplicate$ empty$
   { pop$ "" }
   { "\emph{" swap$ * "}" * }
 if$
}

FUNCTION {bolden}
{ duplicate$ empty$
   { pop$ "" }
   { "\textbf{" swap$ * "}" * }
 if$
}

FUNCTION {capitalize}
{ "u" change.case$ "t" change.case$ }

FUNCTION {space.word}
{ " " swap$ * " " * }

 % Here are the language-specific definitions for explicit words.
 % Each function has a name bbl.xxx where xxx is the English word.
 % The language selected here is ENGLISH
FUNCTION {bbl.and}
{ "and"}

FUNCTION {bbl.editors}
{ "editors" }

FUNCTION {bbl.editor}
{ "editor" }

FUNCTION {bbl.edby}
{ "edited by" }

FUNCTION {bbl.edition}
{ "edn." }

FUNCTION {bbl.volume}
{ "vol." }

FUNCTION {bbl.of}
{ "of" }

FUNCTION {bbl.number}
{ "no." }

FUNCTION {bbl.nr}
{ "no." }

FUNCTION {bbl.in}
{ "in" }

FUNCTION {bbl.pages}
{ "" }

FUNCTION {bbl.page}
{ "" }

FUNCTION {bbl.chapter}
{ "chap." }

FUNCTION {bbl.techrep}
{ "Tech. Rep." }

FUNCTION {bbl.mthesis}
{ "Master's thesis" }

FUNCTION {bbl.phdthesis}
{ "PhD thesis" }

FUNCTION {bbl.first}
{ "1st" }

FUNCTION {bbl.second}
{ "2nd" }

FUNCTION {bbl.third}
{ "3rd" }

FUNCTION {bbl.fourth}
{ "4th" }

FUNCTION {bbl.fifth}
{ "5th" }

FUNCTION {bbl.st}
{ "st" }

FUNCTION {bbl.nd}
{ "nd" }

FUNCTION {bbl.rd}
{ "rd" }

FUNCTION {bbl.th}
{ "th" }

MACRO {jan} {"Jan."}

MACRO {feb} {"Feb."}

MACRO {mar} {"Mar."}

MACRO {apr} {"Apr."}

MACRO {may} {"May"}

MACRO {jun} {"Jun."}

MACRO {jul} {"Jul."}

MACRO {aug} {"Aug."}

MACRO {sep} {"Sep."}

MACRO {oct} {"Oct."}

MACRO {nov} {"Nov."}

MACRO {dec} {"Dec."}

FUNCTION {eng.ord}
{ duplicate$ "1" swap$ *
 #-2 #1 substring$ "1" =
    { bbl.th * }
    { duplicate$ #-1 #1 substring$
      duplicate$ "1" =
        { pop$ bbl.st * }
        { duplicate$ "2" =
            { pop$ bbl.nd * }
            { "3" =
                { bbl.rd * }
                { bbl.th * }
              if$
            }
          if$
         }
      if$
    }
  if$
}

MACRO {acmcs} {"ACM Comput. Surv."}

MACRO {acta} {"Acta Inf."}

MACRO {cacm} {"Commun. ACM"}

MACRO {ibmjrd} {"IBM J. Res. Dev."}

MACRO {ibmsj} {"IBM Syst.~J."}

MACRO {ieeese} {"IEEE Trans. Softw. Eng."}

MACRO {ieeetc} {"IEEE Trans. Comput."}

MACRO {ieeetcad}
 {"IEEE Trans. Comput.-Aided Design Integrated Circuits"}

MACRO {ipl} {"Inf. Process. Lett."}

MACRO {jacm} {"J.~ACM"}

MACRO {jcss} {"J.~Comput. Syst. Sci."}

MACRO {scp} {"Sci. Comput. Programming"}

MACRO {sicomp} {"SIAM J. Comput."}

MACRO {tocs} {"ACM Trans. Comput. Syst."}

MACRO {tods} {"ACM Trans. Database Syst."}

MACRO {tog} {"ACM Trans. Gr."}

MACRO {toms} {"ACM Trans. Math. Softw."}

MACRO {toois} {"ACM Trans. Office Inf. Syst."}

MACRO {toplas} {"ACM Trans. Prog. Lang. Syst."}

MACRO {tcs} {"Theoretical Comput. Sci."}

INTEGERS { nameptr namesleft numnames }

FUNCTION {format.names}
{ 's :=
 #1 'nameptr :=
 s num.names$ 'numnames :=
 numnames 'namesleft :=
   { namesleft #0 > }
   { s nameptr
     "{f.~}{vv~}{ll}{, jj}" format.name$ 't :=
     nameptr #1 >
       {
         namesleft #1 >
           { ", " * t * }
           {
             numnames #2 >
               { "," * }
               'skip$
             if$
             t "others" =
               { " " * "et~al." emphasize * }
               { bbl.and space.word * t * }
             if$
           }
         if$
       }
       't
     if$
     nameptr #1 + 'nameptr :=
     namesleft #1 - 'namesleft :=
   }
 while$
}

FUNCTION {format.names.ed}
{ 's :=
 #1 'nameptr :=
 s num.names$ 'numnames :=
 numnames 'namesleft :=
   { namesleft #0 > }
   { s nameptr
     "{f.~}{vv~}{ll}{, jj}"
     format.name$ 't :=
     nameptr #1 >
       {
         namesleft #1 >
           { ", " * t * }
           {
             numnames #2 >
               { "," * }
               'skip$
             if$
             t "others" =
               { " " * "et~al." emphasize * }
               { bbl.and space.word * t * }
             if$
           }
         if$
       }
       't
     if$
     nameptr #1 + 'nameptr :=
     namesleft #1 - 'namesleft :=
   }
 while$
}

FUNCTION {format.authors}
{ author empty$
   { "" }
   {
     author format.names
   }
 if$
}


FUNCTION {format.eprint}
{ eprint empty$
    { ""}
    { archive empty$
         {"\href{http://xxx.lanl.gov/abs/" eprint * "}" *
            "{{\tt " * eprint * "}}" *}
         {"\href{http://xxx.lanl.gov/abs/" archive *  "/" * eprint * "}" *
            "{{\tt " * archive * "/" * eprint * "}}" *}
      if$
    }
    if$
}

FUNCTION {format.report}
{ report empty$
    { ""}
    { report}
    if$
}

FUNCTION {format.editors}
{ editor empty$
   { "" }
   {
     editor format.names
     editor num.names$ #1 >
       { ", " * bbl.editors * }
       { ", " * bbl.editor * }
     if$
   }
 if$
}

FUNCTION {format.in.editors}
{ editor empty$
   { "" }
   { editor format.names.ed
     editor num.names$ #1 >
       { ", " * bbl.editors * }
       { ", " * bbl.editor * }
     if$
   }
 if$
}

FUNCTION {format.isbn}
{ isbn empty$
   { "" }
   {
     "ISBN " isbn * }
 if$
}

FUNCTION {format.title}
{ title empty$
   { "" }
   { title
     emphasize
   }
 if$
}

FUNCTION {output.bibitem}
{ newline$
 "\bibitem{" write$
 cite$ write$
 "}" write$
 newline$
 ""
 before.all 'output.state :=
}

FUNCTION {n.dashify}
{ 't :=
 ""
   { t empty$ not }
   { t #1 #1 substring$ "-" =
       { t #1 #2 substring$ "--" = not
           { "--" *
             t #2 global.max$ substring$ 't :=
           }
           {   { t #1 #1 substring$ "-" = }
               { "-" *
                 t #2 global.max$ substring$ 't :=
               }
             while$
           }
         if$
       }
       { t #1 #1 substring$ *
         t #2 global.max$ substring$ 't :=
       }
     if$
   }
 while$
}

FUNCTION {word.in}
{ bbl.in
 ":" *
 " " * }

FUNCTION {format.date}
{ year empty$
   { month empty$
       { "" }
       { "there's a month but no year in " cite$ * warning$
         month
       }
     if$
   }
   { month empty$
       'year
       { month " " * year * }
     if$
   }
 if$
 " (" swap$ * ")" *
}

FUNCTION {format.collaboration}
{ collaboration empty$
   { "" }
   { "" collaboration * "" * }
 if$
}

FUNCTION {format.btitle}
{ title emphasize
}

FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
   { "~" }
   { " " }
 if$
 swap$ * *
}

FUNCTION {either.or.check}
{ empty$
   'pop$
   { "can't use both " swap$ * " fields in " * cite$ * warning$ }
 if$
}

FUNCTION {format.bvolume}
{ volume empty$
   { "" }
   { bbl.volume volume tie.or.space.connect
     series empty$
       'skip$
       { bbl.of space.word * series emphasize * }
     if$
     "volume and number" number either.or.check
   }
 if$
}

FUNCTION {format.number.series}
{ volume empty$
   { number empty$
       { series field.or.null }
       { output.state mid.sentence =
           { bbl.number }
           { bbl.number capitalize }
         if$
         number tie.or.space.connect
         series empty$
           { "there's a number but no series in " cite$ * warning$ }
           { bbl.in space.word * series * }
         if$
       }
     if$
   }
   { "" }
 if$
}

FUNCTION {is.num}
{ chr.to.int$
 duplicate$ "0" chr.to.int$ < not
 swap$ "9" chr.to.int$ > not and
}

FUNCTION {extract.num}
{ duplicate$ 't :=
 "" 's :=
 { t empty$ not }
 { t #1 #1 substring$
   t #2 global.max$ substring$ 't :=
   duplicate$ is.num
     { s swap$ * 's := }
     { pop$ "" 't := }
   if$
 }
 while$
 s empty$
   'skip$
   { pop$ s }
 if$
}

FUNCTION {convert.edition}
{ edition extract.num "l" change.case$ 's :=
 s "first" = s "1" = or
   { bbl.first 't := }
   { s "second" = s "2" = or
       { bbl.second 't := }
       { s "third" = s "3" = or
           { bbl.third 't := }
           { s "fourth" = s "4" = or
               { bbl.fourth 't := }
               { s "fifth" = s "5" = or
                   { bbl.fifth 't := }
                   { s #1 #1 substring$ is.num
                       { s eng.ord 't := }
                       { edition 't := }
                     if$
                   }
                 if$
               }
             if$
           }
         if$
       }
     if$
   }
 if$
 t
}

FUNCTION {format.edition}
{ edition empty$
   { "" }
   { output.state mid.sentence =
       { convert.edition "l" change.case$ " " * bbl.edition * }
       { convert.edition "t" change.case$ " " * bbl.edition * }
     if$
   }
 if$
}

INTEGERS { multiresult }

FUNCTION {multi.page.check}
{ 't :=
 #0 'multiresult :=
   { multiresult not
     t empty$ not
     and
   }
   { t #1 #1 substring$
     duplicate$ "-" =
     swap$ duplicate$ "," =
     swap$ "+" =
     or or
       { #1 'multiresult := }
       { t #2 global.max$ substring$ 't := }
     if$
   }
 while$
 multiresult
}

FUNCTION {format.pages}
{ pages empty$
   { "" }
   { pages multi.page.check
       { bbl.pages pages n.dashify tie.or.space.connect }
       { bbl.page pages tie.or.space.connect }
     if$
   }
 if$
}

FUNCTION {first.page}
{ 't :=
 ""
   {  t empty$ not t #1 #1 substring$ "-" = not and }
   { t #1 #1 substring$ *
     t #2 global.max$ substring$ 't :=
   }
 while$
}

FUNCTION {format.vol.num.pages}
{ volume field.or.null
 number empty$
   'skip$
   {
     "(" number * ")" * *
     volume empty$
       { "there's a number but no volume in " cite$ * warning$ }
       'skip$
     if$
   }
 if$
 bolden
 format.date *
 pages empty$
   'skip$
   { duplicate$ empty$
       { pop$ format.pages }
       { " " * pages first.page * }
     if$
   }
 if$
}

FUNCTION {format.chapter.pages}
{ chapter empty$
   'format.pages
   { type empty$
       { bbl.chapter }
       { type "l" change.case$ }
     if$
     chapter tie.or.space.connect
     pages empty$
       'skip$
       { ", " * format.pages * }
     if$
   }
 if$
}

FUNCTION {format.in.ed.booktitle}
{ booktitle empty$
   { "" }
   { editor empty$
       { word.in booktitle emphasize * }
       { word.in format.in.editors * ", " *
         booktitle emphasize * }
     if$
   }
 if$
}

FUNCTION {empty.misc.check}
{ author empty$ title empty$ howpublished empty$
 month empty$ year empty$ note empty$
 and and and and and
   { "all relevant fields are empty in " cite$ * warning$ }
   'skip$
 if$
}

FUNCTION {format.thesis.type}
{ type empty$
   'skip$
   { pop$
     type "t" change.case$
   }
 if$
}

FUNCTION {format.tr.number}
{ type empty$
   { bbl.techrep }
   'type
 if$
 number empty$
   { "t" change.case$ }
   { number tie.or.space.connect }
 if$
}

FUNCTION {format.article.crossref}
{
 key empty$
   { journal empty$
       { "need key or journal for " cite$ * " to crossref " * crossref *
         warning$
         ""
       }
       { word.in journal emphasize * }
     if$
   }
   { word.in key * " " *}
 if$
 " \cite{" * crossref * "}" *
}

FUNCTION {format.crossref.editor}
{ editor #1 "{vv~}{ll}" format.name$
 editor num.names$ duplicate$
 #2 >
   { pop$ " " * "et~al." emphasize * }
   { #2 <
       'skip$
       { editor #2 "{ff }{vv }{ll}{ jj}" format.name$ "others" =
           { " " * "et~al." emphasize * }
           { bbl.and space.word * editor #2 "{vv~}{ll}" format.name$ * }
         if$
       }
     if$
   }
 if$
}

FUNCTION {format.book.crossref}
{ volume empty$
   { "empty volume in " cite$ * "'s crossref of " * crossref * warning$
     word.in
   }
   { bbl.volume volume tie.or.space.connect
     bbl.of space.word *
   }
 if$
 editor empty$
 editor field.or.null author field.or.null =
 or
   { key empty$
       { series empty$
           { "need editor, key, or series for " cite$ * " to crossref " *
             crossref * warning$
             "" *
           }
           { series emphasize * }
         if$
       }
       { key * }
     if$
   }
   { format.crossref.editor * }
 if$
 " \cite{" * crossref * "}" *
}

FUNCTION {format.incoll.inproc.crossref}
{
 editor empty$
 editor field.or.null author field.or.null =
 or
   { key empty$
       { booktitle empty$
           { "need editor, key, or booktitle for " cite$ * " to crossref " *
             crossref * warning$
             ""
           }
           { word.in booktitle emphasize * }
         if$
       }
       { word.in key * " " *}
     if$
   }
   { word.in format.crossref.editor * " " *}
 if$
 " \cite{" * crossref * "}" *
}

FUNCTION {format.publisher}
{
 publisher "publisher" output.check
 address output
}

FUNCTION {article}
{ output.bibitem
 format.collaboration output
 format.authors "author" output.check
 format.title "title" output.check
 crossref missing$
 { journal missing$
   {}
   { journal
     "journal" output.check
     add.blank
     format.vol.num.pages output
   }
     if$
     report missing$
           {format.eprint output}
           {format.report output format.eprint output}
           if$
   }
   { format.article.crossref output.nonnull
     format.pages output
     format.eprint output
   }
 if$
 note output
 fin.entry
}

FUNCTION {book}
{ output.bibitem
 author empty$
   { format.editors "author and editor" output.check
   }
   { format.authors output.nonnull
     crossref missing$
       { "author and editor" editor either.or.check }
       'skip$
     if$
   }
 if$
 format.btitle "title" output.check
 crossref missing$
   { format.bvolume output
     format.number.series output
     format.publisher
   }
   {
     format.book.crossref output.nonnull
   }
 if$
 format.edition output
 format.pages output
 year "year" output.check
 format.isbn output
 note output
 fin.entry
}

FUNCTION {booklet}
{ output.bibitem
 format.authors output
 format.title "title" output.check
 howpublished output
 address output
 format.date output
 note output
 fin.entry
}

FUNCTION {inbook}
{ output.bibitem
 author empty$
   { format.editors "author and editor" output.check
   }
   { format.authors output.nonnull
     crossref missing$
       { "author and editor" editor either.or.check }
       'skip$
     if$
   }
 if$
 format.btitle "title" output.check
 crossref missing$
   { format.bvolume output
     format.number.series output
     format.publisher
   }
   {
     format.book.crossref output.nonnull
   }
 if$
 format.edition output
 format.isbn output
 year "year" output.check
 date.block
 add.blank
 format.pages "pages" output.check
 note output
 fin.entry
}

FUNCTION {incollection}
{ output.bibitem
 format.authors "author" output.check
 format.title "title" output.check
 crossref missing$
   { format.in.ed.booktitle "booktitle" output.check
     format.bvolume output
     format.number.series output
     format.publisher
     format.edition output
   }
   { format.incoll.inproc.crossref output.nonnull
   }
 if$
 format.isbn output
 year "year" output.check
 date.block
 add.blank
 format.pages "pages" output.check
 note output
 fin.entry
}

FUNCTION {inproceedings}
{ output.bibitem
 format.authors "author" output.check
 format.title "title" output.check
 crossref missing$
   { format.in.ed.booktitle "booktitle" output.check
     format.bvolume output
     format.number.series output
     address empty$
       { organization publisher new.sentence.checkb
         organization output
         publisher output
         format.date "year" output.check
       }
       { address output.nonnull
         format.date "year" output.check
         organization output
         publisher output
       }
     if$
   }
   { format.incoll.inproc.crossref output.nonnull
   }
 if$
 format.isbn output
 year "year" output.check
 date.block
 add.blank
 format.pages "pages" output.check
 note output
 fin.entry
}

FUNCTION {conference} { inproceedings }

FUNCTION {manual}
{ output.bibitem
 author empty$
   { organization empty$
       'skip$
       { organization output.nonnull
         address output
       }
     if$
   }
   { format.authors output.nonnull }
 if$
 format.btitle "title" output.check
 author empty$
   { organization empty$
   {
         address output
       }
       'skip$
     if$
   }
   {
     organization output
     address output
   }
 if$
 format.edition output
 format.date output
 note output
 fin.entry
}

FUNCTION {mastersthesis}
{ output.bibitem
 format.authors "author" output.check
 format.btitle "title" output.check
 bbl.mthesis format.thesis.type output.nonnull
 school "school" output.check
 address output
 format.date "year" output.check
 note output
 fin.entry
}

FUNCTION {misc}
{ output.bibitem
 format.authors output
 format.title output
 howpublished output
% format.date output
 note output
 fin.entry
 empty.misc.check
}

FUNCTION {phdthesis}
{ output.bibitem
 format.authors "author" output.check
 format.btitle "title" output.check
 bbl.phdthesis format.thesis.type output.nonnull
 school "school" output.check
 address output
 year "year" output.check
 note output
 fin.entry
}

FUNCTION {proceedings}
{ output.bibitem
 editor empty$
   { organization output }
   { format.editors output.nonnull }
 if$
 format.btitle "title" output.check
 format.bvolume output
 format.number.series output
 address empty$
   { editor empty$
       { publisher new.sentence.checka }
       { organization publisher new.sentence.checkb
         organization output
       }
     if$
     publisher output
     format.date "year" output.check
   }
   { address output.nonnull
     format.date "year" output.check
     editor empty$
       'skip$
       { organization output }
     if$
     publisher output
   }
 if$
 note output
 fin.entry
}

FUNCTION {techreport}
{ output.bibitem
 format.authors "author" output.check
 format.title "title" output.check
 format.tr.number output.nonnull
 institution "institution" output.check
 address output
 format.date "year" output.check
 note output
 fin.entry
}

FUNCTION {unpublished}
{ output.bibitem
 format.authors "author" output.check
 format.title "title" output.check
 note "note" output.check
 fin.entry
}

FUNCTION {default.type} { misc }

READ

STRINGS { longest.label }

INTEGERS { number.label longest.label.width }

FUNCTION {initialize.longest.label}
{ "" 'longest.label :=
 #1 'number.label :=
 #0 'longest.label.width :=
}

FUNCTION {longest.label.pass}
{ number.label int.to.str$ 'label :=
 number.label #1 + 'number.label :=
 label width$ longest.label.width >
   { label 'longest.label :=
     label width$ 'longest.label.width :=
   }
   'skip$
 if$
}

EXECUTE {initialize.longest.label}

ITERATE {longest.label.pass}

FUNCTION {begin.bib}
{ preamble$ empty$
   'skip$
   { preamble$ write$ newline$ }
 if$
 "\providecommand{\href}[2]{#2}"
 "\begingroup\raggedright\begin{thebibliography}{" * longest.label  *
 "}" * write$ newline$ }

EXECUTE {begin.bib}

EXECUTE {init.state.consts}

ITERATE {call.type$}

FUNCTION {end.bib}
{ newline$
 "\end{thebibliography}\endgroup" write$ newline$
}

EXECUTE {end.bib}
%% End of customized bst file
%%
%% End of file `hab.bst'.