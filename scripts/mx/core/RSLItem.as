package mx.core
{
   import flash.events.ProgressEvent;
   import flash.events.ErrorEvent;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import mx.events.RSLEvent;
   import flash.net.URLRequest;
   import flash.display.Loader;
   import flash.system.LoaderContext;
   import mx.utils.LoaderUtil;
   import flash.events.Event;
   import flash.system.ApplicationDomain;
   
   use namespace mx_internal;
   
   public class RSLItem
   {
      
      mx_internal static const VERSION:String = "3.6.0.21751";
       
      protected var chainedSecurityErrorHandler:Function;
      
      public var total:uint = 0;
      
      public var loaded:uint = 0;
      
      private var completed:Boolean = false;
      
      protected var chainedRSLErrorHandler:Function;
      
      protected var chainedIOErrorHandler:Function;
      
      protected var chainedCompleteHandler:Function;
      
      private var errorText:String;
      
      protected var chainedProgressHandler:Function;
      
      public var urlRequest:URLRequest;
      
      public var rootURL:String;
      
      protected var url:String;
      
      protected var moduleFactory:mx.core.IFlexModuleFactory;
      
      public function RSLItem(param1:String, param2:String = null, param3:mx.core.IFlexModuleFactory = null)
      {
         super();
         this.url = param1;
         this.rootURL = param2;
         this.moduleFactory = param3;
      }
      
      public function itemProgressHandler(param1:ProgressEvent) : void
      {
         loaded = param1.bytesLoaded;
         total = param1.bytesTotal;
         if(chainedProgressHandler != null)
         {
            chainedProgressHandler(param1);
         }
      }
      
      public function itemErrorHandler(param1:ErrorEvent) : void
      {
         errorText = decodeURI(param1.text);
         completed = true;
         loaded = 0;
         total = 0;
         trace(errorText);
         if(param1.type == IOErrorEvent.IO_ERROR && chainedIOErrorHandler != null)
         {
            chainedIOErrorHandler(param1);
         }
         else if(param1.type == SecurityErrorEvent.SECURITY_ERROR && chainedSecurityErrorHandler != null)
         {
            chainedSecurityErrorHandler(param1);
         }
         else if(param1.type == RSLEvent.RSL_ERROR && chainedRSLErrorHandler != null)
         {
            chainedRSLErrorHandler(param1);
         }
      }
      
      public function load(param1:Function, param2:Function, param3:Function, param4:Function, param5:Function) : void
      {
         chainedProgressHandler = param1;
         chainedCompleteHandler = param2;
         chainedIOErrorHandler = param3;
         chainedSecurityErrorHandler = param4;
         chainedRSLErrorHandler = param5;
         var _loc6_:Loader = new Loader();
         var _loc7_:LoaderContext = new LoaderContext();
         urlRequest = new URLRequest(LoaderUtil.createAbsoluteURL(rootURL,url));
         _loc6_.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,itemProgressHandler);
         _loc6_.contentLoaderInfo.addEventListener(Event.COMPLETE,itemCompleteHandler);
         _loc6_.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,itemErrorHandler);
         _loc6_.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,itemErrorHandler);
         if(moduleFactory != null)
         {
            _loc7_.applicationDomain = moduleFactory.info()["currentDomain"];
         }
         else
         {
            _loc7_.applicationDomain = ApplicationDomain.currentDomain;
         }
         _loc6_.load(urlRequest,_loc7_);
      }
      
      public function itemCompleteHandler(param1:Event) : void
      {
         completed = true;
         if(chainedCompleteHandler != null)
         {
            chainedCompleteHandler(param1);
         }
      }
   }
}
