package org.hubo.flexextjs.utils
{
	/**
	 * 系统默认图标类
	 * 
	 * @auth HUBO
	 * @Date	 2010-11-13	
	 */
	public class IconUtils
	{
		public function IconUtils()
		{
		}
		
		[Embed('assets/flexextjs/image/search_text.png')]
		public static var searchText:Class;
//		
//		[Embed('assets/flexextjs/image/add.gif')]
//		public static var add:Class;
//		
//		[Embed('assets/flexextjs/image/search.gif')]
//		public static var search:Class;
//		
//		[Embed('assets/flexextjs/image/expert_search.png')]
//		public static var expertSearch:Class;
//		
//		[Embed('assets/flexextjs/image/application_view_list.png')]
//		public static var list:Class;
//		
//		[Embed('assets/flexextjs/image/delete.gif')]
//		public static var deletes:Class;
//		
//		[Embed('assets/flexextjs/image/connect.gif')]
//		public static var connect:Class;
//		
//		[Embed('assets/flexextjs/image/feed_add.png')]
//		public static var feedAdd:Class;
//		
//		[Embed('assets/flexextjs/image/cross.gif')]
//		public static var cross:Class;
//		
//		[Embed('assets/flexextjs/image/feed_delete.png')]
//		public static var feedDelete:Class;
//		
//		[Embed('assets/flexextjs/image/details.gif')]
//		public static var details:Class;
//		
//		[Embed('assets/flexextjs/image/feed_error.png')]
//		public static var feedError:Class;
//		
//		[Embed('assets/flexextjs/image/plugin.gif')]
//		public static var plugin:Class;
//		
//		[Embed('assets/flexextjs/image/drop-yes.gif')]
//		public static var dropYes:Class;
//		
//		[Embed('assets/flexextjs/image/folder_go.png')]
//		public static var folderGo:Class;
//		
//		[Embed('assets/flexextjs/image/plugin_add.gif')]
//		public static var pluginAdd:Class;
//		
//		[Embed('assets/flexextjs/image/expand.gif')]
//		public static var expand:Class;
//		
//		[Embed('assets/flexextjs/image/folder_wrench.png')]
//		public static var folderWrench:Class;
//		
//		[Embed('assets/flexextjs/image/application_go.png')]
//		public static var go:Class;
//		
//		[Embed('assets/flexextjs/image/rss_go.png')]
//		public static var rssGo:Class;
//		
//		[Embed('assets/flexextjs/image/export.png')]
//		public static var export:Class;
//		
//		[Embed('assets/flexextjs/image/print.png')]
//		public static var print:Class;
//		
//		[Embed('assets/flexextjs/image/base.png')]
//		public static var base:Class;
//		
//		[Embed('assets/flexextjs/image/fee.png')]
//		public static var fee:Class;
//		
//		[Embed('assets/flexextjs/image/refresh.png')]
//		public static var refresh:Class;
//		
//		[Embed('assets/flexextjs/image/table_refresh.png')]
//		public static var refresh2:Class;
//		
//		[Embed('assets/flexextjs/image/cog.png')]
//		public static var cog:Class;
//		
//		[Embed('assets/flexextjs/image/grid.png')]
//		public static var grid:Class;
//		
//		[Embed('assets/flexextjs/image/cog_edit.png')]
//		public static var cogEdit:Class;
//		
//		[Embed('assets/flexextjs/image/member.png')]
//		public static var member:Class;
//		
//		[Embed('assets/flexextjs/image/user_add.gif')]
//		public static var userAdd:Class;
//		
//		[Embed('assets/flexextjs/image/user_female.gif')]
//		public static var userFemale:Class;
//		
//		[Embed('assets/flexextjs/image/user.gif')]
//		public static var user:Class;
//		
//		[Embed('assets/flexextjs/image/user_comment.png')]
//		public static var userComment:Class;
//		
//		[Embed('assets/flexextjs/image/user_gray.png')]
//		public static var userGray:Class;
//		
//		[Embed('assets/flexextjs/image/user_red.png')]
//		public static var userRed:Class;
//		
//		[Embed('assets/flexextjs/image/user_delete.gif')]
//		public static var userDelete:Class;
//		
//		[Embed('assets/flexextjs/image/user_green.gif')]
//		public static var userGreen:Class;
//		
//		[Embed('assets/flexextjs/image/user_suit.png')]
//		public static var userSuit:Class;
//		
//		[Embed('assets/flexextjs/image/user_edit.png')]
//		public static var userEdit:Class;
//		
//		[Embed('assets/flexextjs/image/user_orange.png')]
//		public static var userOrange:Class;
//		
//		

		
		
		public static function getIcon(type:Object):Object
		{				
			
//			if(type == "add")
//			{
//				return add;
//			}
//			else if(type == "search")
//			{
//				return search;
//			}
//			else if(type == "list")
//			{
//				return list;
//			}
//			else if(type == "delete")
//			{
//				return deletes;
//			}
//			else if(type == "plugin")
//			{
//				return plugin;
//			}
//			else if(type == "pluginAdd")
//			{
//				return pluginAdd;
//			}
//			else if(type == "go")
//			{
//				return go;
//			}
//			else if(type == "base")
//			{
//				return base;
//			}
//			else if(type == "cog")
//			{
//				return cog;
//			}
//			else if(type == "cogEdit")
//			{
//				return cogEdit;
//			}
//			else if(type == "userFemale")
//			{
//				return userFemale;
//			}
//			else if(type == "userGray")
//			{
//				return userGreen;
//			}
//			else if(type == "userOrange")
//			{
//				return userOrange;
//			}
//			else if(type == "connect")
//			{
//				return connect;
//			}
//			else if(type == "cross")
//			{
//				return cross;
//			}
//			else if(type == "details")
//			{
//				return details;
//			}
//			else if(type == "dropYes")
//			{
//				return dropYes;
//			}
//			else if(type == "expand")
//			{
//				return expand;
//			}
//			else if(type == "export")
//			{
//				return export;
//			}
//			else if(type == "fee")
//			{
//				return fee;
//			}
//			else if(type == "grid")
//			{
//				return grid;
//			}
//			else if(type == "member")
//			{
//				return member;
//			}
//			else if(type == "user")
//			{
//				return user;
//			}
//			else if(type == "userRed")
//			{
//				return userRed;
//			}
//			else if(type == "userSuit")
//			{
//				return userSuit;
//			}
//			else if(type == "feedAdd")
//			{
//				return feedAdd;
//			}
//			else if(type == "feedDelete")
//			{
//				return feedDelete;
//			}
//			else if(type == "feedError")
//			{
//				return feedError;
//			}
//			else if(type == "folderGo")
//			{
//				return folderGo;
//			}
//			else if(type == "rssGo")
//			{
//				return rssGo;
//			}
//			else if(type == "folderWrench")
//			{
//				return folderWrench;
//			}
//			else if(type == "print")
//			{
//				return print;
//			}
//			else if(type == "refresh")
//			{
//				return refresh;
//			}
//			else if(type == "refresh2")
//			{
//				return refresh2;
//			}
//			else if(type == "userAdd")
//			{
//				return userAdd;
//			}
//			else if(type == "userComment")
//			{
//				return userComment;
//			}
//			else if(type == "userDelete")
//			{
//				return userDelete;
//			}
//			else if(type == "userEdit")
//			{
//				return userEdit;
//			}
////			else if(type == "pagePrevDisabled")
////			{
////				return pagePrevDisabled;
////			}
//			else if(type == "pagePrev")
//			{
//				return pagePrev;
//			}
////			else if(type == "pageFirstDisabled")
////			{
////				return pageFirstDisabled;
////			}			
//			else if(type == "pageLast")
//			{
//				return pageLast;
//			}
//			else if(type == "pageNext")
//			{
//				return pageNext;
//			}
//			else if(type == "pageFirst")
//			{
//				return pageFirst;
//			}
////			else if(type == "pageLastDisabled")
////			{
////				return pageLastDisabled;
////			}
////			else if(type == "pageNextDisabled")
////			{
////				return pageNextDisabled;
////			}
//			else if(type == "expertSearch")
//			{
//				return expertSearch;
//			}		
			
			return type;
		}
		
	}
}