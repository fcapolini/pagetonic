package pagetonic.lib;

#if client
	import js.Browser;
	import js.html.Document;
	import js.html.Element;
	import js.html.Event;
	import js.html.Node;
	import js.html.NodeList;

	typedef DomDocument = Document;
	typedef DomElement = Element;
	typedef DomNode = Node;
	typedef DomNodeList = NodeList;
	typedef DomTextNode = Node;
	typedef DomEvent = Event;
#else
	import htmlparser.HtmlNodeText;
	import htmlparser.HtmlNode;
	import htmlparser.HtmlNodeElement;
	import htmlparser.HtmlDocument;

	typedef DomDocument = HtmlDocument;
	typedef DomElement = HtmlNodeElement;
	typedef DomNode = HtmlNode;
	typedef DomNodeList = Array<DomNode>;
	typedef DomTextNode = HtmlNodeText;
	typedef DomEvent = Dynamic;
#end

class DomTools {

	#if !debug inline #end
	public static function domDefaultDoc():DomDocument {
		#if client
			return Browser.document;
		#else
			return new HtmlDocument('<html><head></head><body></body></html>');
		#end
	}

	#if !debug inline #end
	public static function domRootElement(d:DomDocument) {
		#if client
			return d.documentElement; //d.firstElementChild;
		#else
			return d.children[0];
		#end
	}

	#if !debug inline #end
	public static function domCreateElement(d:DomDocument, tagname:String) {
		#if client
			return d.createElement(tagname);
		#else
		return new HtmlNodeElement(tagname, []);
		#end
	}

	#if !debug inline #end
	public static function domCreateTextNode(d:DomDocument) {
		#if client
			return d.createTextNode('');
		#else
			return new HtmlNodeText('');
		#end
	}

	#if !debug inline #end
	public static function domAddChild(e:DomElement, n:DomNode, ?before:DomNode) {
		#if client
			if (before != null) {
				e.insertBefore(n, before);
			} else {
				e.appendChild(n);
			}
		#else
			e.addChild(n, before);
		#end
	}

	#if !debug inline #end
	public static function domRemove(n:DomNode) {
		#if client
			// we don't use n.remove() for backward compatibility (IE...)
			if (n.parentElement != null) {
				n.parentElement.removeChild(n);
			}
		#else
			n.remove();
			n.parent = null;
		#end
	}

	#if !debug inline #end
	public static function domParent(n:DomNode) {
		#if client
			return n.parentElement;
		#else
			return n.parent;
		#end
	}

	#if !debug inline #end
	public static function domFirstChild(e:DomElement): DomNode {
		#if client
			return e.firstChild;
		#else
			return e.nodes.length > 0 ? e.nodes[0] : null;
		#end
	}

	#if !debug inline #end
	public static function domFirstElementChild(e:DomElement): DomElement {
		#if client
			return e.firstElementChild;
		#else
			return e.children.length > 0 ? e.children[0] : null;
		#end
	}

	#if !debug inline #end
	public static function domNextElementSibling(e:DomElement): DomElement {
		#if client
			return e.nextElementSibling;
		#else
			return e.getNextSiblingElement();
		#end
	}

	public inline static function domAddEventHandler(e:DomElement,
													 type:String,
													 h:DomEvent->Void) {
		#if client
			e.addEventListener(type, h);
		#end
	}

	public inline static function domRemoveEventHandler(e:DomElement,
														type:String,
														h:DomEvent->Void) {
		#if client
			e.removeEventListener(type, h);
		#end
	}

	#if !debug inline #end
	public static function domGetTagname(e:DomElement): String {
		#if client
			return e.tagName;
		#else
			return e.name;
		#end
	}

	#if !debug inline #end
	public static function domSetText(e:DomElement, v:Dynamic) {
		e.innerText = (v != null ? Std.string(v) : '');
	}

	#if !debug inline #end
	public static function domSetHtml(e:DomElement, v:Dynamic) {
		e.innerHTML = (v != null ? Std.string(v) : '');
	}

	#if !debug inline #end
	public static function domSet(e:DomElement, k:String, v:String) {
		v != null ? e.setAttribute(k, v) : e.removeAttribute(k);
	}

	#if !debug inline #end
	public static function domGet(e:DomElement, key:String) {
		return e.getAttribute(key);
	}

	#if !debug inline #end
	public static function domCheck(e:DomElement, key:String) {
		return e.hasAttribute(key);
	}

	#if !debug inline #end
	public static function domOuterHTML(e:DomElement) {
		#if client
			return e.outerHTML;
		#else
			return e.toString();
		#end
	}

//	#if !debug
//	inline
//	#end
//	public static function domGetHead(doc:DomDocument): DomElement {
//#if !client
////		var r = doc.find('head');
////		return (r.length > 0 ? r[0] : null);
//		var ret:DomElement = null;
//		for (n in domRootElement(doc).nodes) {
//			if (Std.is(n, DomElement) && untyped n.name == 'head') {
//				ret = untyped n;
//				break;
//			}
//		}
//		return ret;
//#else
//		var r = doc.getElementsByTagName('head');
//		return (r.length > 0 ? r.item(0) : null);
//#end
//	}
//
//	#if !debug
//	inline
//	#end
//	public static function domGetBody(doc:DomDocument): DomElement {
//#if !client
////		var r = doc.find('body');
////		return (r.length > 0 ? r[0] : null);
//		var ret:DomElement = null;
//		for (n in domRootElement(doc).nodes) {
//			if (Std.is(n, DomElement) && untyped n.name == 'body') {
//				ret = untyped n;
//				break;
//			}
//		}
//		return ret;
//#else
//		var r = doc.getElementsByTagName('body');
//		return (r.length > 0 ? r.item(0) : null);
//#end
//	}

}
