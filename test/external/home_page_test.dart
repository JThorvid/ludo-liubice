import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ludo_liubice/external/home_page.dart';
import 'package:html/parser.dart' show parse;
import 'package:ludo_liubice/data/post.dart';

const String entry = """
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
const String article = """
<article id="post-12377"  class="post-content post-12377 post type-post status-publish format-standard has-post-thumbnail hentry category-allgemein category-familienspielen category-veranstaltungen tag-brettspiel tag-familien tag-gesellschaft tag-kartenspiel tag-kinderspiel tag-liubice tag-ludo tag-spass tag-spielen">

	
	        <div class="featured-image">
        	<img width="669" height="276" src="https://www.ludo-liubice.de/wp-content/uploads/2022/04/Gemeindehaus-Wichern.png" class="attachment-nisarg-full-width size-nisarg-full-width wp-post-image" alt="" srcset="https://www.ludo-liubice.de/wp-content/uploads/2022/04/Gemeindehaus-Wichern.png 669w, https://www.ludo-liubice.de/wp-content/uploads/2022/04/Gemeindehaus-Wichern-300x124.png 300w, https://www.ludo-liubice.de/wp-content/uploads/2022/04/Gemeindehaus-Wichern-40x17.png 40w, https://www.ludo-liubice.de/wp-content/uploads/2022/04/Gemeindehaus-Wichern-604x249.png 604w" sizes="(max-width: 669px) 100vw, 669px" />                    
        </div>
        
	<header class="entry-header">
		<span class="screen-reader-text">Familienspielen in Moisling</span>
					<h1 class="entry-title">Familienspielen in Moisling</h1>
		
				<div class="entry-meta">
			<h5 class="entry-date"><i class="fa fa-calendar-o"></i> <a href="https://www.ludo-liubice.de/2022/06/familien-spielen-am-sonntag-17-november-2019/" title="17:00" rel="bookmark"><time class="entry-date" datetime="2022-06-23T17:00:49+02:00" pubdate>23. Juni 2022 </time></a><span class="byline"><span class="sep"></span><i class="fa fa-user"></i>
<span class="author vcard"><a class="url fn n" href="https://www.ludo-liubice.de/author/gert-wohlgemutht-online-de/" title="Alle Posts vom Autor Gert Wohlgemuth" rel="author">Gert Wohlgemuth</a></span></span> <i class="fa fa-comments-o"></i><span class="screen-reader-text">Kommentare </span> <a href="https://www.ludo-liubice.de/2022/06/familien-spielen-am-sonntag-17-november-2019/#respond" class="comments-link" >0 Kommentare</a></h5>
		</div><!-- .entry-meta -->
			</header><!-- .entry-header -->

			<div class="entry-content">
				<p></p>
<p>Einmal im Monat, immer am <b>Sonntag von 15:00 bis 18:00 Uhr </b>veranstaltet der Lübecker Spieleverein Ludo Liubice ein <b>„Familienspielen am Sonntag“</b> und bietet Alternativen für Kinder zu elektronischen Medien.</p>
<p><strong>Veranstaltungsort für den 03. Juli 2022 ist das Gemeindehaus Wichern im Andersenring 29 in Lübeck.</strong></p>
<p>Wir haben jede Menge tolle Spiele für Groß und Klein im Gepäck und erklären diese euch gerne. Es werden sogar schon Spiele ab 6 Jahren da sein. Also scheut euch nicht, schon mit den ganz kleinen vorbei zu kommen. <br />Aber auch Familien mit schon größeren Kindern oder auch die Großeltern sind natürlich herzlich Willkommen.</p>
<p>Über ein Bonusheft, in das bei jedem Besuch ein Stempel kommt, könnt ihr sogar am Ende des Jahres ein kleines Spiel gewinnen. Also nichts wie hin zum Familienspieltag.</p>
<p>*** EINTRITT IST FREI ***</p>







<p>Weitere Termine findet ihr in unserem Kalender auf der Homepage.</p>



<p>Wir freuen uns auf Euch!</p>



