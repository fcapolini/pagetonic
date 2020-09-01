package pagetonic.server;

import pagetonic.server.Parser;
import utest.Assert;
import utest.Test;

using pagetonic.lib.DomTools;

class ParserTest extends Test {
	var root:String;

	function setupClass():Void {
		root = Sys.getCwd() + 'test/pagetonic/server/parser';
	}

	function test1() {
		var doc = Parser.parseDoc('<html :title="test"/>');
		var html = doc.domRootElement();
		Assert.equals('html', html.domGetTagname());
		Assert.equals('test', html.domGet(':title'));
	}

	function test2() {
		var doc = Parser.parseDoc('<html>
		<head></head>
		<body></body>
		</html>');
		var html = doc.domRootElement();
		Assert.equals('html', html.domGetTagname());
	}

}
