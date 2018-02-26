The code above produces exactly the same HTML the previous sample did. We simply took our duplicated block:

	<div class="product">
		<div><span>Name:</span> Thingy</div>
		<div><span>Price:</span> 1€</div>
	</div>

and turned it into a **custom tag** named `<product>`, which specializes a `<div>` and has dynamic content.

We can now use it in our code:

	<product :name="Thingy" :price="1€"/>
	<product :name="Widget" :price="2€"/>

by only specifying what it is (a product) and what changes between its instances (name and price).