package tibia.input.gameaction
{
   import tibia.input.IActionImpl;
   import flash.events.Event;
   import shared.utility.Vector3D;
   import tibia.appearances.ObjectInstance;
   import mx.managers.CursorManager;
   import tibia.cursors.CrosshairCursor;
   import flash.events.MouseEvent;
   import tibia.game.IUseWidget;
   import flash.display.InteractiveObject;
   import tibia.creatures.CreatureStorage;
   import tibia.creatures.Player;
   import tibia.creatures.Creature;
   import tibia.network.Connection;
   import tibia.worldmap.WorldMapStorage;
   import flash.geom.Point;
   import tibia.appearances.AppearanceInstance;
   import tibia.chat.MessageMode;
   import mx.resources.ResourceManager;
   import flash.events.EventDispatcher;
   import mx.core.EventPriority;
   import mx.events.SandboxMouseEvent;
   
   public class SafeTradeActionImpl implements IActionImpl
   {
      
      protected static const PROFESSION_MASK_DRUID:int = 1 << PROFESSION_DRUID;
      
      protected static const STATE_PZ_BLOCK:int = 13;
      
      protected static const PROFESSION_SORCERER:int = 3;
      
      protected static const PK_REVENGE:int = 6;
      
      protected static const STATE_SLOW:int = 5;
      
      protected static const PARTY_NONE:int = 0;
      
      protected static const PARTY_MEMBER_SEXP_ACTIVE:int = 5;
      
      protected static const PROFESSION_MASK_SORCERER:int = 1 << PROFESSION_SORCERER;
      
      protected static const SKILL_FIGHTCLUB:int = 9;
      
      protected static const WAR_ALLY:int = 1;
      
      protected static const PROFESSION_MASK_NONE:int = 1 << PROFESSION_NONE;
      
      protected static const PK_PARTYMODE:int = 2;
      
      protected static const WAR_ENEMY:int = 2;
      
      protected static const PARTY_LEADER_SEXP_INACTIVE_GUILTY:int = 8;
      
      protected static const PARTY_MEMBER:int = 2;
      
      protected static const STATE_DRUNK:int = 3;
      
      protected static const WAR_NEUTRAL:int = 3;
      
      protected static const SKILL_EXPERIENCE:int = 0;
      
      protected static const TYPE_NPC:int = 2;
      
      protected static const PROFESSION_KNIGHT:int = 1;
      
      protected static const SKILL_STAMINA:int = 16;
      
      protected static const STATE_NONE:int = -1;
      
      protected static const PROFESSION_PALADIN:int = 2;
      
      protected static const PARTY_MEMBER_SEXP_INACTIVE_GUILTY:int = 7;
      
      protected static const SKILL_FIGHTSHIELD:int = 7;
      
      protected static const SKILL_FIGHTAXE:int = 11;
      
      protected static const WAR_NONE:int = 0;
      
      protected static const SKILL_FIGHTDISTANCE:int = 8;
      
      protected static const PK_EXCPLAYERKILLER:int = 5;
      
      protected static const NUM_CREATURES:int = 1300;
      
      protected static const NUM_TRAPPERS:int = 8;
      
      protected static const SKILL_FED:int = 14;
      
      protected static const SKILL_MAGLEVEL:int = 2;
      
      protected static const SKILL_SOULPOINTS:int = 15;
      
      protected static const SKILL_FISHING:int = 13;
      
      protected static const PARTY_LEADER_SEXP_OFF:int = 4;
      
      protected static const PK_PLAYERKILLER:int = 4;
      
      protected static const STATE_FAST:int = 6;
      
      protected static const STATE_BLEEDING:int = 15;
      
      protected static const STATE_DAZZLED:int = 10;
      
      protected static const PROFESSION_MASK_KNIGHT:int = 1 << PROFESSION_KNIGHT;
      
      protected static const TYPE_PLAYER:int = 0;
      
      protected static const SKILL_HITPOINTS:int = 3;
      
      protected static const SKILL_NONE:int = -1;
      
      protected static const SKILL_OFFLINETRAINING:int = 17;
      
      private static const BUNDLE:String = "SafeTradeWidget";
      
      protected static const STATE_MANA_SHIELD:int = 4;
      
      protected static const SKILL_MANA:int = 4;
      
      protected static const PROFESSION_MASK_PALADIN:int = 1 << PROFESSION_PALADIN;
      
      protected static const MAX_NAME_LENGTH:int = 29;
      
      protected static const STATE_CURSED:int = 11;
      
      protected static const STATE_FREEZING:int = 9;
      
      protected static const PARTY_LEADER:int = 1;
      
      protected static const PARTY_LEADER_SEXP_INACTIVE_INNOCENT:int = 10;
      
      protected static const STATE_PZ_ENTERED:int = 14;
      
      protected static const PROFESSION_NONE:int = 0;
      
      protected static const PK_ATTACKER:int = 1;
      
      protected static const STATE_ELECTRIFIED:int = 2;
      
      protected static const SKILL_FIGHTSWORD:int = 10;
      
      protected static const TYPE_MONSTER:int = 1;
      
      protected static const SKILL_CARRYSTRENGTH:int = 6;
      
      protected static const STATE_POISONED:int = 0;
      
      protected static const STATE_BURNING:int = 1;
      
      protected static const SKILL_FIGHTFIST:int = 12;
      
      protected static const STATE_DROWNING:int = 8;
      
      protected static const PK_AGGRESSOR:int = 3;
      
      protected static const SKILL_LEVEL:int = 1;
      
      protected static const STATE_STRENGTHENED:int = 12;
      
      protected static const STATE_HUNGRY:int = 31;
      
      protected static const PROFESSION_MASK_ANY:int = PROFESSION_MASK_DRUID | PROFESSION_MASK_KNIGHT | PROFESSION_MASK_PALADIN | PROFESSION_MASK_SORCERER;
      
      protected static const PROFESSION_DRUID:int = 4;
      
      protected static const PARTY_MEMBER_SEXP_OFF:int = 3;
      
      protected static const STATE_FIGHTING:int = 7;
      
      protected static const SKILL_GOSTRENGTH:int = 5;
      
      protected static const PARTY_MEMBER_SEXP_INACTIVE_INNOCENT:int = 9;
      
      protected static const PK_NONE:int = 0;
      
      protected static const PARTY_LEADER_SEXP_ACTIVE:int = 6;
       
      private var m_CursorID:int = 0;
      
      protected var m_Absolute:Vector3D = null;
      
      private var m_ListenersRegistered:Boolean = false;
      
      protected var m_Object:ObjectInstance = null;
      
      protected var m_Position:int = -1;
      
      public function SafeTradeActionImpl(param1:Vector3D, param2:ObjectInstance, param3:int)
      {
         super();
         if(param1 == null || param1.x == 65535 && param1.y == 0)
         {
            throw new ArgumentError("SafeTradeActionImpl.SafeTradeActionImpl: Invalid co-ordinate.");
         }
         this.m_Absolute = param1;
         this.m_Position = param3;
         if(param2 == null)
         {
            throw new ArgumentError("SafeTradeActionImpl.SafeTradeActionImpl: Invalid object.");
         }
         this.m_Object = param2;
      }
      
      private function cancelEvent(param1:Event) : void
      {
         if(param1 != null)
         {
            if(param1.cancelable)
            {
               param1.preventDefault();
            }
            param1.stopImmediatePropagation();
            param1.stopPropagation();
         }
      }
      
      public function perform(param1:Boolean = false) : void
      {
         this.registerListeners(true);
         this.registerCursor(true);
      }
      
      private function onAbort(param1:Event) : void
      {
         if(param1 != null)
         {
            this.cancelEvent(param1);
            this.registerCursor(false);
            this.registerListeners(false);
         }
      }
      
      private function registerCursor(param1:Boolean) : void
      {
         if(Boolean(param1) && this.m_CursorID == 0)
         {
            this.m_CursorID = CursorManager.getInstance().setCursor(CrosshairCursor);
         }
         else if(!param1 && this.m_CursorID != 0)
         {
            CursorManager.getInstance().removeCursor(this.m_CursorID);
            this.m_CursorID = 0;
         }
      }
      
      private function onPerform(param1:MouseEvent) : void
      {
         var _loc2_:IUseWidget = null;
         var _loc3_:InteractiveObject = null;
         var _loc4_:CreatureStorage = null;
         var _loc5_:Player = null;
         var _loc6_:Creature = null;
         var _loc7_:Object = null;
         var _loc8_:Connection = null;
         var _loc9_:WorldMapStorage = null;
         if(param1 != null)
         {
            this.cancelEvent(param1);
            this.registerCursor(false);
            this.registerListeners(false);
            _loc2_ = null;
            _loc3_ = param1.target as InteractiveObject;
            while(_loc3_ != null && (_loc2_ = _loc3_ as IUseWidget) == null)
            {
               _loc3_ = _loc3_.parent;
            }
            if(_loc2_ == null)
            {
               return;
            }
            _loc4_ = Tibia.s_GetCreatureStorage();
            if(_loc4_ == null)
            {
               return;
            }
            _loc5_ = Tibia.s_GetPlayer();
            if(_loc5_ == null)
            {
               return;
            }
            _loc6_ = null;
            _loc7_ = _loc2_.getMultiUseObjectUnderPoint(new Point(param1.stageX,param1.stageY));
            if(_loc7_ == null || !(_loc7_.object is ObjectInstance) || _loc7_.object.ID != AppearanceInstance.CREATURE || (_loc6_ = _loc4_.getCreature(_loc7_.object.data)) == null || _loc6_.type != TYPE_PLAYER || _loc6_.ID == _loc5_.ID)
            {
               _loc9_ = Tibia.s_GetWorldMapStorage();
               if(_loc9_ != null)
               {
                  _loc9_.addOnscreenMessage(MessageMode.MESSAGE_FAILURE,ResourceManager.getInstance().getString(BUNDLE,"MSG_INVALID_PARTNER"));
               }
               return;
            }
            _loc8_ = Tibia.s_GetConnection();
            if(_loc8_ != null && Boolean(_loc8_.isGameRunning))
            {
               _loc8_.sendCTRADEOBJECT(this.m_Absolute.x,this.m_Absolute.y,this.m_Absolute.z,this.m_Object.type.ID,this.m_Position,_loc6_.ID);
            }
         }
      }
      
      private function registerListeners(param1:Boolean) : void
      {
         var _loc2_:EventDispatcher = Tibia.s_GetInstance().systemManager.getSandboxRoot();
         if(Boolean(param1) && !this.m_ListenersRegistered)
         {
            _loc2_.addEventListener(MouseEvent.MOUSE_UP,this.onPerform,true,EventPriority.DEFAULT,false);
            _loc2_.addEventListener(MouseEvent.MOUSE_DOWN,this.cancelEvent,true,EventPriority.DEFAULT,false);
            _loc2_.addEventListener(MouseEvent.CLICK,this.cancelEvent,true,EventPriority.DEFAULT,false);
            _loc2_.addEventListener(MouseEvent.RIGHT_MOUSE_UP,this.onAbort,true,EventPriority.DEFAULT,false);
            _loc2_.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN,this.cancelEvent,true,EventPriority.DEFAULT,false);
            _loc2_.addEventListener(MouseEvent.RIGHT_CLICK,this.cancelEvent,true,EventPriority.DEFAULT,false);
            _loc2_.addEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE,this.onAbort);
            _loc2_.addEventListener(Event.DEACTIVATE,this.onAbort);
         }
         else if(!param1 && Boolean(this.m_ListenersRegistered))
         {
            _loc2_.removeEventListener(MouseEvent.MOUSE_UP,this.onPerform,true);
            _loc2_.removeEventListener(MouseEvent.MOUSE_DOWN,this.cancelEvent,true);
            _loc2_.removeEventListener(MouseEvent.CLICK,this.cancelEvent,true);
            _loc2_.removeEventListener(MouseEvent.RIGHT_MOUSE_UP,this.onAbort,true);
            _loc2_.removeEventListener(MouseEvent.RIGHT_MOUSE_DOWN,this.cancelEvent,true);
            _loc2_.removeEventListener(MouseEvent.RIGHT_CLICK,this.cancelEvent,true);
            _loc2_.removeEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE,this.onAbort);
            _loc2_.removeEventListener(Event.DEACTIVATE,this.onAbort);
         }
         this.m_ListenersRegistered = param1;
      }
   }
}
