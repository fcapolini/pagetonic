package pagetonic;

import pagetonic.server.*;

// https://lib.haxe.org/p/utest/
class TestAll {
	public static function main() {
		utest.UTest.run([
			//
			// server
			//
			new ParserTest(),
		]);
	}
}
