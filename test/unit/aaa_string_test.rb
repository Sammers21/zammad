# encoding: utf-8
# rubocop:disable all
require 'test_helper'

class AaaStringTest < ActiveSupport::TestCase

  test 'to_filename ref' do
    modul  = 'test'
    result = 'test'
    modul.to_filename
    assert_equal(result,  modul)

    modul  = 'Some::File'
    result = 'Some::File'
    modul.to_filename
    assert_equal(result,  modul)
  end

  test 'to_filename function' do
    modul  = 'test'
    result = 'test'
    assert_equal(result,  modul.to_filename)

    modul  = 'Some::File'
    result = 'some/file'
    assert_equal(result,  modul.to_filename)
  end

  test 'to_classname ref' do
    modul  = 'test'
    result = 'test'
    modul.to_filename
    assert_equal(result,  modul)

    modul  = 'some/file'
    result = 'some/file'
    modul.to_filename
    assert_equal(result,  modul)
  end

  test 'to_classname function' do
    modul  = 'test'
    result = 'Test'
    assert_equal(result,  modul.to_classname)

    modul  = 'some/file'
    result = 'Some::File'
    assert_equal(result,  modul.to_classname)

    modul  = 'some/files'
    result = 'Some::Files'
    assert_equal(result,  modul.to_classname)

    modul  = 'some_test/files'
    result = 'SomeTest::Files'
    assert_equal(result,  modul.to_classname)
  end

  test 'html2text ref' do
    html   = 'test'
    result = 'test'
    html.html2text
    assert_equal(result,  html)

    html   = '<div>test</div>'
    result = '<div>test</div>'
    html.html2text
    assert_equal(result,  html)
  end

  test 'html2text function' do

    html   = 'test'
    result = 'test'
    assert_equal(result, html.html2text)

    html   = '  test '
    result = 'test'
    assert_equal(result, html.html2text)

    html   = "\n\n  test \n\n\n"
    result = 'test'
    assert_equal(result, html.html2text)

    html   = '<div>test</div>'
    result = 'test'
    assert_equal(result, html.html2text)

    html   = '<div>test<br></div>'
    result = 'test'
    assert_equal(result, html.html2text)

    html   = "<div>test<br><br><br>\n<br>\n<br>\n</div>"
    result = 'test'
    assert_equal(result, html.html2text)

    html   = "<div>test<br><br> <br> \n<br> \n<br> \n</div>"
    result = 'test'
    assert_equal(result, html.html2text)

    html   = "<div>test<br><br>&nbsp;<br>&nbsp;\n<br>&nbsp;\n<br>&nbsp;\n</div>"
    result = 'test'
    assert_equal(result, html.html2text)

    html   = "<div>test<br><br>&nbsp;<br>&nbsp;\n<br>&nbsp;\n<br>&nbsp;\n</div>&nbsp;"
    result = 'test'
    assert_equal(result, html.html2text)

    html   = "<pre>test\n\ntest</pre>"
    result = "test\ntest"
    assert_equal(result, html.html2text)

    html   = "<code>test\n\ntest</code>"
    result = "test\ntest"
    assert_equal(result, html.html2text)

    html   = '<table><tr><td>test</td><td>col</td></td></tr><tr><td>test</td><td>4711</td></tr></table>'
    result = "test col\ntest 4711"
    assert_equal(result, html.html2text)

    html   = "<p><span>Was\nsoll verbessert werden:</span></p>"
    result = 'Was soll verbessert werden:'
    assert_equal(result, html.html2text)

    html = "<!-- some comment -->
    <div>
    test<br><br><br>\n<br>\n<br>\n
    </div>"
    result = 'test'
    assert_equal(result, html.html2text)

    html = "\n<div><a href=\"https://zammad.org\">Best Tool of the World</a>
     some other text</div>
    <div>"
    result = "[1] Best Tool of the Worldsome other text\n\n[1] https://zammad.org"
    assert_equal(result, html.html2text)

    html = "<!-- some comment -->
    <div>
    test<br><br><br>\n<hr/>\n<br>\n
    </div>"
    result = "test\n\n___"
    assert_equal(result, html.html2text)

    html = "test<br><br><br>--<br>abc</div>"
    result = "test\n\n--\nabc"
    assert_equal(result, html.html2text)

    html = "Ihr RZ-Team<br />
<br />
<!--[if gte mso 9]><xml> <o:DocumentProperties>  <o:Author>test</o:Author> =
 <o:Template>A75DB76E.dotm</o:Template>  <o:LastAuthor>test</o:LastAuthor> =
 <o:Revision>5</o:Revision>  <o:Created>2011-05-18T07:08:00Z</o:Created>  <=
o:LastSaved>2011-07-04T17:59:00Z</o:LastSaved>  <o:Pages>1</o:Pages>  <o:Wo=
rds>189</o:Words>  <o:Characters>1192</o:Characters>  <o:Lines>9</o:Lines> =
 <o:Paragraphs>2</o:Paragraphs>  <o:CharactersWithSpaces>1379</o:Characters=
WithSpaces>  <o:Version>11.5606</o:Version> </o:DocumentProperties></xml><!=
[endif]-->"
    result = 'Ihr RZ-Team'
    assert_equal(result, html.html2text)

html = '<html>
<head>
<title>Neues Fax von 1234-93900</title>
</head>
<body style="margin: 0px;padding: 0px;font-family: Arial, sans-serif;font-size: 12px;">
<table cellpadding="0" cellspacing="0" width="100%" height="100%" bgcolor="#d9e7f0" id="mailbg" style="empty-cells:show;font-size: 12px;line-height: 18px;color: #000000;font-family: Arial, sans-serif;width: 100%;height: 100%;background-color: #d9e7f0;padding: 0px;margin: 0px;">
<tr>
<td valign="top">
<center>
<br><br>
<table width="560" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" id="mailcontainer" style="empty-cells:show;font-size: 12px;line-height: 18px;color: #000000;font-family: Arial, sans-serif;width: 560px;margin: 0px auto;padding: 0px;background-color: #FFFFFF;">
<tr>
<td colspan="3" width="560" id="mail_header" valign="top" style="width: 560px;background-color: #FFFFFF;font-family: Arial, sans-serif;color: #000000;padding: 0px;margin: 0px;">
<table width="560" cellpadding="0" cellspacing="0" style="empty-cells:show;font-size: 12px;line-height: 18px;color: #000000;font-family: Arial, sans-serif;">
<tr>
<td height="10" colspan="4" style="font-size:0px;line-height: 0px;padding:0px;height:10px;"><img src="http://www.example.docm/static/example.docm/mailtemplates/de_DE/team/img/tpl_header.gif" style="padding: 0px;margin: 0px;"></td>
</tr>
<tr>
<td height="12" colspan="4"><span style="font-size:0px;line-height:0px;"> </span></td>
</tr>
<tr>
<td height="27" width="30"> </td>
<td height="27" width="397"><span class="mailtitle" style="font-family: Arial, sans-serif;color: #000000;font-size: 18px;line-height: 18px;font-weight: normal;">Neues Fax</span></td>
<td height="27" width="103"><img src="http://www.example.docm/static/example.docm/mailtemplates/de_DE/team/img/tpl_logo-example.gif" style="padding: 0px;margin: 0px;"></td>
<td height="27" width="30"></td>
</tr>
<tr>
<td height="20" colspan="4"><span style="font-size:0px;line-height:0px;"> </span></td>
</tr>
<tr>
<td height="1" colspan="4" style="font-size:0px;line-height: 0px;padding:0px;"><img src="http://www.example.docm/static/example.docm/mailtemplates/de_DE/team/img/tpl_line-grey.gif" style="padding: 0px;margin: 0px;"></td>
</tr>
</table>
</td>
</tr>
<tr>
<td colspan="3" width="560"> </td>
</tr>
<tr>
<td width="30"> </td>
<td width="500" height="30" valign="middle" align="right"><span class="accountno" style="font-family: Arial, sans-serif;font-size: 10px;color: #666666;">Ihre Kundennummer: 12345678</span></td>
<td width="30"> </td>
</tr>'
    result = 'Neues Fax von 1234-93900

 Neues Fax

 Ihre Kundennummer: 12345678'
    assert_equal(result, html.html2text)

    html = ' line&nbsp;1<br>
