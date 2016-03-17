package tibia.input.gameaction
{
   import tibia.input.IAction;
   import tibia.chat.ChatWidget;
   import tibia.network.Connection;
   import tibia.chat.ns_chat_internal;
   import mx.resources.ResourceManager;
   import mx.resources.IResourceManager;
   
   public class TalkAction implements IAction
   {
      
      protected static const OPTIONS_MAX_COMPATIBLE_VERSION:Number = 4;
      
      private static const BUNDLE:String = "StaticAction";
      
      protected static const OPTIONS_MIN_COMPATIBLE_VERSION:Number = 2;
      
      private static const MIN_TALK_DELAY:int = 2500;
       
      private var m_PerformTimestamp:Number = 0;
      
      private var m_AutoSend:Boolean = false;
      
      private var m_Text:String = null;
      
      public function TalkAction(param1:String, param2:Boolean)
      {
         super();
         this.m_Text = param1.replace("/^s+/","").replace("/s+$/"," ");
         this.m_AutoSend = param2;
      }
      
      public static function s_Unmarshall(param1:XML, param2:Number) : TalkAction
      {
         if(param1 == null || param1.localName() != "action" || param2 < OPTIONS_MIN_COMPATIBLE_VERSION || param2 > OPTIONS_MAX_COMPATIBLE_VERSION)
         {
            throw new Error("TalkAction.s_Unmarshall: Invalid input.");
         }
         var _loc3_:XMLList = null;
         if((_loc3_ = param1.@type) == null || _loc3_.length() != 1 || _loc3_[0].toString() != "talk")
         {
            return null;
         }
         var _loc4_:* = false;
         if((_loc3_ = param1.@autoSend) != null && _loc3_.length() == 1)
         {
            _loc4_ = _loc3_[0].toString() == "true";
         }
         var _loc5_:String = null;
         if((_loc3_ = param1.@text) != null && _loc3_.length() == 1)
         {
            _loc5_ = _loc3_[0].toString();
         }
         else if((_loc3_ = param1.text()) != null && _loc3_.length() == 1)
         {
            _loc5_ = _loc3_[0].toString();
         }
         if(_loc5_ != null && _loc5_.length > 0)
         {
            return new TalkAction(_loc5_,_loc4_);
         }
         return null;
      }
      
      public function perform(param1:Boolean = false) : void
      {
         var _loc2_:ChatWidget = Tibia.s_GetChatWidget();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:Connection = Tibia.s_GetConnection();
         if(_loc3_ != null && Boolean(param1) && Boolean(this.m_AutoSend) && this.m_PerformTimestamp + MIN_TALK_DELAY > Tibia.s_FrameTimestamp)
         {
            return;
         }
         _loc2_.text = this.m_Text;
         if(this.m_AutoSend)
         {
            _loc2_.ns_chat_internal::onChatSend();
            this.m_PerformTimestamp = Tibia.s_FrameTimestamp;
         }
      }
      
      public function clone() : IAction
      {
         return new TalkAction(this.m_Text,this.m_AutoSend);
      }
      
      public function equals(param1:IAction) : Boolean
      {
         return param1 is TalkAction && TalkAction(param1).m_AutoSend == this.m_AutoSend && TalkAction(param1).m_Text == this.m_Text;
      }
      
      public function get text() : String
      {
         return this.m_Text;
      }
      
      public function get hidden() : Boolean
      {
         return true;
      }
      
      public function marshall() : XML
      {
         return <action type="talk" autoSend="{this.m_AutoSend}" text="{this.m_Text}"/>;
      }
      
      public function get autoSend() : Boolean
      {
         return this.m_AutoSend;
      }
      
      public function toString() : String
      {
         var _loc1_:IResourceManager = ResourceManager.getInstance();
         return _loc1_.getString(BUNDLE,"GAME_TALK",[this.m_Text]);
      }
   }
}
