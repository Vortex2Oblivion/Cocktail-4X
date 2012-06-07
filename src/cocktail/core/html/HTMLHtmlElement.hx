/*
	This file is part of Cocktail http://www.silexlabs.org/groups/labs/cocktail/
	This project is © 2010-2011 Silex Labs and is released under the GPL License:
	This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License (GPL) as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version. 
	This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
	To read the license please visit http://www.gnu.org/copyleft/gpl.html
*/
package cocktail.core.html;
import cocktail.core.renderer.LayerRenderer;

/**
 * Root of an HTML document
 * 
 * @author Yannick DOMINGUEZ
 */
class HTMLHtmlElement extends HTMLElement
{	
	/**
	 * class constructor
	 */
	public function new() 
	{
		super(HTMLConstants.HTML_HTML_TAG_NAME);
	}
	
	//////////////////////////////////////////////////////////////////////////////////////////
	// OVERRIDEN PRIVATE RENDERING TREE METHODS
	//////////////////////////////////////////////////////////////////////////////////////////
	
	/**
	 * This HTMLElement doesn't generate any visual content,
	 * as the root of the visual content is the HTMLBodyElement
	 */
	override private function createElementRenderer():Void
	{
		
	}
	
	//////////////////////////////////////////////////////////////////////////////////////////
	// DOM PARSER GETTER/SETTER
	//////////////////////////////////////////////////////////////////////////////////////////
	
	/**
	 * Overriden to reset the HTMLBodyElement when the innerHTML is set,
	 * as it reset the whole document
	 */
	override private function set_innerHTML(value:String):String
	{
		super.set_innerHTML(value);
		
		var htmlDocument:HTMLDocument = cast(_ownerDocument);
		htmlDocument.initBody(cast(getElementsByTagName(HTMLConstants.HTML_BODY_TAG_NAME)[0]));
		
		return value;
	}
	
}