you<br/>
-----&amp;'
    should = 'line 1
you
-----&'
    assert_equal( should, html.html2text)

    html = ' <ul><li>#1</li><li>#2</li></ul>'
    should = '* #1
* #2'
    assert_equal( should, html.html2text)

    html = '<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <head>
  <body style="font-family:Geneva,Helvetica,Arial,sans-serif; font-size: 12px;">
    <div>&gt; Welcome!</div><div>&gt;</div><div>&gt; Thank you for installing Zammad.</div><div>&gt;</div>
  </body>
</html>'
    should = '> Welcome!
>
> Thank you for installing Zammad.
>'
    assert_equal( should, html.html2text)

    html = '      <style type="text/css">
    body {
      width:90% !important;
      -webkit-text-size-adjust:90%;
      -ms-text-size-adjust:90%;
      font-family:\'helvetica neue\', helvetica, arial, geneva, sans-serif; f=
ont-size: 12px;;
    }
    img {
      outline:none; text-decoration:none; -ms-interpolation-mode: bicubic;
    }
    a img {
      border:none;
    }
    table td {
      border-collapse: collapse;
    }
    table {
      border-collapse: collapse; mso-table-lspace:0pt; mso-table-rspace:0pt;
    }
    p, table, div, td {
      max-width: 600px;
    }
    p {
      margin: 0;
    }
    blockquote, pre {
      margin: 0px;
      padding: 8px 12px 8px 12px;
    }

    </style><p>some other content</p>'
    should = 'some other content'
    assert_equal( should, html.html2text)

    html = '        IT-Infrastruktur</span><br>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="Generator" content="Microsoft Word 14 (filtered
        medium)">
      <!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]-->
      <style><!--