<p>Euer Ludo Liubice-Team</p>
<div class="sharedaddy sd-sharing-enabled"><div class="robots-nocontent sd-block sd-social sd-social-icon sd-sharing"><h3 class="sd-title">Teilen mit:</h3><div class="sd-content"><ul><li class="share-jetpack-whatsapp"><a rel="nofollow noopener noreferrer" data-shared="" class="share-jetpack-whatsapp sd-button share-icon no-text" href="https://www.ludo-liubice.de/2022/06/familien-spielen-am-sonntag-17-november-2019/?share=jetpack-whatsapp" target="_blank" title="Klicken, um auf WhatsApp zu teilen"><span></span><span class="sharing-screen-reader-text">Klicken, um auf WhatsApp zu teilen (Wird in neuem Fenster geöffnet)</span></a></li><li class="share-facebook"><a rel="nofollow noopener noreferrer" data-shared="sharing-facebook-12377" class="share-facebook sd-button share-icon no-text" href="https://www.ludo-liubice.de/2022/06/familien-spielen-am-sonntag-17-november-2019/?share=facebook" target="_blank" title="Klick, um auf Facebook zu teilen"><span></span><span class="sharing-screen-reader-text">Klick, um auf Facebook zu teilen (Wird in neuem Fenster geöffnet)</span></a></li><li class="share-twitter"><a rel="nofollow noopener noreferrer" data-shared="sharing-twitter-12377" class="share-twitter sd-button share-icon no-text" href="https://www.ludo-liubice.de/2022/06/familien-spielen-am-sonntag-17-november-2019/?share=twitter" target="_blank" title="Klick, um über Twitter zu teilen"><span></span><span class="sharing-screen-reader-text">Klick, um über Twitter zu teilen (Wird in neuem Fenster geöffnet)</span></a></li><li class="share-pinterest"><a rel="nofollow noopener noreferrer" data-shared="sharing-pinterest-12377" class="share-pinterest sd-button share-icon no-text" href="https://www.ludo-liubice.de/2022/06/familien-spielen-am-sonntag-17-november-2019/?share=pinterest" target="_blank" title="Klick, um auf Pinterest zu teilen"><span></span><span class="sharing-screen-reader-text">Klick, um auf Pinterest zu teilen (Wird in neuem Fenster geöffnet)</span></a></li><li class="share-end"></li></ul></div></div></div><div class='sharedaddy sd-block sd-like jetpack-likes-widget-wrapper jetpack-likes-widget-unloaded' id='like-post-wrapper-135392366-12377-62c5d34bd664e' data-src='https://widgets.wp.com/likes/#blog_id=135392366&amp;post_id=12377&amp;origin=www.ludo-liubice.de&amp;obj_id=135392366-12377-62c5d34bd664e' data-name='like-post-frame-135392366-12377-62c5d34bd664e'><h3 class="sd-title">Gefällt mir:</h3><div class='likes-widget-placeholder post-likes-widget-placeholder' style='height: 55px;'><span class='button'><span>Gefällt mir</span></span> <span class="loading">Wird geladen...</span></div><span class='sd-text-color'></span><a class='sd-link-color'></a></div>
							</div><!-- .entry-content -->

	<footer class="entry-footer">
		<hr><div class="row"><div class="col-md-6 cattegories"><span class="cat-links"><i class="fa fa-folder-open"></i>
		 <a href="https://www.ludo-liubice.de/category/allgemein/" rel="category tag">Allgemein</a>, <a href="https://www.ludo-liubice.de/category/familienspielen/" rel="category tag">Familienspielen</a>, <a href="https://www.ludo-liubice.de/category/veranstaltungen/" rel="category tag">Veranstaltungen</a></span></div><div class="col-md-6 tags"><span class="tags-links"><i class="fa fa-tags"></i> <a href="https://www.ludo-liubice.de/tag/brettspiel/" rel="tag">Brettspiel</a>, <a href="https://www.ludo-liubice.de/tag/familien/" rel="tag">Familien</a>, <a href="https://www.ludo-liubice.de/tag/gesellschaft/" rel="tag">gesellschaft</a>, <a href="https://www.ludo-liubice.de/tag/kartenspiel/" rel="tag">Kartenspiel</a>, <a href="https://www.ludo-liubice.de/tag/kinderspiel/" rel="tag">kinderspiel</a>, <a href="https://www.ludo-liubice.de/tag/liubice/" rel="tag">Liubice</a>, <a href="https://www.ludo-liubice.de/tag/ludo/" rel="tag">Ludo</a>, <a href="https://www.ludo-liubice.de/tag/spass/" rel="tag">Spaß</a>, <a href="https://www.ludo-liubice.de/tag/spielen/" rel="tag">Spielen</a></span></div></div>	</footer><!-- .entry-footer -->
