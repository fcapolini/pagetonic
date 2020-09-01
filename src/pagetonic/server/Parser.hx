package pagetonic.server;

import htmlparser.HtmlDocument;
import htmlparser.HtmlParser;

class Parser extends HtmlParser {

	public static function __init__() {
		// allow one or more ':' as an id prefix and inhibit
		// XML-style namespacing
		HtmlParser.reNamespacedID = ":*[a-z](?:-?[_a-z0-9])*";

		HtmlParser.reCDATA = "[<]!\\[CDATA\\[[\\s\\S]*?\\]\\][>]";
		HtmlParser.reScript = "[<]\\s*script\\s*([^>]*)>([\\s\\S]*?)"
							+ "<\\s*/\\s*script\\s*>";
		HtmlParser.reStyle = "<\\s*style\\s*([^>]*)>([\\s\\S]*?)"
							+ "<\\s*/\\s*style\\s*>";
		HtmlParser.reElementOpen = "<\\s*(" + HtmlParser.reNamespacedID + ")";
		HtmlParser.reAttr = HtmlParser.reNamespacedID
						+ "(?:\\s*=\\s*(?:'[^']*?'|\"[^\"]*?\"|[-_a-z0-9]+))?";
		HtmlParser.reElementEnd = "(/)?\\s*>";
		HtmlParser.reElementClose = "<\\s*/\\s*("
									+ HtmlParser.reNamespacedID + ")\\s*>";
		HtmlParser.reComment = "<!--[\\s\\S]*?-->";

		HtmlParser.reMain = new EReg("("
							+ HtmlParser.reCDATA + ")|("
							+ HtmlParser.reScript + ")|("
							+ HtmlParser.reStyle + ")|("
							+ HtmlParser.reElementOpen + "((?:\\s+"
							+ HtmlParser.reAttr + ")*)\\s*"
							+ HtmlParser.reElementEnd + ")|("
							+ HtmlParser.reElementClose + ")|("
							+ HtmlParser.reComment + ")",
							"ig");

		HtmlParser.reParseAttrs = new EReg(
					"(" + HtmlParser.reNamespacedID + ")"
					+ "(?:\\s*=\\s*('[^']*'|\"[^\"]*\"|[-_a-z0-9]+))?",
					"ig");
	}

	public static function parseDoc(s:String):HtmlDocument {
		return new HtmlDocument(s, true);
	}

}