@font-face
    {font-family:calibri;
    panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
    {font-family:tahoma;
    panose-1:2 11 6 4 3 5 4 4 2 4;}

p.msonormal, li.msonormal, div.msonormal
    {margin:0cm;
    margin-bottom:.0001pt;
    font-size:11.0pt;
    font-family:"calibri","sans-serif";
    mso-fareast-language:en-us;}
a:link, span.msohyperlink
    {mso-style-priority:99;
    color:blue;
    text-decoration:underline;}
a:visited, span.msohyperlinkfollowed
    {mso-style-priority:99;
    color:purple;
    text-decoration:underline;}
p.msoacetate, li.msoacetate, div.msoacetate
    {mso-style-priority:99;
    mso-style-link:"sprechblasentext zchn";
    margin:0cm;
    margin-bottom:.0001pt;
    font-size:8.0pt;
    font-family:"tahoma","sans-serif";
    mso-fareast-language:en-us;}
span.e-mailformatvorlage17
    {mso-style-type:personal;
    font-family:"calibri","sans-serif";
    color:windowtext;}
span.sprechblasentextzchn
    {mso-style-name:"sprechblasentext zchn";
    mso-style-priority:99;
    mso-style-link:sprechblasentext;
    font-family:"tahoma","sans-serif";}
.msochpdefault
    {mso-style-type:export-only;
    font-family:"calibri","sans-serif";
    mso-fareast-language:en-us;}
@page wordsection1
    {size:612.0pt 792.0pt;
    margin:70.85pt 70.85pt 2.0cm 70.85pt;}
div.wordsection1
    {page:wordsection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->'
    should = 'IT-Infrastruktur'
    assert_equal( should, html.html2text)

    html = "<h1>some head</h1>
    some content
    <blockquote>
    <p>line 1</p>
    <p>line 2</p>
    </blockquote>
    <p>some text later</p>"
    result = 'some head
some content
> line 1
> line 2

some text later'
    assert_equal(result, html.html2text)

    html = "<h1>some head</h1>
    some content
    <blockquote>
    line 1<br/>
    line 2<br>
    </blockquote>
    <p>some text later</p>"
    result = 'some head
some content
> line 1
> line 2

some text later'
    assert_equal(result, html.html2text)

    html = "<h1>some head</h1>
    some content
    <blockquote>
    <div><div>line 1</div><br></div>
    <div><div>line 2</div><br></div>
    </blockquote>
    some text later"
    result = 'some head
some content
> line 1
>
> line 2
some text later'
    assert_equal(result, html.html2text)

    html   = "<p>Best regards,</p>
<p><i>Your Team Team</i></p>
<p>P.S.: You receive this e-mail because you are listed in our database as person who ordered a Team license. Please click <a href=\"http://www.teamviewer.example/en/company/unsubscribe.aspx?id=1009645&ident=xxx\">here</a> to unsubscribe from further e-mails.</p>
-----------------------------
<br />"
    result = 'Best regards,
Your Team Team
P.S.: You receive this e-mail because you are listed in our database as person who ordered a Team license. Please click [1] here to unsubscribe from further e-mails.
-----------------------------

[1] http://www.teamviewer.example/en/company/unsubscribe.aspx?id=1009645&ident=xxx'
    assert_equal(result, html.html2text)

    html   = "<div><br>Dave and leaned her
days adam.</div><span style=\"color:#F7F3FF; font-size:8px\">Maybe we
want any help me that.<br>Next morning charlie saw at their
father.<br>Well as though adam took out here. Melvin will be more money. 
Called him into this one last thing.<br>Men-----------------------
<br />"
    result = 'Dave and leaned her days adam.
Maybe we want any help me that.
Next morning charlie saw at their father.
Well as though adam took out here. Melvin will be more money. Called him into this one last thing.
Men-----------------------'
    assert_equal(result, html.html2text)

  end

  test 'html2html_strict function' do

    html   = 'test'
    result = 'test'
    assert_equal(result, html.html2html_strict)

    html   = '  test '
    result = 'test'
    assert_equal(result, html.html2html_strict)

    html   = "\n\n  test \n\n\n"
    result = 'test'
    assert_equal(result, html.html2html_strict)

    html   = '<b>test</b>'
    result = '<b>test</b>'
    assert_equal(result, html.html2html_strict)

    html   = '<B>test</B>'
    result = '<b>test</b>'
    assert_equal(result, html.html2html_strict)

    html   = '<i>test</i>'
    result = '<i>test</i>'
    assert_equal(result, html.html2html_strict)

    html   = '<h1>test</h1>'
    result = '<h1>test</h1>'
    assert_equal(result, html.html2html_strict)

    html   = '<h2>test</h2>'
    result = '<h2>test</h2>'
    assert_equal(result, html.html2html_strict)

    html   = '<h3>test</h3>'
    result = '<h3>test</h3>'
    assert_equal(result, html.html2html_strict)

    html   = '<h3>test</h3><!-- some comment -->'
    result = '<h3>test</h3>'
    assert_equal(result, html.html2html_strict)

    html   = "<div>\n\n\ntest\n\n\n</div>"
    result = "<div>test</div>"
    assert_equal(result, html.html2html_strict)

    html   = "<div>\n\t\ntest\n\t\n</div>"
    result = "<div>test</div>"
    assert_equal(result, html.html2html_strict)

    html   = "<div>\n\t\ntest  123\n\t\n</div>"
    result = "<div>test 123</div>"
    assert_equal(result, html.html2html_strict)

    html   = "<div><p> </p><p> </p></div>"
    result = "<div>
<p>&nbsp;</p>
</div>"
    assert_equal(result, html.html2html_strict)

    html   = "<div><div> </div><div> </div></div>"
    result = "<div>\n<div> </div></div>"
    assert_equal(result, html.html2html_strict)

    html   = "<div><div> </div><div> </div><div> </div></div>"
    result = "<div>\n<div> </div></div>"
    assert_equal(result, html.html2html_strict)

    html   = "<div>
<br> <br> </div>"
    result = "<div> </div>"
    assert_equal(result, html.html2html_strict)

    html = '<div>
<br> <p><b>Description</b></p>
<br> <br> </div>'
    result = '<div>
<br> <p><b>Description</b></p>
<br> <br> </div>'
    assert_equal(result, html.html2html_strict)

    html = '<div>
<br> <p><b>Description</b></p>
<br> <br> <br> </div>'
    result = '<div>
<br> <p><b>Description</b></p><br><br></div>'
    assert_equal(result, html.html2html_strict)

    html = '<p>&nbsp;</p><br><br><p>&nbsp;</p>'
    result = '<p>&nbsp;</p><p>&nbsp;</p>'
    assert_equal(result, html.html2html_strict)

    html   = "<pre>a\nb\nc</pre>"
    result = "<pre>a\nb\nc</pre>"
    assert_equal(result, html.html2html_strict)

    html   = "<div><pre>a\nb\nc</pre></div>"
    result = "<div><pre>a\nb\nc</pre></div>"
    assert_equal(result, html.html2html_strict)

    html   = '<div class="WordSection1">
<p class="MsoNormal"><span style="color:#1F497D">Guten Morgen, Frau Koppenhagen,<o:p></o:p></span></p>
<p class="MsoNormal"><span style="color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class="MsoNormal"><span style="color:#1F497D">vielen Dank für die Reservierung. Dabei allerdings die Sprache (Niederländisch) nicht erwähnt. Können Sie bitte dieses in Ihrer Reservierung vormerken?<o:p></o:p></span></p>
<p class="MsoNormal"><span style="color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class="MsoNormal"><span style="color:#1F497D">Nochmals vielen Dank und herzliche Grüße
<o:p></o:p></span></p>
<div>'

    result = '<div>
<p>Guten Morgen, Frau Koppenhagen,</p>
<p>&nbsp;</p>
<p>vielen Dank für die Reservierung. Dabei allerdings die Sprache (Niederländisch) nicht erwähnt. Können Sie bitte dieses in Ihrer Reservierung vormerken?</p>
<p>&nbsp;</p>
<p>Nochmals vielen Dank und herzliche Grüße</p>
<div></div>
</div>'
    assert_equal(result, html.html2html_strict)

    html   = '<a href="http://example.com">http://example.com</a>'
    result = '<a href="http://example.com" rel="nofollow" target="_blank">http://example.com</a>'
    assert_equal(result, html.html2html_strict)

    html   = '<A href="http://example.com?a=1;">http://example.com?a=1;</A>'
    result = '<a href="http://example.com?a=1;" rel="nofollow" target="_blank">http://example.com?a=1;</a>'
    assert_equal(result, html.html2html_strict)

    html   = '<a href="http://web.de">web.de</a>'
    result = '<a href="http://web.de" rel="nofollow" target="_blank">web.de</a>'
    assert_equal(result, html.html2html_strict)

    html   = '<a id="123" href="http://web.de">web.de</a>'
    result = '<a href="http://web.de" rel="nofollow" target="_blank">web.de</a>'
    assert_equal(result, html.html2html_strict)

    html   = '<div>https://www.facebook.com/test</div>'
    result = '<div><a href="https://www.facebook.com/test" rel="nofollow" target="_blank">https://www.facebook.com/test</a>
</div>'
    assert_equal(result, html.html2html_strict)

    html   = '<div><br>https://www.facebook.com/test<br></div>'
    result = '<div>
<br><a href="https://www.facebook.com/test" rel="nofollow" target="_blank">https://www.facebook.com/test</a><br>
</div>'
    assert_equal(result, html.html2html_strict)

    html   = 'some text http://example.com some other text'
    result = 'some text <a href="http://example.com" rel="nofollow" target="_blank">http://example.com</a> some other text'
    assert_equal(result, html.html2html_strict)

    html   = 'some text www.example.com some other text'
    result = 'some text <a href="http://www.example.com" rel="nofollow" target="_blank">http://www.example.com</a> some other text'
    assert_equal(result, html.html2html_strict)

    html   = '<a href="http://example.com">http://what-different.example.com</a>'
    #result = 'http://example.com (<a href="http://what-different.example.com" rel="nofollow" target="_blank">http://what-different.example.com</a>)'
    result = '<a href="http://what-different.example.com" rel="nofollow" target="_blank">http://what-different.example.com</a> (<a href="http://example.com" rel="nofollow" target="_blank">http://example.com</a>)'
    assert_equal(result, html.html2html_strict)

    html   = '<a href="http://example.com">http://EXAMPLE.com</a>'
    result = '<a href="http://example.com" rel="nofollow" target="_blank">http://EXAMPLE.com</a>'
    assert_equal(result, html.html2html_strict)

    html   = '<a href="http://example.com" class="abc">http://example.com</a>'
    result = '<a href="http://example.com" rel="nofollow" target="_blank">http://example.com</a>'
    assert_equal(result, html.html2html_strict)

    html   = '<a href="http://example.com/" class="abc">http://example.com</a>'
    result = '<a href="http://example.com/" rel="nofollow" target="_blank">http://example.com</a>'
    assert_equal(result, html.html2html_strict)

    html   = "<a href=\"http://example.com/\n\" class=\"abc\">http://example.com</a>"
    result = '<a href="http://example.com/" rel="nofollow" target="_blank">http://example.com</a>'
    assert_equal(result, html.html2html_strict)

    html   = "<a href=\"http://example.com/\n \" class=\"abc\n\"\n>http://example.com</a>"
    result = '<a href="http://example.com/" rel="nofollow" target="_blank">http://example.com</a>'
    assert_equal(result, html.html2html_strict)

    html   = "<div>http://example.com</div>"
    result = "<div><a href=\"http://example.com\" rel=\"nofollow\" target=\"_blank\">http://example.com</a>\n</div>"
    assert_equal(result, html.html2html_strict)

    html   = "<div>http://example.com.</div>"
    result = "<div><a href=\"http://example.com\" rel=\"nofollow\" target=\"_blank\">http://example.com</a>.</div>"
    assert_equal(result, html.html2html_strict)

    html   = "<div>lala http://example.com.</div>"
    result = '<div>lala <a href="http://example.com" rel="nofollow" target="_blank">http://example.com</a>.</div>'
    assert_equal(result, html.html2html_strict)

    html   = "<div>http://example.com, and so on</div>"
    result = "<div><a href=\"http://example.com\" rel=\"nofollow\" target=\"_blank\">http://example.com</a>, and so on</div>"
    assert_equal(result, html.html2html_strict)

    html   = "<div>http://example.com?lala=me, and so on</div>"
    result = "<div><a href=\"http://example.com?lala=me\" rel=\"nofollow\" target=\"_blank\">http://example.com?lala=me</a>, and so on</div>"
    assert_equal(result, html.html2html_strict)

    html   = "<a href=\"http://facebook.de/examplesrbog\"><span lang=\"EN-US\" style='color:blue'>http://facebook.de/examplesrbog</span></a>"
    #result = "<a href=\"http://facebook.de/examplesrbog\" rel=\"nofollow\" target=\"_blank\"><span lang=\"EN-US\">http://facebook.de/examplesrbog</span></a>"
    result = "<a href=\"http://facebook.de/examplesrbog\" rel=\"nofollow\" target=\"_blank\">http://facebook.de/examplesrbog</a>"
    assert_equal(result, html.html2html_strict)

    html   = "Damit Sie keinen Tag versäumen, empfehlen wir Ihnen den <a href=\"http://newsletters.cylex.de/\" class=\"\">Link des Adventkalenders</a> in<br class=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ihrer Lesezeichen-Symbolleiste zu ergänzen.</p><div class=\"\">&nbsp;"
    result = "Damit Sie keinen Tag versäumen, empfehlen wir Ihnen den Link des Adventkalenders (<a href=\"http://newsletters.cylex.de/\" rel=\"nofollow\" target=\"_blank\">http://newsletters.cylex.de/</a>) in<br> Ihrer Lesezeichen-Symbolleiste zu ergänzen.<div> </div>"
    assert_equal(result, html.html2html_strict)

    html   = "<div>
abc<p><b>Von:</b> Fritz Bauer [mailto:me@example.com] <br><b>Gesendet:</b> Donnerstag, 3. Mai 2012 11:51<br><b>An:</b> John Smith<br><b>Cc:</b> Smith, John Marian; johnel.fratczak@example.com; ole.brei@example.com; Günther John | Example GmbH; bkopon@example.com; john.heisterhagen@team.example.com; sven.rocked@example.com; michael.house@example.com; tgutzeit@example.com<br><b>Betreff:</b> Re: OTRS::XXX Erweiterung - Anhänge an CI's </p></div>"
    result = "<div>abc<span class=\"js-signatureMarker\"></span><p><b>Von:</b> Fritz Bauer [mailto:me@example.com] <br><b>Gesendet:</b> Donnerstag, 3. Mai 2012 11:51<br><b>An:</b> John Smith<br><b>Cc:</b> Smith, John Marian; johnel.fratczak@example.com; ole.brei@example.com; Günther John | Example GmbH; bkopon@example.com; john.heisterhagen@team.example.com; sven.rocked@example.com; michael.house@example.com; tgutzeit@example.com<br><b>Betreff:</b> Re: OTRS::XXX Erweiterung - Anhänge an CI's </p>\n</div>"
    assert_equal(result, html.html2html_strict)

    html   = "<div> abc<p> <b>Von:</b> Fritz Bauer [mailto:me@example.com] <br><b>Gesendet:</b> Donnerstag, 3. Mai 2012 11:51<br><b>An:</b> John Smith<br><b>Cc:</b> Smith, John Marian; johnel.fratczak@example.com; ole.brei@example.com; Günther John | Example GmbH; bkopon@example.com; john.heisterhagen@team.example.com; sven.rocked@example.com; michael.house@example.com; tgutzeit@example.com<br><b>Betreff:</b> Re: OTRS::XXX Erweiterung - Anhänge an CI's </p></div>"
    result = "<div>abc<span class=\"js-signatureMarker\"></span><p> <b>Von:</b> Fritz Bauer [mailto:me@example.com] <br><b>Gesendet:</b> Donnerstag, 3. Mai 2012 11:51<br><b>An:</b> John Smith<br><b>Cc:</b> Smith, John Marian; johnel.fratczak@example.com; ole.brei@example.com; Günther John | Example GmbH; bkopon@example.com; john.heisterhagen@team.example.com; sven.rocked@example.com; michael.house@example.com; tgutzeit@example.com<br><b>Betreff:</b> Re: OTRS::XXX Erweiterung - Anhänge an CI's </p>\n</div>"
    assert_equal(result, html.html2html_strict)

    html   = "<div> abc<p> <b>Von:</b> Fritz Bauer [mailto:me@example.com] <br><b>Gesendet:</b> Donnerstag, 3. Mai 2012 11:51<br><b>An:</b> John Smith<br><b>Cc:</b> Smith, John Marian; johnel.fratczak@example.com; ole.brei@example.com; Günther John | Example GmbH; bkopon@example.com; john.heisterhagen@team.example.com; sven.rocked@example.com; michael.house@example.com; tgutzeit@example.com<br><b>Betreff:</b> Re: OTRS::XXX Erweiterung - Anhänge an CI's </p> </div>"
    result = "<div>abc<span class=\"js-signatureMarker\"></span><p> <b>Von:</b> Fritz Bauer [mailto:me@example.com] <br><b>Gesendet:</b> Donnerstag, 3. Mai 2012 11:51<br><b>An:</b> John Smith<br><b>Cc:</b> Smith, John Marian; johnel.fratczak@example.com; ole.brei@example.com; Günther John | Example GmbH; bkopon@example.com; john.heisterhagen@team.example.com; sven.rocked@example.com; michael.house@example.com; tgutzeit@example.com<br><b>Betreff:</b> Re: OTRS::XXX Erweiterung - Anhänge an CI's </p>\n</div>"
    assert_equal(result, html.html2html_strict)

    html = "<div style=\"margin-top: 0cm; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; \"><span style=\"font-size: 10pt; font-family: Arial, sans-serif; \">Mit freundlichem Gruß<span class=\"Apple-converted-space\">&nbsp;</span><br><br>John Smith<br>Service und Support<br><br>Example Service AG &amp; Co.<o:p></o:p></span></div><div style=\"margin-top: 0cm; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; \"><span style=\"font-size: 10pt; font-family: Arial, sans-serif; \">Management OHG<br>Someware-Str. 4<br>xxxxx Someware<br><br></span><span style=\"font-size: 10pt; font-family: Arial, sans-serif; \"><o:p></o:p></span></div><div style=\"margin-top: 0cm; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; \"><span style=\"font-size: 10pt; font-family: Arial, sans-serif; \">Tel.: +49 001 7601 462<br>Fax: +49 001 7601 472</span><span style=\"font-size: 10pt; font-family: Arial, sans-serif; \"><o:p></o:p></span></div><div style=\"margin-top: 0cm; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; \"><span style=\"font-size: 10pt; font-family: Arial, sans-serif; \"><a href=\"mailto:john.smith@example.com\" style=color: blue; text-decoration: underline; \">john.smith@example.com</a></span><span style=\"font-size: 10pt; font-family: Arial, sans-serif; \"><o:p></o:p></span></div><div style=\"margin-top: 0cm; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; \"><span style=\"font-size: 10pt; font-family: Arial, sans-serif; \"><a href=http://www.example.com\" style=\"color: blue; text-decoration: underline; \">www.example.com</a></span><span style=\"font-size: 10pt; font-family: Arial, sans-serif; \"><o:p></o:p></span></div>"
    result = "<div>Mit freundlichem Gruß<br><br>John Smith<br>Service und Support<br><br>Example Service AG &amp; Co.</div><div>Management OHG<br>Someware-Str. 4<br>xxxxx Someware<br><br>\n</div><div>Tel.: +49 001 7601 462<br>Fax: +49 001 7601 472</div><div>john.smith@example.com</div><div><a href=\"http://www.example.com\" rel=\"nofollow\" target=\"_blank\">http://www.example.com</a> (<a href=\"http://www.example.com%22\" rel=\"nofollow\" target=\"_blank\">http://www.example.com\"</a>)</div>"
    assert_equal(result, html.html2html_strict)

    html   = '<b >test</b>'
    result = '<b>test</b>'
    assert_equal(result, html.html2html_strict)

    html   = '<b >test</b >'
    result = '<b>test</b>'
    assert_equal(result, html.html2html_strict)

    html   = '<b >test< /b >'
    result = '<b>test&lt; /b &gt;</b>'
    assert_equal(result, html.html2html_strict)

    html   = "<b\n>test<\n/b>"
    result = "<b>test&lt; /b&gt;</b>"
    assert_equal(result, html.html2html_strict)

    html   = '<table>
<tr>
<td bgcolor=white><font size=2 face="sans-serif"><b>Franz Schäfer</b></font>
<tr>
<td bgcolor=white><font size=2 face="sans-serif">Manager Information Systems</font></table>
<br>
<table>
<tr>
<td bgcolor=white><font size=2 face="sans-serif">Telefon &nbsp;</font>
<td bgcolor=white><font size=2 face="sans-serif">+49 000 000 8565</font>
<tr>
<td colspan=2 bgcolor=white><font size=2 face="sans-serif">christian.schaefer@example.com</font></table>
<br>
<table>'
    result = "<b>Franz Schäfer</b><br><br><br><br>Telefon\n+49 000 000 8565<br>\nchristian.schaefer@example.com<br><br><br>"
    result = '<b>Franz Schäfer</b>
<br>
Manager Information Systems <br>
<br>
Telefon 
+49 000 000 8565
<br>
christian.schaefer@example.com'
    assert_equal(result, html.html2html_strict)

    html   = "<b id=123 classs=\"\nsome_class\">test</b>"
    result = '<b>test</b>'
    assert_equal(result, html.html2html_strict)

    html   = "<b id=123 classs=\"\nsome_class\"\n>test<\n/b>"
    result = "<b>test&lt; /b&gt;</b>"
    assert_equal(result, html.html2html_strict)

    html   = "<ul id=123 classs=\"\nsome_class\"\n><li>test</li>\n<li class=\"asasd\">test</li><\n/ul>"
    result = "<ul>\n<li>test</li>\n<li>test</li>&lt; /ul&gt;</ul>"
    assert_equal(result, html.html2html_strict)

    html   = '<div><div>Hello Martin,</div></div>'
    result = '<div>Hello Martin,</div>'
    assert_equal(result, html.html2html_strict)

    html   = '<div lang="DE"><div><div>Hello Martin,</div></div></div>'
    result = '<div>Hello Martin,</div>'
    assert_equal(result, html.html2html_strict)

    html   = '<div lang="DE"><div><div>Hello Martin,</div> </div></div>'
    result = "<div>\n<div>Hello Martin,</div>\n</div>"
    assert_equal(result, html.html2html_strict)

    html   = '<span></span>'
    result = ''
    assert_equal(result, html.html2html_strict)

    html   = '<br><br><div>abc</div>'
    result = '<div>abc</div>'
    assert_equal(result, html.html2html_strict)

    html   = '<div>abc</div><br> <br>'
    result = '<div>abc</div>'
    assert_equal(result, html.html2html_strict)

    html   = '<div style="max-width: 600px;"><br><br><br></div>'
    result = '<div> </div>'
    assert_equal(result, html.html2html_strict)

    html   = '<div style="max-width: 600px;"><br>abc<br><br></div>'
    result = '<div>
<br>abc<br><br>
</div>'
    assert_equal(result, html.html2html_strict)

    html   = '<p> </p><p> </p><p> </p>'
    result = '<p>&nbsp;</p>'
    assert_equal(result, html.html2html_strict)

    html   = '<div><p> </p>
<p> </p>
<p> </p>
</div>'
    result = '<div>
<p>&nbsp;</p>
</div>'
    assert_equal(result, html.html2html_strict)

    html   = '<p lang="DE"><b><span></span></b></p>'
    result = '<p lang="DE"></p>'
    assert_equal(result, html.html2html_strict)

    html   = '<div>lala<div lang="DE"><p><span>Hello Martin,</span></p></div></div>'
    result = "<div>lala<p>Hello Martin,</p>\n</div>"
    assert_equal(result, html.html2html_strict)

    html   = '<p lang="DE"><b><span>Hello Martin,</span></b></p>'
    result = '<p lang="DE"><b>Hello Martin,</b></p>'
    assert_equal(result, html.html2html_strict)

    html = '<body lang="DE" link="blue" vlink="purple"><div class="WordSection1">
<p class="MsoNormal"><span style="color:#1F497D">Guten Morgen, Frau ABC,<o:p></o:p></span></p>
<p class="MsoNormal"><span style="color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class="MsoNormal"><span style="color:#1F497D">vielen Dank für die Reservierung. Dabei allerdings die Sprache (Niederländisch) nicht erwähnt. Können Sie bitte dieses in Ihrer Reservierung vormerken?<o:p></o:p></span></p>
<p class="MsoNormal"><span style="color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class="MsoNormal"><span style="color:#1F497D">Nochmals vielen Dank und herzliche Grüße
<o:p></o:p></span></p>
<div>
<p class="MsoNormal"><b><span style="font-size:10.0pt;color:#1F497D"><o:p>&nbsp;</o:p></span></b></p>
<p class="MsoNormal"><b><span style="font-size:10.0pt;color:#1F497D">Anna Smith<o:p></o:p></span></b></p>
<p class="MsoNormal"><b><span style="font-size:10.0pt;color:#1F497D">art abc SEV GmbH<o:p></o:p></span></b></p>
<p class="MsoNormal"><b><span style="font-size:10.0pt;color:#1F497D">art abc TRAV<o:p></o:p></span></b></p>
<p class="MsoNormal"><span style="font-size:9.0pt;color:#1F497D">Marktstätte 123<o:p></o:p></span></p>
<p class="MsoNormal"><span style="font-size:9.0pt;color:#1F497D">123456 Dorten<o:p></o:p></span></p>
<p class="MsoNormal"><span style="font-size:9.0pt;color:#1F497D">T: &#43;49 (0) 12345/1234560-1<o:p></o:p></span></p>
<p class="MsoNormal"><span style="font-size:9.0pt;color:#1F497D">T: &#43;49 (0) 12345/1234560-0<o:p></o:p></span></p>
<p class="MsoNormal"><span style="font-size:9.0pt;color:#1F497D">F: &#43;49 (0) 12345/1234560-2<o:p></o:p></span></p>
<p class="MsoNormal"><a href="mailto:annad@example.com"><span style="font-size:9.0pt">annad@example.com</span></a><span style="font-size:9.0pt;color:#C00000"><o:p></o:p></span></p>
<p class="MsoNormal"><a href="http://www.example.com/"><span style="font-size:9.0pt">www.example.com</span></a><span style="font-size:9.0pt;color:#1F497D">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><a href="http://www.ABC.com/"><span style="font-size:9.0pt">www.ABC.com</span></a><span style="font-size:9.0pt;color:#1F497D"><o:p></o:p></span></p>
<p class="MsoNormal"><span style="font-size:8.0pt;color:#1F497D">Geschäftsführer Vor Nach, VorUndZu Nach&nbsp;&nbsp;&nbsp;&nbsp; -&nbsp;&nbsp;&nbsp;&nbsp; Amtsgericht Dort HRB 12345&nbsp;&nbsp;&nbsp; -&nbsp;&nbsp;&nbsp; Ein Unternehmer der ABC Gruppe<o:p></o:p></span></p>'

    result = '<div>
<p>Guten Morgen, Frau ABC,</p>
<p>&nbsp;</p>
<p>vielen Dank für die Reservierung. Dabei allerdings die Sprache (Niederländisch) nicht erwähnt. Können Sie bitte dieses in Ihrer Reservierung vormerken?</p>
<p>&nbsp;</p>
<p>Nochmals vielen Dank und herzliche Grüße</p>
<div>
<p><b> </b></p>
<p><b>Anna Smith</b></p>
<p><b>art abc SEV GmbH</b></p>
<p><b>art abc TRAV</b></p>
<p>Marktstätte 123</p>
<p>123456 Dorten</p>
<p>T: +49 (0) 12345/1234560-1</p>
<p>T: +49 (0) 12345/1234560-0</p>
<p>F: +49 (0) 12345/1234560-2</p>
<p>annad@example.com</p>
<p><a href="http://www.example.com/" rel="nofollow" target="_blank">www.example.com</a> <a href="http://www.abc.com/" rel="nofollow" target="_blank">www.ABC.com</a></p>
<p>Geschäftsführer Vor Nach, VorUndZu Nach - Amtsgericht Dort HRB 12345 - Ein Unternehmer der ABC Gruppe</p>
</div>
</div>'
    assert_equal(result, html.html2html_strict)

    html = '<p class="MsoNormal"><span style="color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<div>
<div style="border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm 0cm 0cm">
<p class="MsoNormal"><b><span style="font-size:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;">Von:</span></b><span style="font-size:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Besucherbüro, MKuk [<a href="mailto:besucherbuero@example.com">mailto:besucherbuero@example.com</a>] <br>
<b>Gesendet:</b> Freitag, 16. Dezember 2016 08:05<br>
<b>An:</b> \'Amaia Epalza\'<br>
<b>Betreff:</b> AW: Gruppe vtb Kultuur // 28.06.2017<o:p></o:p></span></p>
</div>
</div>
<p class="MsoNormal"><o:p>&nbsp;</o:p></p>
<p class="MsoNormal"><b><span style="font-size:10.0pt;font-family:&quot;Segoe UI&quot;,&quot;sans-serif&quot;;color:#1F497D">Reservierungsbestätigung Führung Skulptur-Projekte 2017 am
</span></b><o:p></o:p></p>
<p class="MsoNormal"><span style="font-size:10.0pt;font-family:&quot;Segoe UI&quot;,&quot;sans-serif&quot;;color:#1F497D">&nbsp;</span><o:p></o:p></p>
<p class="MsoNormal">Guten Morgen Frau Epalza,<o:p></o:p></p>'

    result = '<p>&nbsp;</p><div>
<div>
<span class="js-signatureMarker"></span><p><b>Von:</b> Besucherbüro, MKuk [besucherbuero@example.com] <br>
<b>Gesendet:</b> Freitag, 16. Dezember 2016 08:05<br>
<b>An:</b> \'Amaia Epalza\'<br>
<b>Betreff:</b> AW: Gruppe vtb Kultuur // 28.06.2017</p>
</div>
</div><p>&nbsp;</p><p><b>Reservierungsbestätigung Führung Skulptur-Projekte 2017 am </b></p><p>&nbsp;</p><p>Guten Morgen Frau Epalza,</p>'
    assert_equal(result, html.html2html_strict)

    html   = '<html><head><base href="x-msg://2849/"></head><body style="word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space; "><span class="Apple-style-span" style="border-collapse: separate; font-family: Helvetica; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; font-size: medium; "><div lang="DE" link="blue" vlink="purple"><div class="Section1" style="page: Section1; "><div style="margin-top: 0cm; margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; "><span style="font-size: 10pt; font-family: Arial, sans-serif; ">Hello Martin,<o:p></o:p></span></div>'
    result = '<div>Hello Martin,</div>'
    assert_equal(result, html.html2html_strict)

    html   = '<a href="mailto:john.smith@example.com" style="color: blue; text-decoration: underline; ">john.smith@example.com</a>'
    result = 'john.smith@example.com'
    assert_equal(result, html.html2html_strict)

    html   = '<a href="MAILTO:john.smith@example.com" style="color: blue; text-decoration: underline; ">john.smith@example.com</a>'
    result = 'john.smith@example.com'
    assert_equal(result, html.html2html_strict)

    html   = '<a href="mailto:john.smith2@example.com" style="color: blue; text-decoration: underline; ">john.smith@example.com</a>'
    #result = 'john.smith@example.com (mailto:john.smith2@example.com)'
    result = 'john.smith2@example.com'
    assert_equal(result, html.html2html_strict)

    html   = '<p class="MsoNormal"><a href="http://www.example.de/"><span style="color:blue;text-decoration:none"><img border="0" width="30" height="30" id="_x0000_i1030" src="cid:image001.png@01D172FC.F323CDB0"></span></a><o:p></o:p></p>'
    #result = '<p>http://www.example.de/ <a href="http://www.example.de/" rel="nofollow" target="_blank"><img border="0" src="cid:image001.png@01D172FC.F323CDB0" style="width:30px;height:30px;"></a></p>'
    result = '<p><a href="http://www.example.de/" rel="nofollow" target="_blank">http://www.example.de/</a></p>'
    assert_equal(result, html.html2html_strict)

    html   = '<p><a style="color: " href="http://www.example.com/?wm=mail"><img border="0" src="cid:example_new.png@8B201D8C.000B" width="101" height="30"></a></p>'
    #result = '<p>http://www.example.com/?wm=mail <a href="http://www.example.com/?wm=mail" rel="nofollow" target="_blank"><img border="0" src="cid:example_new.png@8B201D8C.000B" style="width:101px;height:30px;"></a></p>'
    result = '<p><a href="http://www.example.com/?wm=mail" rel="nofollow" target="_blank">http://www.example.com/?wm=mail</a></p>'
    assert_equal(result, html.html2html_strict)

    html   = '<p><font size="2"><a style="color: " href="http://www.example.com/?wm=mail"><img border="0" src="cid:example_new.png@8B201D8C.000B" width="101" height="30"></a></font></p>'
    #result = '<p>http://www.example.com/?wm=mail <a href="http://www.example.com/?wm=mail" rel="nofollow" target="_blank"><img border="0" src="cid:example_new.png@8B201D8C.000B" style="width:101px;height:30px;"></a></p>'
    result = '<p><a href="http://www.example.com/?wm=mail" rel="nofollow" target="_blank">http://www.example.com/?wm=mail</a></p>'
    assert_equal(result, html.html2html_strict)
  end

  test 'signature_identify function' do
    marker_template = '######SIGNATURE_MARKER######'

    source = 'test'
    result = 'test'
    assert_equal(result, source.signature_identify('text', true))

    source = "test\n--\nend"
    result = "test\n#{marker_template}--\nend"
    assert_equal(result, source.signature_identify('text', true))

    source = "On 01/04/15 10:55, Bob Smith wrote:"
    result = "#{marker_template}On 01/04/15 10:55, Bob Smith wrote:"
    assert_equal(result, source.signature_identify('text', true))

    source = "Am 03.04.2015 um 20:58 schrieb Martin Edenhofer <me@znuny.ink>:"
    result = "#{marker_template}Am 03.04.2015 um 20:58 schrieb Martin Edenhofer <me@znuny.ink>:"
    assert_equal(result, source.signature_identify('text', true))

    source = "\ntest 123 \n1\n2\n3\n4\n5\n6\n7\n8\n9\n--\nBob Smith\n"
    result = "\ntest 123 \n1\n2\n3\n4\n5\n6\n7\n8\n9\n#{marker_template}--\nBob Smith\n"
    assert_equal(result, source.signature_identify('text', true))

    source = "test 123 \n--no not match--\n--\nBob Smith\n"
    result = "test 123 \n--no not match--\n#{marker_template}--\nBob Smith\n"
    assert_equal(result, source.signature_identify('text', true))

    source = "test 123 \n--no not match--\n -- \nBob Smith\n"
    result = "test 123 \n--no not match--\n#{marker_template} -- \nBob Smith\n"
    assert_equal(result, source.signature_identify('text', true))

    source = "test 123 \n\n--\nBob Smith\n\n\n\n\n--\nBob Smith\n"
    result = "test 123 \n#{marker_template}\n--\nBob Smith\n\n\n\n\n--\nBob Smith\n"
    assert_equal(result, source.signature_identify('text', true))

    source = "test 123\ntest 123\n--\nBob Smith\n"
    result = "test 123\ntest 123\n#{marker_template}--\nBob Smith\n"
    assert_equal(result, source.signature_identify('text', true))

    source = "test 123\ntest 123\n--\nBob Smith\n\n"
    result = "test 123\ntest 123\n#{marker_template}--\nBob Smith\n\n"
    assert_equal(result, source.signature_identify('text', true))

    # apple
    # en
    source = "test 123 \n--no not match--\nBob Smith\nOn 01/04/15 10:55, Bob Smith wrote:\nlalala\n--\nsome test"
    result = "test 123 \n--no not match--\nBob Smith\n#{marker_template}On 01/04/15 10:55, Bob Smith wrote:\nlalala\n#{marker_template}--\nsome test"
    assert_equal(result, source.signature_identify('text', true))

    # de
    source = "test 123 \n\n--no not match--\n\nBob Smith\nAm 03.04.2015 um 20:58 schrieb Bob Smith <bob@example.com>:\nlalala"
    result = "test 123 \n\n--no not match--\n\nBob Smith\n#{marker_template}Am 03.04.2015 um 20:58 schrieb Bob Smith <bob@example.com>:\nlalala"
    assert_equal(result, source.signature_identify('text', true))

    # ms
    # en
    source = "test 123 \n\n--no not match--\n\nBob Smith\nFrom: Martin Edenhofer via Znuny Support [mailto:support@znuny.inc]\nSent: Donnerstag, 2. April 2015 10:00\nlalala</div>"
    result = "test 123 \n\n--no not match--\n\nBob Smith\n#{marker_template}From: Martin Edenhofer via Znuny Support [mailto:support@znuny.inc]\nSent: Donnerstag, 2. April 2015 10:00\nlalala</div>"
    assert_equal(result, source.signature_identify('text', true))

    # de
    source = "test 123 \n\n--no not match--\n\nBob Smith\nVon: Martin Edenhofer via Znuny Support [mailto:support@znuny.inc]\nGesendet: Donnerstag, 2. April 2015 10:00\nBetreff: lalala\n"
    result = "test 123 \n\n--no not match--\n\nBob Smith\n#{marker_template}Von: Martin Edenhofer via Znuny Support [mailto:support@znuny.inc]\nGesendet: Donnerstag, 2. April 2015 10:00\nBetreff: lalala\n"
    assert_equal(result, source.signature_identify('text', true))

    # fr
    source = "\ntest 123 \n\n--no not match--\n\nBob Smith\nDe : Martin Edenhofer via Znuny Support [mailto:support@znuny.inc]\nEnvoyé : mercredi 29 avril 2015 17:31\nObjet : lalala\n"
    result = "\ntest 123 \n\n--no not match--\n\nBob Smith\n#{marker_template}De : Martin Edenhofer via Znuny Support [mailto:support@znuny.inc]\nEnvoyé : mercredi 29 avril 2015 17:31\nObjet : lalala\n"
    assert_equal(result, source.signature_identify('text', true))

    marker_template = '<span class="js-signatureMarker"></span>'
    html   = "lalala<br>--<br>Max Mix"
    result = "lalala#{marker_template}<br>--<br>Max Mix"
    assert_equal(result, html.html2html_strict)

    marker_template = '<span class="js-signatureMarker"></span>'
    html   = "lalala<br/>--<br/>Max Mix"
    result = "lalala#{marker_template}<br>--<br>Max Mix"
    assert_equal(result, html.html2html_strict)

    marker_template = '<span class="js-signatureMarker"></span>'
    html   = "lalala<br/>
--<br/>Max Mix"
    result = "lalala#{marker_template}<br> --<br>Max Mix"
    assert_equal(result, html.html2html_strict)

    marker_template = '<span class="js-signatureMarker"></span>'
    html   = "lalala<p>--</p>Max Mix"
    result = "lalala#{marker_template}<p>--</p>Max Mix"
    assert_equal(result, html.html2html_strict)

    marker_template = '<span class="js-signatureMarker"></span>'
    html   = "lalala<br>__<br>Max Mix"
    result = "lalala#{marker_template}<br>__<br>Max Mix"
    assert_equal(result, html.html2html_strict)

    html   = "den.<br><br><b>Von:</b> Fritz Bauer [mailto:me@example.com]<br><b>Gesendet:</b> Donnerstag, 3. Mai 2012 11:51<br><b>An:</b> John Smith<br><b>Cc:</b> Smith, John Marian; johnel.fratczak@example.com; ole.brei@example.com; Günther John | Example GmbH; bkopon@example.com; john.heisterhagen@team.example.com; sven.rocked@example.com; michael.house@example.com; tgutzeit@example.com<br><b>Betreff:</b> Re: OTRS::XXX Erweiterung - Anhänge an CI's<br><br>Hello,<br><br>ich versuche an den Punkten"
    result = "den.<br>#{marker_template}<br><b>Von:</b> Fritz Bauer [mailto:me@example.com]<br><b>Gesendet:</b> Donnerstag, 3. Mai 2012 11:51<br><b>An:</b> John Smith<br><b>Cc:</b> Smith, John Marian; johnel.fratczak@example.com; ole.brei@example.com; Günther John | Example GmbH; bkopon@example.com; john.heisterhagen@team.example.com; sven.rocked@example.com; michael.house@example.com; tgutzeit@example.com<br><b>Betreff:</b> Re: OTRS::XXX Erweiterung - Anhänge an CI's<br><br>Hello,<br><br>ich versuche an den Punkten"
    assert_equal(result, html.html2html_strict)

    html   = '<div><div style="border:none;border-top:solid #e1e1e1 1.0pt;padding:3.0pt 0cm 0cm 0cm"><p class="MsoNormal"><b><span lang="DE" style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">Von:</span></b><span lang="DE" style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif"> Martin Edenhofer via Zammad Helpdesk [mailto:<a href="mailto:support@example.com">support@zammad.com</a>] <br><b>Gesendet:</b> '
    result = '<span class="js-signatureMarker"></span><p><b>Von:</b> Martin Edenhofer via Zammad Helpdesk [mailto:support@example.com] <br><b>Gesendet:</b> </p>'
    assert_equal(result, html.html2html_strict)

    html   = '<div style="border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm 0cm 0cm">
<p class="MsoNormal" style="margin-left:35.4pt"><b><span style="font-family:Calibri;color:black">Von:
</span></b><span style="font-family:Calibri;color:black">Johanna Kiefer via Znuny Projects &lt;projects@example.com&gt;<br>
<b>Organisation: </b>Znuny Group<br>
<b>Datum: </b>Montag, 6. März 2017 um 13:32<br>'
    result = '<div>
<span class="js-signatureMarker"></span><p><b>Von: </b>Johanna Kiefer via Znuny Projects &lt;projects@example.com&gt;<br>
<b>Organisation: </b>Znuny Group<br>
<b>Datum: </b>Montag, 6. März 2017 um 13:32<br></p>
</div>'
    assert_equal(result, html.html2html_strict)

    html   = '<div><br>
<br>
<br><font size=1 color=#5f5f5f face="sans-serif">Von: &nbsp; &nbsp; &nbsp;
&nbsp;</font><font size=1 face="sans-serif">Hotel &lt;info@example.de&gt;</font>
<br><font size=1 color=#5f5f5f face="sans-serif">An: &nbsp; &nbsp; &nbsp;
&nbsp;</font></div>'
    result = '<span class="js-signatureMarker"></span><div><br>Von: Hotel &lt;info@example.de&gt;
<br>An: 
</div>'
    assert_equal(result, html.html2html_strict)

    html = '<br class=""><div><blockquote type="cite" class=""><div class="">On 04 Mar 2017, at 14:47, Oliver Ruhm &lt;<a href="mailto:oliver@example.com" class="">oliver@example.com</a>&gt; wrote:</div><br class="Apple-interchange-newline">'
    result = '<div><span class="js-signatureMarker"></span><blockquote type="cite">
<div>On 04 Mar 2017, at 14:47, Oliver Ruhm &lt;oliver@example.com&gt; wrote:</div>
<br>
</blockquote></div>'
    assert_equal(result, html.html2html_strict)

    html = '<br class=""><div><blockquote type="cite" class=""><div class="">some note</div><br class="Apple-interchange-newline">'
    result = '<div><blockquote type="cite">
<div>some note</div>
<br>
</blockquote></div>'
    assert_equal(result, html.html2html_strict)

  end

end