</article>
""";

main() {
  var doc = parse(entry);
  var element = doc.getElementsByClassName("post-content")[0];

  test("getHeader(element) works", () {
    PostHeader expectedHeader = PostHeader("Familienspielen in Moisling",
        "https://www.ludo-liubice.de/2022/06/familien-spielen-am-sonntag-17-november-2019/");
    expect(getHeader(element)?.title, expectedHeader.title);
    expect(getHeader(element)?.link, expectedHeader.link);
  });

  test("getImage(element) works", () {
    expect(
      getImage(element),
      PostImage(
        image: Image.network(
          "https://www.ludo-liubice.de/wp-content/uploads/2022/04/Gemeindehaus-Wichern.png",
        ),
        imageRatio: 669 / 276,
      ),
    );
  });

  test("getPosts(entry) works", () {
    expect(
      getPosts(entry),
      [
        Post(
          postHeader: PostHeader("Familienspielen in Moisling",
              "https://www.ludo-liubice.de/2022/06/familien-spielen-am-sonntag-17-november-2019/"),
          postImage: PostImage(
            image: Image.network(
              "https://www.ludo-liubice.de/wp-content/uploads/2022/04/Gemeindehaus-Wichern.png",
            ),
            imageRatio: 669 / 276,
          ),
        ),
      ],
    );
  });

  test("addContent(post) works", () {
    Post post = Post(
      postHeader: PostHeader("Familienspielen in Moisling",
          "https://www.ludo-liubice.de/2022/06/familien-spielen-am-sonntag-17-november-2019/"),
    );
    addResponse(article, post);
    expect(
      post.content,
      '\n'
      '\t\t\t\t<p></p>\n'
      '<p>Einmal im Monat, immer am <b>Sonntag von 15:00 bis 18:00 Uhr </b>veranstaltet der Lübecker Spieleverein Ludo Liubice ein <b>„Familienspielen am Sonntag“</b> und bietet Alternativen für Kinder zu elektronischen Medien.</p>\n'
      '<p><strong>Veranstaltungsort für den 03. Juli 2022 ist das Gemeindehaus Wichern im Andersenring 29 in Lübeck.</strong></p>\n'
      '<p>Wir haben jede Menge tolle Spiele für Groß und Klein im Gepäck und erklären diese euch gerne. Es werden sogar schon Spiele ab 6 Jahren da sein. Also scheut euch nicht, schon mit den ganz kleinen vorbei zu kommen. <br>Aber auch Familien mit schon größeren Kindern oder auch die Großeltern sind natürlich herzlich Willkommen.</p>\n'
      '<p>Über ein Bonusheft, in das bei jedem Besuch ein Stempel kommt, könnt ihr sogar am Ende des Jahres ein kleines Spiel gewinnen. Also nichts wie hin zum Familienspieltag.</p>\n'
      '<p>*** EINTRITT IST FREI ***</p>\n'
      '\n'
      '\n'
      '\n'
      '\n'
      '\n'
      '\n'
      '\n'
      '<p>Weitere Termine findet ihr in unserem Kalender auf der Homepage.</p>\n'
      '\n'
      '\n'
      '\n'
      '<p>Wir freuen uns auf Euch!</p>\n'
      '\n'
      '\n'
      '\n'
      '<p>Euer Ludo Liubice-Team</p>\n',
    );
  });
}
