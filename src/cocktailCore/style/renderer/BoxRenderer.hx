/*
	This file is part of Cocktail http://www.silexlabs.org/groups/labs/cocktail/
	This project is © 2010-2011 Silex Labs and is released under the GPL License:
	This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License (GPL) as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version. 
	This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
	To read the license please visit http://www.gnu.org/copyleft/gpl.html
*/
package cocktailCore.style.renderer;

import cocktail.domElement.DOMElement;
import cocktail.nativeElement.NativeElement;
import cocktailCore.background.BackgroundManager;
import haxe.Log;

/**
 * Base class for box renderers. A box renderer
 * is an element displayed as a box, with margins,
 * paddings, backgrounds...
 * 
 * @author Yannick DOMINGUEZ
 */
class BoxRenderer extends ElementRenderer
{
	/**
	 * a reference to the background manager in charge
	 * of displaying the background of the element
	 */
	private var _backgroundManager:BackgroundManager;
	
	/**
	 * class constructor
	 */
	public function new(domElement:DOMElement) 
	{
		super(domElement);
		_backgroundManager = new BackgroundManager();
	}
	
	/**
	 * Render and position the background color and
	 * image of the element using runtime specific
	 * API and return an array of NativeElement from
	 * it
	 */
	override public function renderBackground():Array<NativeElement>
	{
		var bg = _backgroundManager.render(_bounds, _domElement.style);
		
		for (i in 0...bg.length)
		{
			//TODO : don't do that here
			#if (flash9 || nme)
			bg[i].x = _bounds.x;
			bg[i].y = _bounds.y;
			#end
		}
	
		return bg;
	}
}