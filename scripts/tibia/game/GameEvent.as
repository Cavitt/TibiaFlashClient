package tibia.game
{
   import flash.events.Event;
   
   public class GameEvent extends Event
   {
      
      public static const READY:String = "ready";
      
      public static const CLOSE:String = "close";
      
      public static const ERROR:String = "error";
       
      public var message:String = null;
      
      public function GameEvent(param1:String, param2:Boolean = true, param3:Boolean = false, param4:String = null)
      {
         super(param1,param2,param3);
         this.message = param4;
      }
      
      override public function clone() : Event
      {
         return new GameEvent(type,bubbles,cancelable,this.message);
      }
   }
}
