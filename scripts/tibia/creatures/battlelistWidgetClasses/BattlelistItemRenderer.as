package tibia.creatures.battlelistWidgetClasses
{
   import mx.core.UIComponent;
   import mx.controls.listClasses.IListItemRenderer;
   import mx.core.IDataRenderer;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.StyleManager;
   import flash.geom.Rectangle;
   import flash.geom.Matrix;
   import shared.utility.TextFieldCache;
   import tibia.§creatures:ns_creature_internal§.s_Trans;
   import tibia.§creatures:ns_creature_internal§.s_Rect;
   import tibia.§creatures:ns_creature_internal§.s_IconCache;
   import tibia.§creatures:ns_creature_internal§.s_NameCache;
   import mx.events.PropertyChangeEvent;
   import flash.events.TimerEvent;
   import tibia.creatures.Creature;
   import mx.core.EventPriority;
   import mx.core.EdgeMetrics;
   import flash.display.BitmapData;
   import tibia.creatures.CreatureStorage;
   
   public class BattlelistItemRenderer extends UIComponent implements IListItemRenderer, IDataRenderer
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
      
      protected static const PK_PARTYMODE:int = 2;
      
      protected static const WAR_ALLY:int = 1;
      
      protected static const PROFESSION_MASK_NONE:int = 1 << PROFESSION_NONE;
      
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
      
      static var s_Rect:Rectangle = new Rectangle();
      
      protected static const SKILL_FISHING:int = 13;
      
      protected static const PARTY_LEADER_SEXP_OFF:int = 4;
      
      protected static const PK_PLAYERKILLER:int = 4;
      
      protected static const STATE_FAST:int = 6;
      
      public static const CREATURE_MARK_SIZE_NORMAL:int = 24;
      
      protected static const STATE_BLEEDING:int = 15;
      
      protected static const STATE_DAZZLED:int = 10;
      
      protected static const PROFESSION_MASK_KNIGHT:int = 1 << PROFESSION_KNIGHT;
      
      protected static const TYPE_PLAYER:int = 0;
      
      protected static const SKILL_HITPOINTS:int = 3;
      
      protected static const SKILL_NONE:int = -1;
      
      protected static const STATE_MANA_SHIELD:int = 4;
      
      protected static const SKILL_MANA:int = 4;
      
      protected static const PROFESSION_MASK_PALADIN:int = 1 << PROFESSION_PALADIN;
      
      static var s_IconCache:tibia.creatures.battlelistWidgetClasses.CreatureIconCache = new tibia.creatures.battlelistWidgetClasses.CreatureIconCache(24,24,NUM_CREATURES);
      
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
      
      public static const HEIGHT_HINT:int = 28;
      
      static var s_Trans:Matrix = new Matrix(1,0,0,1);
      
      protected static const STATE_POISONED:int = 0;
      
      protected static const STATE_BURNING:int = 1;
      
      protected static const SKILL_FIGHTFIST:int = 12;
      
      protected static const STATE_DROWNING:int = 8;
      
      static var s_NameCache:TextFieldCache = new TextFieldCache(192,TextFieldCache.DEFAULT_HEIGHT,NUM_CREATURES,true);
      
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
      
      {
         s_InitialiseStyle();
      }
      
      protected var m_HaveTimer:Boolean = false;
      
      private var m_UncommittedData:Boolean = false;
      
      protected var m_Data:Creature = null;
      
      private var m_InvalidHaveTimer:Boolean = false;
      
      public function BattlelistItemRenderer()
      {
         super();
      }
      
      private static function s_InitialiseStyle() : void
      {
         var Selector:String = "BattlelistItemRenderer";
         var Decl:CSSStyleDeclaration = StyleManager.getStyleDeclaration(Selector);
         if(Decl == null)
         {
            Decl = new CSSStyleDeclaration(Selector);
         }
         Decl.factory = function():void
         {
            BattlelistItemRenderer.color = 13684944;
            BattlelistItemRenderer.paddingBottom = 2;
            BattlelistItemRenderer.paddingLeft = 2;
            BattlelistItemRenderer.paddingRight = 2;
            BattlelistItemRenderer.paddingTop = 2;
            BattlelistItemRenderer.horizontalGap = 2;
            BattlelistItemRenderer.verticalGap = 2;
            BattlelistItemRenderer.healthbarHeight = 5;
            BattlelistItemRenderer.healthbarWidth = 50;
         };
         StyleManager.setStyleDeclaration(Selector,Decl,true);
      }
      
      protected function onDataChange(param1:PropertyChangeEvent) : void
      {
         if(param1 != null)
         {
            switch(param1.property)
            {
               case "partyFlag":
               case "pkFlag":
               case "warFlag":
                  invalidateDisplayList();
                  this.invalidateTimer();
                  break;
               case "name":
               case "outfit":
                  invalidateDisplayList();
            }
         }
      }
      
      override protected function commitProperties() : void
      {
         var _loc1_:Boolean = false;
         if(this.m_UncommittedData)
         {
            toolTip = this.m_Data != null?this.m_Data.name:null;
            this.m_UncommittedData = false;
         }
         if(this.m_InvalidHaveTimer)
         {
            _loc1_ = this.m_Data != null && (this.m_Data.partyFlag != PARTY_NONE || this.m_Data.pkFlag != PK_NONE || this.m_Data.warFlag != WAR_NONE);
            if(Boolean(_loc1_) && !this.m_HaveTimer)
            {
               Tibia.s_GetSecondaryTimer().addEventListener(TimerEvent.TIMER,this.onTimer);
            }
            else if(!_loc1_ && Boolean(this.m_HaveTimer))
            {
               Tibia.s_GetSecondaryTimer().removeEventListener(TimerEvent.TIMER,this.onTimer);
            }
            this.m_HaveTimer = _loc1_;
            this.m_InvalidHaveTimer = false;
         }
         super.commitProperties();
      }
      
      public function set data(param1:Object) : void
      {
         if(this.m_Data != null)
         {
            this.m_Data.removeEventListener(PropertyChangeEvent.PROPERTY_CHANGE,this.onDataChange);
         }
         this.m_Data = param1 as Creature;
         this.m_UncommittedData = true;
         invalidateDisplayList();
         invalidateProperties();
         this.invalidateTimer();
         if(this.m_Data != null)
         {
            this.m_Data.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE,this.onDataChange,false,EventPriority.DEFAULT,true);
         }
      }
      
      protected function onTimer(param1:TimerEvent) : void
      {
         if(param1 != null)
         {
            invalidateDisplayList();
         }
      }
      
      public function get viewMetricsAndPadding() : EdgeMetrics
      {
         return new EdgeMetrics(getStyle("paddingLeft"),getStyle("paddingTop"),getStyle("paddingRight"),getStyle("paddingBottom"));
      }
      
      public function get data() : Object
      {
         return this.m_Data;
      }
      
      override public function styleChanged(param1:String) : void
      {
         switch(param1)
         {
            case "healthbarHeight":
            case "healthbarWidth":
               invalidateSize();
               break;
            default:
               super.styleChanged(param1);
         }
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc3_:EdgeMetrics = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:BitmapData = null;
         var _loc11_:Rectangle = null;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:uint = 0;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         super.updateDisplayList(param1,param2);
         graphics.clear();
         graphics.beginFill(65280,0);
         graphics.drawRect(0,0,param1,param2);
         graphics.endFill();
         if(this.m_Data != null)
         {
            _loc3_ = this.viewMetricsAndPadding;
            _loc4_ = _loc3_.left;
            _loc5_ = _loc3_.top;
            _loc6_ = getStyle("horizontalGap");
            _loc7_ = getStyle("verticalGap");
            _loc8_ = param1 - _loc4_ - _loc3_.right;
            _loc9_ = param2 - _loc3_.top - _loc3_.bottom;
            _loc10_ = null;
            if(this.m_Data.extendedMarkID != CreatureStorage.MARK_UNMARKED)
            {
               _loc10_ = CreatureStorage.s_GetCreatureMark(this.m_Data.extendedMarkID,CREATURE_MARK_SIZE_NORMAL,s_Rect);
               s_Trans.tx = -(s_Rect.x + (s_Rect.width - CREATURE_MARK_SIZE_NORMAL) / 2) + _loc4_;
               s_Trans.ty = -(s_Rect.y + (s_Rect.height - CREATURE_MARK_SIZE_NORMAL) / 2) + _loc5_;
               graphics.beginBitmapFill(_loc10_,s_Trans,false,false);
               graphics.drawRect(_loc4_,_loc5_,CREATURE_MARK_SIZE_NORMAL,CREATURE_MARK_SIZE_NORMAL);
            }
            _loc11_ = s_IconCache.getItem(this.m_Data.name,this.m_Data);
            if(_loc11_ != null)
            {
               s_Trans.tx = -_loc11_.x + _loc4_;
               s_Trans.ty = -_loc11_.y + _loc5_;
               graphics.beginBitmapFill(s_IconCache,s_Trans,false,false);
               graphics.drawRect(_loc4_,_loc5_,s_IconCache.slotWidth,s_IconCache.slotHeight);
            }
            else
            {
               log("BattleListItemRenderer.updateDisplayList: No icon found for creature " + this.m_Data.name + ".");
            }
            _loc4_ = _loc4_ + (s_IconCache.slotWidth + _loc6_);
            _loc8_ = param1 - _loc4_ - _loc3_.right;
            _loc12_ = Math.floor(_loc8_);
            _loc13_ = Math.max(CreatureStorage.STATE_FLAG_SIZE,s_NameCache.slotHeight - 4);
            if(Boolean(this.m_Data.isHuman) && this.m_Data.warFlag > WAR_NONE)
            {
               _loc12_ = _loc12_ - CreatureStorage.STATE_FLAG_SIZE;
               _loc10_ = CreatureStorage.s_GetWarFlag(this.m_Data.warFlag,s_Rect);
               s_Trans.tx = -s_Rect.x + _loc4_ + _loc12_;
               s_Trans.ty = -s_Rect.y + _loc5_ + (_loc13_ - CreatureStorage.STATE_FLAG_SIZE) / 2;
               graphics.beginBitmapFill(_loc10_,s_Trans,false,false);
               graphics.drawRect(_loc4_ + _loc12_,_loc5_ + (_loc13_ - CreatureStorage.STATE_FLAG_SIZE) / 2,s_Rect.width,s_Rect.height);
               _loc12_ = _loc12_ - _loc6_;
            }
            if(Boolean(this.m_Data.isHuman) && Boolean(this.m_Data.pkFlag))
            {
               _loc12_ = _loc12_ - CreatureStorage.STATE_FLAG_SIZE;
               if(this.m_Data.pkEnd <= 0 || Boolean(Tibia.s_GetFrameFlash()))
               {
                  _loc10_ = CreatureStorage.s_GetPKFlag(this.m_Data.pkFlag,s_Rect);
                  s_Trans.tx = -s_Rect.x + _loc4_ + _loc12_;
                  s_Trans.ty = -s_Rect.y + _loc5_ + (_loc13_ - CreatureStorage.STATE_FLAG_SIZE) / 2;
                  graphics.beginBitmapFill(_loc10_,s_Trans,false,false);
                  graphics.drawRect(_loc4_ + _loc12_,_loc5_ + (_loc13_ - CreatureStorage.STATE_FLAG_SIZE) / 2,s_Rect.width,s_Rect.height);
               }
               _loc12_ = _loc12_ - _loc6_;
            }
            if(Boolean(this.m_Data.isHuman) && this.m_Data.partyFlag > PARTY_NONE)
            {
               _loc12_ = _loc12_ - CreatureStorage.STATE_FLAG_SIZE;
               if(this.m_Data.partyFlag != PARTY_LEADER_SEXP_INACTIVE_GUILTY && this.m_Data.partyFlag != PARTY_MEMBER_SEXP_INACTIVE_GUILTY || Boolean(Tibia.s_GetFrameFlash()))
               {
                  _loc10_ = CreatureStorage.s_GetPartyFlag(this.m_Data.partyFlag,s_Rect);
                  s_Trans.tx = -s_Rect.x + _loc4_ + _loc12_;
                  s_Trans.ty = -s_Rect.y + _loc5_ + (_loc13_ - CreatureStorage.STATE_FLAG_SIZE) / 2;
                  graphics.beginBitmapFill(_loc10_,s_Trans,false,false);
                  graphics.drawRect(_loc4_ + _loc12_,_loc5_ + (_loc13_ - CreatureStorage.STATE_FLAG_SIZE) / 2,s_Rect.width,s_Rect.height);
               }
               _loc12_ = _loc12_ - _loc6_;
            }
            _loc14_ = 0;
            switch(this.m_Data.extendedMarkID)
            {
               case CreatureStorage.MARK_AIM:
                  _loc14_ = 16777215;
                  break;
               case CreatureStorage.MARK_AIM_ATTACK:
               case CreatureStorage.MARK_ATTACK:
                  _loc14_ = 16711680;
                  break;
               case CreatureStorage.MARK_AIM_FOLLOW:
               case CreatureStorage.MARK_FOLLOW:
                  _loc14_ = 65280;
                  break;
               default:
                  _loc14_ = getStyle("color");
            }
            _loc11_ = s_NameCache.getItem(this.m_Data.name + String(_loc14_) + String(_loc12_),this.m_Data.name,_loc14_,_loc12_);
            if(_loc11_ != null)
            {
               s_Trans.tx = -_loc11_.x + _loc4_;
               s_Trans.ty = -_loc11_.y + _loc5_ + (_loc13_ - (s_NameCache.slotHeight - 4)) / 2 - 2;
               graphics.beginBitmapFill(s_NameCache,s_Trans,false,false);
               graphics.drawRect(_loc4_,_loc5_ + (_loc13_ - (s_NameCache.slotHeight - 4)) / 2 - 2,_loc12_,s_NameCache.slotHeight);
            }
            else
            {
               log("BattleListItemRenderer.updateDisplayList: No name tag found for creature " + this.m_Data.name + ".");
            }
            _loc15_ = (_loc8_ - 2) * this.m_Data.hitpointsPercent / 100;
            _loc16_ = getStyle("healthbarHeight");
            graphics.beginFill(0,1);
            graphics.drawRect(_loc4_,param2 - _loc3_.bottom - _loc16_,_loc8_,_loc16_);
            graphics.beginFill(Creature.s_GetHealthColour(this.m_Data.hitpointsPercent).RGB,1);
            graphics.drawRect(_loc4_ + 1,param2 - _loc3_.bottom - _loc16_ + 1,_loc15_,_loc16_ - 2);
         }
         graphics.endFill();
      }
      
      protected function invalidateTimer() : void
      {
         this.m_InvalidHaveTimer = true;
         invalidateProperties();
      }
      
      override protected function measure() : void
      {
         var _loc1_:EdgeMetrics = null;
         super.measure();
         _loc1_ = this.viewMetricsAndPadding;
         var _loc2_:Number = s_IconCache.slotWidth + getStyle("horizontalGap") + Math.max(CreatureStorage.STATE_FLAG_SIZE,s_NameCache.slotWidth,getStyle("healthbarWidth"));
         var _loc3_:Number = Math.max(s_IconCache.slotHeight,Math.max(CreatureStorage.STATE_FLAG_SIZE,s_NameCache.slotHeight) + getStyle("verticalGap") + getStyle("healthbarHeight"));
         measuredMinWidth = measuredWidth = _loc1_.left + _loc2_ + _loc1_.right;
         measuredMinHeight = measuredHeight = _loc1_.top + _loc3_ + _loc1_.bottom;
      }
   }
}
