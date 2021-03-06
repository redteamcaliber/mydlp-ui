package com.mydlp.ui.util
{	
	import com.mydlp.ui.domain.RegularExpression;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.utils.StringUtil;
	

	public class FileUtil
	{		
		public static function getHumanReadableSize(size:Number): String
		{			
			if(size < 1024)
				return size + " B";
			
			size /= 1024;
			if(size < 1024)
				return size.toFixed(2) + " KB";
			
			size /= 1024;
			if(size < 1024)
				return size.toFixed(2) + " MB";
			
			size /= 1024;
			if(size < 1024)
				return size.toFixed(2) + " GB";
			
			else
				return size.toFixed(2) + " GB";

		}
		
		public static function splitString(str:String):ArrayCollection
		{
			var result:ArrayCollection = new ArrayCollection;
			var temp:Array;
			var regex:RegExp = /\r|\n/;
			temp = str.split("\n")
			for each(var keyword:String in temp)
			{
				keyword = keyword.replace(regex, "");
				keyword = StringUtil.trim(keyword);
				if(!result.contains(keyword) && keyword.length >= 3 && keyword.length <= 128)
					result.addItem(keyword);
			}
			return result;
		}
		
		
		public static function isValid(str:String):Boolean
		{
			if(str == "" || str == "\n" || str == "\r\n" || str == "=" ||
				str == "\"" || str == "\'" || str == "|"  ||str == "\\" || 
				str == "." || str == "," || str == "!" || str == "(" ||
				str == ")" || str == "?" || str == "/" || str == "&" || str == "-")
				return false;
			else
				return true;
		}
	}
}