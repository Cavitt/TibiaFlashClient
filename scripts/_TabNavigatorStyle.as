﻿package 
{
    import mx.core.*;
    import mx.styles.*;

    public class _TabNavigatorStyle extends Object
    {

        public function _TabNavigatorStyle()
        {
            return;
        }// end function

        public static function init(param1:IFlexModuleFactory) : void
        {
            var fbs:* = param1;
            var style:* = StyleManager.getStyleDeclaration("TabNavigator");
            if (!style)
            {
                style = new CSSStyleDeclaration();
                StyleManager.setStyleDeclaration("TabNavigator", style, false);
            }
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.backgroundColor = 16777215;
                this.borderColor = 11187123;
                this.horizontalGap = -1;
                this.horizontalAlign = "left";
                this.paddingTop = 10;
                this.tabOffset = 0;
                this.borderStyle = "solid";
                return;
            }// end function
            ;
            }
            return;
        }// end function

    }
}
