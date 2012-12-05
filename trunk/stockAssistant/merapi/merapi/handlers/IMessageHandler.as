////////////////////////////////////////////////////////////////////////////////
//
//  This program is free software; you can redistribute it and/or modify 
//  it under the terms of the GNU General Public License as published by the 
//  Free Software Foundation; either version 3 of the License, or (at your 
//  option) any later version.
//
//  This program is distributed in the hope that it will be useful, but 
//  WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
//  or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License 
//  for more details.
//
//  You should have received a copy of the GNU General Public License along 
//  with this program; if not, see <http://www.gnu.org/licenses>.
//
////////////////////////////////////////////////////////////////////////////////

package merapi.handlers
{

import merapi.messages.IMessage;

/**
 *  The <code>IMessageHandler</code> interface defines the methods for receiving a 
 *  <code>Message</code> from the Bridge.
 * 
 *  @see merapi.Bridge
 *  @see merapi.handlers.MessageHandler
 *  @see merapi.messages.IMessage
 *  @see merapi.messages.Message
 */
public interface IMessageHandler 
{
    //--------------------------------------------------------------------------
    //
    //  Methods
    //
    //--------------------------------------------------------------------------
	
	/**
	 *  Handles an <code>IMessage</code> dispatched from the Bridge.
	 */
	function handleMessage( message : IMessage ) : void
	
} //  end class
} //  end package