package pagetonic.server;

import htmlparser.HtmlParser;
import htmlparser.HtmlNodeElement;

class SourceDocument extends HtmlNodeElement {
    public var filename(default,null): String;

    public function new(str="", tolerant=false, name='-') {
        super("", []);
        this.filename = name;
        var nodes = HtmlParser.run(str, tolerant);
        for (node in nodes) {
            addChild(node);
        }
    }
    
}