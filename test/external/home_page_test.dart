import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ludo_liubice/external/home_page.dart';
import 'package:html/parser.dart' show parse;
import 'package:ludo_liubice/data/article.dart';

const String htmlEntry = """
<article id="post-12377"  class="post-content post-12377 post type-post status-publish format-standard has-post-thumbnail hentry category-allgemein category-familienspielen category-veranstaltungen tag-brettspiel tag-familien tag-gesellschaft tag-kartenspiel tag-kinderspiel tag-liubice tag-ludo tag-spass tag-spielen">

	
	        <div class="featured-image">
        	        	<a href="https://www.ludo-liubice.de/2022/06/familien-spielen-am-sonntag-17-november-2019/" rel="bookmark">
            <img width="669" height="276" src="https://www.ludo-liubice.de/wp-content/uploads/2022/04/Gemeindehaus-Wichern.png" class="attachment-nisarg-full-width size-nisarg-full-width wp-post-image" alt="" srcset="https://www.ludo-liubice.de/wp-content/uploads/2022/04/Gemeindehaus-Wichern.png 669w, https://www.ludo-liubice.de/wp-content/uploads/2022/04/Gemeindehaus-Wichern-300x124.png 300w, https://www.ludo-liubice.de/wp-content/uploads/2022/04/Gemeindehaus-Wichern-40x17.png 40w, https://www.ludo-liubice.de/wp-content/uploads/2022/04/Gemeindehaus-Wichern-604x249.png 604w" sizes="(max-width: 669px) 100vw, 669px" />                        </a>         
        </div>
        
	<header class="entry-header">

		<span class="screen-reader-text">Familienspielen in Moisling</span>

					<h2 class="entry-title">
				<a href="https://www.ludo-liubice.de/2022/06/familien-spielen-am-sonntag-17-november-2019/" rel="bookmark">Familienspielen in Moisling</a>
			</h2>
		
				<div class="entry-meta">
			<h5 class="entry-date"><i class="fa fa-calendar-o"></i> <a href="https://www.ludo-liubice.de/2022/06/familien-spielen-am-sonntag-17-november-2019/" title="17:00" rel="bookmark"><time class="entry-date" datetime="2022-06-23T17:00:49+02:00">23. Juni 2022 </time></a><span class="byline"><span class="sep"></span><i class="fa fa-user"></i>
<span class="author vcard"><a class="url fn n" href="https://www.ludo-liubice.de/author/gert-wohlgemutht-online-de/" title="Alle Posts vom Autor Gert Wohlgemuth" rel="author">Gert Wohlgemuth</a></span></span> <i class="fa fa-comments-o"></i><span class="screen-reader-text">Kommentare </span> <a href="https://www.ludo-liubice.de/2022/06/familien-spielen-am-sonntag-17-november-2019/#respond" class="comments-link" >0 Kommentare</a></h5>
		</div><!-- .entry-meta -->
			</header><!-- .entry-header -->

	<div class="entry-summary">
		<p>Einmal im Monat, immer am Sonntag von 15:00 bis 18:00 Uhr veranstaltet der Lübecker Spieleverein Ludo Liubice ein „Familienspielen am Sonntag“ und bietet Alternativen für Kinder zu elektronischen Medien. Veranstaltungsort für den 03. Juli 2022 ist das Gemeindehaus Wichern im Andersenring 29 in Lübeck. Wir haben jede Menge tolle Spiele für Groß und Klein im Gepäck und erklären diese euch gerne. Es werden sogar schon Spiele ab 6 Jahren da sein. Also scheut euch nicht, schon mit den ganz kleinen&#8230;</p>
<p class="read-more"><a class="btn btn-default" href="https://www.ludo-liubice.de/2022/06/familien-spielen-am-sonntag-17-november-2019/">Weiterlesen<span class="screen-reader-text"> Weiterlesen</span></a></p>
	</div><!-- .entry-summary -->

	<footer class="entry-footer">
			</footer><!-- .entry-footer -->
</article><!-- #post-## -->
""";

main() {
  var doc = parse(htmlEntry);
  var element = doc.getElementsByClassName("post-content")[0];

  test("getHeader(element) works", () {
    ArticleHeader expectedHeader = ArticleHeader("Familienspielen in Moisling",
        "https://www.ludo-liubice.de/2022/06/familien-spielen-am-sonntag-17-november-2019/");
    expect(getHeader(element)?.title, expectedHeader.title);
    expect(getHeader(element)?.link, expectedHeader.link);
  });

  test("getImage(element) works", () {
    expect(
      getImage(element),
      ArticleImage(
        image: Image.network(
          "https://www.ludo-liubice.de/wp-content/uploads/2022/04/Gemeindehaus-Wichern.png",
        ),
        imageRatio: 669 / 276,
      ),
    );
  });

  test("getArticles(entry) works", () {
    expect(
      getArticles(htmlEntry),
      [
        Article(
          articleHeader: ArticleHeader("Familienspielen in Moisling",
              "https://www.ludo-liubice.de/2022/06/familien-spielen-am-sonntag-17-november-2019/"),
          articleImage: ArticleImage(
            image: Image.network(
              "https://www.ludo-liubice.de/wp-content/uploads/2022/04/Gemeindehaus-Wichern.png",
            ),
            imageRatio: 669 / 276,
          ),
        ),
      ],
    );
  });
}
