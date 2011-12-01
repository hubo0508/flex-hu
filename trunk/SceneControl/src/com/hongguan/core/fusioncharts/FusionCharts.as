package com.hongguan.core.fusioncharts
{
    import com.encoder.*;
    import com.events.FCEvent;
    import com.flx.events.*;
    import com.flx.external.FlashInterface;
    import com.fusioncharts.components.FCChartData;
    
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.net.*;
    import flash.utils.*;
    
    import mx.controls.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.codec.JPEGEncoder;
    import mx.graphics.codec.PNGEncoder;

    public class FusionCharts extends UIComponent
    {
        private var loadedCheck:Boolean;
        private var success:Boolean;
        private var loader:Loader;
        private var chartType:String;
        private var xmlDATA:String;
        private var folder:String;
        private var fileFormat:String;
        private var isURLprovided:Boolean;
        private var styleDATA:String;
        private var stageInit:Boolean = false;
        private var Id:String;
        private var isFolderChanged:Boolean;
        private var _1281302716fcBack:Class;
        private var useDefaultData:Boolean;
        private var paramDATA:String;
        private var errorData:String;
        private var xmlURL:String;
        private var imgData:ByteArray;
        private var fileName:String;
        private var chartMessage:String;
        private var debug:String;
        private var _FCChartData:FCChartData;
        private var trendDATA:String;
        private var vTrendDATA:String;
        private var _xmlDATA:String;
        private var hTrendDATA:String;
        private var isChartChanged:Boolean;
        private var isXMLprovided:Boolean;
        private var isLargeData:Boolean;
        private var isFlexDataProvided:Boolean;
        private var img:Image;
        private static var isPublished:Boolean = false;
        private static var isJSChecked:Boolean = false;

        public function FusionCharts() : void
        {
            stageInit = false;
            _1281302716fcBack = FusionCharts_fcBack;
            xmlURL = "";
            xmlDATA = "";
            chartMessage = "";
            paramDATA = "<chart>";
            var _loc_1:Boolean = false;
            isXMLprovided = false;
            //var _loc_1:* = _loc_1;
            isURLprovided = _loc_1;
            //var _loc_1:* = _loc_1;
            isFolderChanged = _loc_1;
            //var _loc_1:* = _loc_1;
            isChartChanged = _loc_1;
            //var _loc_1:* = _loc_1;
            loadedCheck = _loc_1;
            isFlexDataProvided = _loc_1;
            debug = "0";
            chartType = "Column2D";
            folder = "fusioncharts/";
            errorData = "";
            addEventListener(Event.ENTER_FRAME, stageEnter);
            return;
        }// end function

        private function dataLoadErrorHandler(event:FlashInterfaceEvent) : void
        {
            dispatchEvent(new FCEvent(FCEvent.FCDataLoadErrorEvent, this.name));
            return;
        }// end function

        private function loaded(event:Event) : void
        {
            var e:* = event;
            loader.x = 0;
            loader.y = 0;
            var _loc_3:Boolean = false;
            loadedCheck = false;
            //var _loc_3:* = _loc_3;
            isXMLprovided = _loc_3;
            //var _loc_3:* = _loc_3;
            isURLprovided = _loc_3;
            //var _loc_3:* = _loc_3;
            isFolderChanged = _loc_3;
            isChartChanged = _loc_3;
            dispatchEvent(new FCEvent(FCEvent.FCLoadEvent, this.name));
            try
            {
                if (!isPublished)
                {
                   //FlashInterface.publish(Application.application.parent, true);
					FlashInterface.publish(FlexGlobals.topLevelApplication.parent, true);
                    isPublished = true;
                }
                FlashInterface.addEventListener(Id + "_linkClick", linkClickHandler);
                FlashInterface.addEventListener(Id + "_chartRendered", renderHandler);
                FlashInterface.addEventListener(Id + "_funcExecute", executeHandler);
                FlashInterface.addEventListener(Id + "_exportChart", exportHandler);
                FlashInterface.addEventListener(Id + "_dataLoaded", dataLoadedHandler);
                FlashInterface.addEventListener(Id + "_dataLoadError", dataLoadErrorHandler);
                FlashInterface.addEventListener(Id + "_dataXMLInvalid", dataXMLInvalidHandler);
                FlashInterface.addEventListener(Id + "_noDataToDisplay", noDataToDisplayHandler);
                FlashInterface.addEventListener(Id + "_logoLoader", logoLoaderHandler);
                FlashInterface.addEventListener(Id + "_bgLoader", bgLoaderHandler);
                FlashInterface.addEventListener(Id + "_printChart", printHandler);
                FlashInterface.addEventListener(Id + "_internalEvent", readyForDataHandler);
            }
            catch (err:Error)
            {
                exIntError();
            }
            return;
        }// end function

        private function getXMLdata() : String
        {
            if (isFlexDataProvided)
            {
                xmlDATA = paramDATA + trendDATA + vTrendDATA + hTrendDATA + styleDATA + _xmlDATA;
                if (xmlDATA == null)
                {
                    xmlDATA = "";
                }
                isFlexDataProvided = false;
            }
            return xmlDATA;
        }// end function

        private function loaderErrorHandler(event:Event) : void
        {
            errorData = chartType + ".swf file could not be found at the specified location. If you have specified custom path for chart SWF files, please make sure it is valid. Else, if you are using the default path (/FusionCharts), please make sure that you\'ve copied the relevant chart SWF files in that folder.";
            dispatchEvent(new FCEvent(FCEvent.FCErrorEvent, errorData));
            return;
        }// end function

        private function completeHandler(event:Event) : void
        {
            var bmp:Bitmap;
            var bmpData:BitmapData;
            var pixelData:Array;
            var i:Number;
            var j:Number;
            var e:* = event;
            bmp = e.currentTarget.content;
            bmpData = bmp.bitmapData;
            pixelData = new Array();
            i;
            while (i < bmpData.height)
            {
                
                j;
                while (j < bmpData.width)
                {
                    
                    pixelData.push(bmpData.getPixel32(j, i));
                    j = (j + 1);
                }
                i = (i + 1);
            }
            try
            {
                FlashInterface.call(Id + ".chart.getLogoImage", pixelData.toString(), bmpData.width, bmpData.height);
            }
            catch (err:Error)
            {
                exIntError();
            }
            return;
        }// end function

        private function dataLoadedHandler(event:FlashInterfaceEvent) : void
        {
            dispatchEvent(new FCEvent(FCEvent.FCDataLoadedEvent, this.name));
            return;
        }// end function

        public function get FCChartType() : String
        {
            return chartType;
        }// end function

        public function FCStyles(value:Object) : void
        {
            isFlexDataProvided = true;
            _FCChartData.FCStyles = value;
            styleDATA = String(_FCChartData.FCStyles);
            return;
        }// end function

        private function readyForDataHandler(event:FlashInterfaceEvent) : void
        {
            var _loc_2:String = null;
            if (xmlURL == "")
            {
            }
            if (isLargeData)
            {
            }
            if (event.data == "loaded")
            {
                _loc_2 = getXMLdata();
                FlashInterface.call(Id + ".setDataXML", _loc_2);
                isLargeData = false;
            }
            else
            {
                if (xmlURL != "")
                {
                }
                if (isLargeData)
                {
                }
                if (event.data == "loaded")
                {
                    FlashInterface.call(Id + ".setDataURL", xmlURL);
                    isLargeData = false;
                }
            }
            dispatchEvent(new FCEvent("_FCInternalEvent", "readyForData"));
            return;
        }// end function

        public function get FCDataXML() : String
        {
            return xmlDATA;
        }// end function

        public function FCRender() : void
        {
            var lc1:LocalConnection;
            var lc2:LocalConnection;
            var temp_DataXML:String;
            if (!this.stageInit)
            {
                return;
            }
            if (isChartChanged)
            {
            }
            if (loadedCheck)
            {
            }
            if (isFolderChanged)
            {
                if (loader.content != null)
                {
                    try
                    {
                        FlashInterface.call(Id + ".chart.destroy");
                    }
                    catch (err:Error)
                    {
                        exIntError();
                    }
                    loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, loaded);
                    loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, loaderErrorHandler);
                    removeChild(loader);
                    loader = null;
                    try
                    {
                        lc1 = new LocalConnection();
                        lc2 = new LocalConnection();
                        lc1.connect("gcConnection");
                        lc2.connect("gcConnection");
                    }
                    catch (e:Error)
                    {
                    }
                }
                loader = new Loader();
                loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loaded);
                loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, loaderErrorHandler);
                addChild(loader);
                Id = loader.name.toString();
                isChartChanged = false;
                isFolderChanged = false;
                loadedCheck = true;
                draw();
            }
            else if (isURLprovided)
            {
                try
                {
                    FlashInterface.call(Id + ".setDataURL", xmlURL);
                }
                catch (err:Error)
                {
                    exIntError();
                }
                isURLprovided = false;
            }
            else if (isXMLprovided)
            {
                try
                {
                    FlashInterface.call(Id + ".setDataXML", xmlDATA);
                }
                catch (err:Error)
                {
                    exIntError();
                }
                isXMLprovided = false;
            }
            else
            {
                temp_DataXML = getXMLdata();
                try
                {
                    FlashInterface.call(Id + ".setDataXML", temp_DataXML);
                }
                catch (err:Error)
                {
                    exIntError();
                }
            }
            return;
        }// end function

        public function FCParams(value:Object) : void
        {
            isFlexDataProvided = true;
            _FCChartData.FCParams = value;
            paramDATA = String(_FCChartData.FCParams);
            return;
        }// end function

        public function set FCDebugMode(value:Boolean) : void
        {
            debug = value == true ? ("1") : ("0");
            return;
        }// end function

        private function bgCompleteHandler(event:Event) : void
        {
            var bmp:Bitmap;
            var bmpData:BitmapData;
            var pixelData:Array;
            var i:Number;
            var j:Number;
            var e:* = event;
            bmp = e.currentTarget.content;
            bmpData = bmp.bitmapData;
            pixelData = new Array();
            i;
            while (i < bmpData.height)
            {
                
                j;
                while (j < bmpData.width)
                {
                    
                    pixelData.push(bmpData.getPixel32(j, i));
                    j = (j + 1);
                }
                i = (i + 1);
            }
            try
            {
                FlashInterface.call(Id + ".chart.getBgImage", pixelData.toString(), bmpData.width, bmpData.height);
            }
            catch (err:Error)
            {
                exIntError();
            }
            return;
        }// end function

        public function FCGetXMLData() : String
        {
            var temp:Object;
            try
            {
                temp = FlashInterface.call(Id + ".chart.returnXML");
            }
            catch (err:Error)
            {
                exIntError();
            }
            return temp.result;
        }// end function

        private function renderHandler(event:FlashInterfaceEvent) : void
        {
            dispatchEvent(new FCEvent(FCEvent.FCRenderEvent, this.name));
            return;
        }// end function

        private function exportComplete(event:Event) : void
        {
            var _loc_2:Object = null;
            this.success = true;
            _loc_2 = new Object();
            _loc_2.fileName = this.fileName;
            _loc_2.fileFormat = this.fileFormat;
            _loc_2.success = this.success;
            dispatchEvent(new FCEvent(FCEvent.FCExported, _loc_2));
            return;
        }// end function

        public function FChTrendLines(value:Object) : void
        {
            isFlexDataProvided = true;
            _FCChartData.FChTrendLines = value;
            hTrendDATA = String(_FCChartData.FChTrendLines);
            return;
        }// end function

        private function exportHandler(event:FlashInterfaceEvent) : void
        {
            var bmp:BitmapData;
            var matrix:Matrix;
            var fileType:String;
            var jpg:JPEGEncoder;
            var png:PNGEncoder;
            var pdf:PDFEncoder;
            var jpg2:JPEGEncoder;
            var saver:FileReference;
            var e:* = event;
            bmp = new BitmapData(this.width, this.height, true);
            matrix = new Matrix();
            bmp.draw(this, matrix);
            fileName = e.data.fileName != "" ? (e.data.fileName) : ("FusionCharts");
            switch(String(e.data.format).toUpperCase())
            {
                case "JPG":
                {
                    jpg = new JPEGEncoder(100);
                    imgData = jpg.encode(bmp);
                    fileFormat = "jpg";
                    break;
                }
                case "PNG":
                {
                    png = new PNGEncoder();
                    imgData = png.encode(bmp);
                    fileFormat = "png";
                    break;
                }
                case "PDF":
                {
                    pdf = new PDFEncoder();
                    pdf.setBitmapData(bmp, this.width, this.height);
                    imgData = pdf.encode();
                    fileFormat = "pdf";
                    break;
                }
                default:
                {
                    jpg2 = new JPEGEncoder(100);
                    imgData = jpg2.encode(bmp);
                    fileFormat = "jpg";
                    break;
                    break;
                }
            }
            try
            {
                saver = new FileReference();
                saver.addEventListener(Event.COMPLETE, exportComplete);
                saver.addEventListener(Event.CANCEL, exportCancel);
                saver.save(imgData, fileName + "." + fileFormat);
            }
            catch (err:Error)
            {
                savingError();
            }
            return;
        }// end function

        public function set FCDataXML(value:String) : void
        {
            xmlDATA = value;
            isXMLprovided = true;
            return;
        }// end function

        private function exIntError() : void
        {
            errorData = "FusionCharts for Flex needs External-Interface for cross AVM communication between your Flex project and the charts. It seems that you\'ve not set Flash security permissions for this folder on your file system. As such, External-Interface is unable to initiate a connection. Please refer to \"FusionCharts for Flex\" documentation on how to set proper security permissions for your folder.";
            if (!isJSChecked)
            {
                dispatchEvent(new FCEvent(FCEvent.FCErrorEvent, errorData));
                isJSChecked = true;
            }
            return;
        }// end function

        public function FCGetAttribute(value:String) : String
        {
            var temp:Object;
            var value:* = value;
            try
            {
                temp = FlashInterface.call(Id + ".chart.returnChartAttribute", value);
            }
            catch (err:Error)
            {
                exIntError();
            }
            return temp.result;
        }// end function

        override protected function measure() : void
        {
            super.measure();
            var _loc_1:int = 400;
            measuredMinWidth = 400;
            measuredWidth = _loc_1;
            //var _loc_1:int = 300;
            measuredMinHeight = 300;
            measuredHeight = 300;
            return;
        }// end function

        private function draw() : void
        {
            var _loc_1:Rectangle = null;
            var _loc_2:URLRequest = null;
            var _loc_3:URLRequest = null;
            if (!this.stageInit)
            {
                return;
            }
            if (!loader.content)
            {
            }
            if (chartType != null)
            {
                defaultData();
                _loc_2 = new URLRequest(folder + chartType + ".swf?flashId=" + Id + "&defaultdatafile=Data.xml" + "&dataURL=" + xmlURL + "&dataXML=" + encodeURIComponent(getXMLdata()) + "&chartwidth=" + unscaledWidth + "&chartheight=" + unscaledHeight + chartMessage + "&debugMode=" + debug + "&mode=flex"+"&key=INFOSOFTGLOBAL.COM&key1=FUSIONCHARTS.COM");
                if (_loc_2.url.length > 1500)
                {
                    _loc_3 = new URLRequest(folder + chartType + ".swf?flashId=" + Id + "&chartwidth=" + unscaledWidth + "&chartheight=" + unscaledHeight + chartMessage + "&debugMode=" + debug + "&mode=flex"+"&key=INFOSOFTGLOBAL.COM&key1=FUSIONCHARTS.COM");
                    loader.load(_loc_3);
                    isLargeData = true;
                }
                else
                {
                    loader.load(_loc_2);
                }
            }
            _loc_1 = new Rectangle(0, 0, unscaledWidth, unscaledHeight);
            loader.scrollRect = _loc_1;
            return;
        }// end function

        private function defaultData() : void
        {
            if (useDefaultData)
            {
            }
            if (!isXMLprovided)
            {
            }
            if (xmlDATA == "")
            {
            }
            if (!isURLprovided)
            {
                if (chartType != "Column2D")
                {
                }
                if (chartType != "Column3D")
                {
                }
                if (chartType != "Pie3D")
                {
                }
                if (chartType != "Pie2D")
                {
                }
                if (chartType != "Line")
                {
                }
                if (chartType != "Bar2D")
                {
                }
                if (chartType != "Area2D")
                {
                }
                if (chartType != "Doughnut2D")
                {
                }
                if (chartType != "Doughnut3D")
                {
                }
                if (chartType != "Spline")
                {
                }
                if (chartType == "SplineArea")
                {
                    xmlDATA = "<chart caption=\'Product-wise sales\' subcaption=\'For the year 2008\' xAxisName=\'Product\' yAxisName=\'Revenue\' numberPrefix=\'$\' chartRightMargin=\'40\'>" + "<set label=\'Product A\' value=\'235000\' />" + "<set label=\'Product B\' value=\'125100\' />" + "<set label=\'Product C\' value=\'464200\' />" + "<set label=\'Product D\' value=\'434500\' />" + "<styles>" + "<definition><style type=\'font\' name=\'captionFont\' size=\'16\' /></definition><application><apply toObject=\'caption\' styles=\'captionFont\' /></application>" + "</styles>" + "</chart>";
                }
                if (chartType != "Funnel")
                {
                }
                if (chartType == "Pyramid")
                {
                    xmlDATA = "<chart caption=\'Conversion Ratio\' subcaption=\'May 2007\' decimals=\'1\' baseFontSize=\'11\' isSliced=\'0\' useSameSlantAngle=\'1\' isHollow=\'0\' labelDistance=\'15\'>" + "<set label=\'Website Visits\' value=\'385634\' />" + "<set label=\'Downloads\' value=\'175631\' />" + "<set label=\'Interested to buy\' value=\'84564\' /> " + "<set label=\'Contract finalized\' value=\'35654\' />" + "<set label=\'Purchased\' value=\'18342\' />" + "<styles>" + "<definition>" + "<style type=\'font\' name=\'captionFont\' size=\'15\' />" + "</definition>" + "<application>" + "<apply toObject=\'CAPTION\' styles=\'captionFont\' />" + "</application>" + "</styles>" + "</chart>";
                }
                if (chartType != "MSColumn2D")
                {
                }
                if (chartType != "MSColumn3D")
                {
                }
                if (chartType != "MSLine")
                {
                }
                if (chartType != "MSArea")
                {
                }
                if (chartType != "MSBar2D")
                {
                }
                if (chartType != "MSBar3D")
                {
                }
                if (chartType != "MSSpline")
                {
                }
                if (chartType != "MSSplineArea")
                {
                }
                if (chartType != "ScrollColumn2D")
                {
                }
                if (chartType != "ScrollLine2D")
                {
                }
                if (chartType != "ScrollArea2D")
                {
                }
                if (chartType != "LogMSColumn2D")
                {
                }
                if (chartType != "LogMSLine")
                {
                }
                if (chartType != "InverseMSArea")
                {
                }
                if (chartType != "InverseMSColumn2D")
                {
                }
                if (chartType != "InverseMSLine")
                {
                }
                if (chartType == "Radar")
                {
                    xmlDATA = "<chart caption=\'Product-wise sales\' subcaption=\'Comparison\' numberPrefix=\'$\'  chartRightMargin=\'40\' xAxisName=\'Product\' yAxisName=\'Revenue\' >" + "<categories>" + "<category label=\'Product A\' />" + "<category label=\'Product B\' />" + "<category label=\'Product C\' />" + "<category label=\'Product D\' />" + "<category label=\'Product E\' />" + "</categories>" + "<dataset seriesName=\'2008\'>" + "<set value=\'235000\' />" + "<set value=\'125100\' />" + "<set value=\'464200\' />" + "<set value=\'434500\' />" + "<set value=\'368500\' />" + "</dataset>" + "<dataset seriesName=\'2007\'>" + "<set value=\'198000\' />" + "<set value=\'409300\' />" + "<set value=\'253600\' />" + "<set value=\'345100\' />" + "<set value=\'42100\' />" + "</dataset>" + "<styles>" + "<definition>" + "<style type=\'font\' name=\'captionFont\' size=\'16\' />" + "</definition>" + "<application>" + "<apply toObject=\'caption\' styles=\'captionFont\' />" + "</application>" + "</styles>" + "</chart>";
                }
                if (chartType != "StackedColumn2D")
                {
                }
                if (chartType != "StackedColumn3D")
                {
                }
                if (chartType != "StackedArea2D")
                {
                }
                if (chartType != "StackedBar2D")
                {
                }
                if (chartType != "StackedBar3D")
                {
                }
                if (chartType == "ScrollStackedColumn2D")
                {
                    xmlDATA = "<chart caption=\'Product-wise sales\' subcaption=\'Comparison\' numberPrefix=\'$\' chartRightMargin=\'40\' xAxisName=\'Product\' yAxisName=\'Revenue\' >" + "<categories>" + "<category label=\'Product A\' />" + "<category label=\'Product B\' />" + "<category label=\'Product C\' />" + "<category label=\'Product D\' />" + "</categories>" + "<dataset seriesName=\'2008\'>" + "<set value=\'235000\' />" + "<set value=\'125100\' />" + "<set value=\'464200\' />" + "<set value=\'434500\' />" + "</dataset>" + "<dataset seriesName=\'2007\'>" + "<set value=\'198000\' />" + "<set value=\'109300\' />" + "<set value=\'253600\' />" + "<set value=\'345100\' />" + "</dataset>" + "<styles>" + "<definition>" + "<style type=\'font\' name=\'captionFont\' size=\'16\' />" + "</definition>" + "<application>" + "<apply toObject=\'caption\' styles=\'captionFont\' />" + "</application>" + "</styles>" + "</chart>";
                }
                if (chartType != "MSCombi2D")
                {
                }
                if (chartType != "MSColumnLine3D")
                {
                }
                if (chartType != "MSCombi3D")
                {
                }
                if (chartType == "ScrollCombi2D")
                {
                    xmlDATA = "<chart caption=\'Product-wise sales\' subcaption=\'Comparison\' numberPrefix=\'$\'  chartRightMargin=\'40\' xAxisName=\'Product\' yAxisName=\'Revenue\' >" + "<categories>" + "<category label=\'Product A\' />" + "<category label=\'Product B\' />" + "<category label=\'Product C\' />" + "<category label=\'Product D\' />" + "</categories>" + "<dataset seriesName=\'2008\'>" + "<set value=\'235000\' />" + "<set value=\'125100\' />" + "<set value=\'464200\' />" + "<set value=\'434500\' />" + "</dataset>" + "<dataset seriesName=\'2007\' renderAs=\'Line\'>" + "<set value=\'198000\' />" + "<set value=\'109300\' />" + "<set value=\'253600\' />" + "<set value=\'345100\' />" + "</dataset>" + "<styles>" + "<definition>" + "<style type=\'font\' name=\'captionFont\' size=\'16\' />" + "</definition>" + "<application>" + "<apply toObject=\'caption\' styles=\'captionFont\' />" + "</application>" + "</styles>" + "</chart>";
                }
                if (chartType != "MSCombiDY2D")
                {
                }
                if (chartType != "MSColumn3DLineDY")
                {
                }
                if (chartType == "ScrollCombiDY2D")
                {
                    xmlDATA = "<chart caption=\'Product-wise sales\' subcaption=\'Comparison\' numberPrefix=\'$\' chartRightMargin=\'40\' PYAxisName=\'Revenue\' SYAxisName=\'Quantity\'>" + "<categories>" + "<category label=\'Product A\' />" + "<category label=\'Product B\' />" + "<category label=\'Product C\' />" + "<category label=\'Product D\' />" + "</categories>" + "<dataset seriesName=\'Revenue\'>" + "<set value=\'235000\' />" + "<set value=\'125100\' />" + "<set value=\'464200\' />" + "<set value=\'434500\' />" + "</dataset>" + "<dataset seriesName=\'Units\' parentYAxis=\'S\' renderAs=\'Line\'>" + "<set value=\'345\' />" + "<set value=\'434\' />" + "<set value=\'546\' />" + "<set value=\'123\' />" + "</dataset>" + "<styles>" + "<definition>" + "<style type=\'font\' name=\'captionFont\' size=\'16\' />" + "</definition>" + "<application>" + "<apply toObject=\'caption\' styles=\'captionFont\' />" + "</application>" + "</styles>" + "</chart>";
                }
                if (chartType == "StackedColumn3DLineDY")
                {
                    xmlDATA = "<chart caption=\'Product-wise sales\' subcaption=\'Comparison\' numberPrefix=\'$\' chartRightMargin=\'40\' xAxisName=\'Product\' yAxisName=\'Revenue\' >" + "<categories>" + "<category label=\'Product A\' />" + "<category label=\'Product B\' />" + "<category label=\'Product C\' />" + "<category label=\'Product D\' />" + "</categories>" + "<dataset seriesName=\'2008\'>" + "<set value=\'235000\' />" + "<set value=\'125100\' />" + "<set value=\'464200\' />" + "<set value=\'434500\' />" + "<set value=\'434500\' />" + "</dataset>" + "<dataset seriesName=\'2007\'>" + "<set value=\'198000\' />" + "<set value=\'109300\' />" + "<set value=\'253600\' />" + "<set value=\'345100\' />" + "</dataset>" + "<dataset seriesName=\'2007\' parentYAxis=\'S\'>" + "<set value=\'18000\' />" + "<set value=\'179300\' />" + "<set value=\'223600\' />" + "<set value=\'145100\' />" + "</dataset>" + "<styles>" + "<definition>" + "<style type=\'font\' name=\'captionFont\' size=\'16\' />" + "</definition>" + "<application>" + "<apply toObject=\'caption\' styles=\'captionFont\' />" + "</application>" + "</styles>" + "</chart>";
                }
                if (chartType == "Bubble")
                {
                    xmlDATA = "<chart palette=\'3\' numberPrefix=\'$\' is3D=\'1\' animation=\'1\' clipBubbles=\'1\' xAxisMaxValue=\'100\' showPlotBorder=\'0\' xAxisName=\'Stickiness\' yAxisName=\'Cost Per Service\' chartRightMargin=\'30\'>" + "<categories>" + "<category label=\'0%\' x=\'0\' />" + "<category label=\'20%\' x=\'20\' showVerticalLine=\'1\'/>" + " <category label=\'40%\' x=\'40\' showVerticalLine=\'1\'/>" + "<category label=\'60%\' x=\'60\' showVerticalLine=\'1\'/>" + "<category label=\'80%\' x=\'80\' showVerticalLine=\'1\'/>" + "<category label=\'100%\' x=\'100\' showVerticalLine=\'1\'/>" + "</categories>" + "<dataSet showValues=\'0\'>" + "<set x=\'30\' y=\'1.3\' z=\'116\'  name=\'Traders\'/>" + "<set x=\'32\' y=\'3.5\' z=\'99\' name=\'Farmers\'/>" + "<set x=\'8\' y=\'2.1\' z=\'33\' name=\'Individuals\'/>" + "<set x=\'62\' y=\'2.5\' z=\'72\' name=\'Medium Business Houses\'/>" + "<set x=\'78\' y=\'2.3\' z=\'55\' name=\'Corporate Group A\'/>" + "<set x=\'75\' y=\'1.4\' z=\'58\' name=\'Corporate Group C\'/>" + "<set x=\'68\' y=\'3.7\' z=\'80\' name=\'HNW Individuals\'/>" + "<set x=\'50\' y=\'2.1\' z=\'105\' name=\'Small Business Houses\'/>" + "</dataSet>" + "<trendlines>" + "<line startValue=\'2.5\' isTrendZone=\'0\' displayValue=\'Median Cost\' color=\'0372AB\'/>" + "</trendlines>" + "<vTrendlines>" + "<line startValue=\'0\' endValue=\'60\' isTrendZone=\'1\' displayValue=\'Potential Wins\' color=\'663333\' alpha=\'10\'/>" + "<line startValue=\'60\' endValue=\'100\' isTrendZone=\'1\' displayValue=\'Cash Cows\' color=\'990099\' alpha=\'5\'/>" + "</vTrendlines>" + "</chart>";
                }
                if (chartType == "Scatter")
                {
                    xmlDATA = "<chart palette=\'2\' caption=\'Server Performance\' numDivLines=\'13\' yAxisName=\'Response Time (sec)\' xAxisName=\'Server Load (TPS)\' rotateNames=\'0\' showLegend=\'1\' showNames=\'1\' xAxisMaxValue=\'100\' xAxisMinValue=\'20\' yAxisMaxValue=\'7\' decimals=\'1\'>" + "<categories verticalLineColor=\'666666\' verticalLineThickness=\'1\'>" + "<category label=\'20\' x=\'20\' showVerticalLine=\'1\'/>" + "<category label=\'30\' x=\'30\' showVerticalLine=\'1\'/>" + "<category label=\'40\' x=\'40\' showVerticalLine=\'1\'/>" + "<category label=\'50\' x=\'50\' showVerticalLine=\'1\'/>" + "<category label=\'60\' x=\'60\' showVerticalLine=\'1\'/>" + "<category label=\'70\' x=\'70\' showVerticalLine=\'1\'/>" + "<category label=\'80\' x=\'80\' showVerticalLine=\'1\'/>" + "<category label=\'90\' x=\'90\' showVerticalLine=\'1\'/>" + "<category label=\'100\' x=\'100\' showVerticalLine=\'0\'/>" + "</categories>" + "<dataSet seriesName=\'Server 1\' color=\'009900\' anchorSides=\'3\' anchorRadius=\'4\' anchorBgColor=\'D5FFD5\' anchorBorderColor=\'009900\' >" + "<set y=\'2.4\' x=\'21\' />" + "<set y=\'3.5\' x=\'32\' />" + "<set y=\'2.5\' x=\'43\' />" + "<set y=\'4.1\' x=\'48\' />" + "<set y=\'3.5\' x=\'50\' />" + "<set y=\'4.6\' x=\'56\' />" + "<set y=\'4.8\' x=\'59\' />" + "<set y=\'4.9\' x=\'73\' />" + "<set y=\'4.6\' x=\'89\' />" + "<set y=\'4.2\' x=\'93\' />" + "</dataSet>" + "<dataSet seriesName=\'Server 2\' color=\'0000FF\' anchorSides=\'4\' anchorRadius=\'4\' anchorBgColor=\'C6C6FF\' anchorBorderColor=\'0000FF\'>" + "<set y=\'1.4\' x=\'23\'/>" + "<set y=\'1.5\' x=\'29\'/>" + "<set y=\'1.5\' x=\'33\'/>" + "<set y=\'1.1\' x=\'41\'/>" + "<set y=\'1.5\' x=\'47\'/>" + "<set y=\'1.6\' x=\'49\'/>" + "<set y=\'1.8\' x=\'51\'/>" + "<set y=\'1.6\' x=\'57\'/>" + "<set y=\'1.2\' x=\'58\'/>" + "<set y=\'1.9\' x=\'61\'/>" + "<set y=\'1.1\' x=\'63\'/>" + "<set y=\'1.9\' x=\'64\'/>" + "<set y=\'1.7\' x=\'71\'/>" + "<set y=\'1.1\' x=\'77\'/>" + "<set y=\'1.3\' x=\'79\'/>" + "<set y=\'1.7\' x=\'83\'/>" + "<set y=\'1.8\' x=\'89\'/>" + "<set y=\'1.9\' x=\'91\'/>" + "<set y=\'1.0\' x=\'93\'/>" + "</dataSet>" + "<vTrendlines>" + "<line startValue=\'20\' endValue=\'65\' alpha=\'5\' color=\'00FF00\' />" + "<line startValue=\'65\' endValue=\'75\' alpha=\'15\' color=\'FFFF00\' />" + "<line startValue=\'75\' endValue=\'100\' alpha=\'15\' color=\'FF0000\' />" + "</vTrendlines>" + "<hTrendlines>" + "<line startValue=\'5.2\' displayValue=\'Check\' lineThickness=\'2\' color=\'FF0000\' valueOnRight=\'1\' dashed=\'1\' dashGap=\'5\'/>" + "</hTrendlines>" + "</chart>";
                }
            }
            return;
        }// end function

        private function linkClickHandler(event:FlashInterfaceEvent) : void
        {
            dispatchEvent(new FCEvent(FCEvent.FCClickEvent, event.data));
            return;
        }// end function

        public function FCPrintChart() : void
        {
            try
            {
                FlashInterface.call(Id + ".chart.printChart");
            }
            catch (err:Error)
            {
                exIntError();
            }
            return;
        }// end function

        public function get FCDataURL() : String
        {
            return xmlURL;
        }// end function

        public function FCSetDataXML(value:String) : void
        {
            var value:* = value;
            try
            {
                FlashInterface.call(Id + ".setDataXML", value);
            }
            catch (err:Error)
            {
                exIntError();
            }
            return;
        }// end function

        public function FCData(value:Object) : void
        {
            isFlexDataProvided = true;
            _FCChartData = new FCChartData();
            _FCChartData.FCData = value;
            _xmlDATA = String(_FCChartData.FCData);
            return;
        }// end function

        private function executeHandler(event:FlashInterfaceEvent) : void
        {
            var _loc_2:Array = null;
            var _loc_3:String = null;
            var _loc_4:Number = NaN;
            _loc_2 = String(event.data).split(",");
            _loc_3 = "";
            _loc_4 = 1;
            while (_loc_4 < _loc_2.length)
            {
                
                _loc_3 = _loc_3 + _loc_2[_loc_4].toString();
                if (_loc_4 != (_loc_2.length - 1))
                {
                    _loc_3 = _loc_3 + ",";
                }
                _loc_4 = _loc_4 + 1;
            }
//            var _loc_5:* = Application.application;
//            _loc_5.Application.application[_loc_2[0].toString()](_loc_3);
			var _loc_5:* = FlexGlobals.topLevelApplication;
			_loc_5.Application.application[_loc_2[0].toString()](_loc_3);
            return;
        }// end function

        public function get FCDebugMode() : Boolean
        {
            return debug == "1" ? (true) : (false);
        }// end function

        private function stageEnter(event:Event) : void
        {
            if (this.stage != null)
            {
                this.stageInit = true;
                removeEventListener(Event.ENTER_FRAME, stageEnter);
                draw();
            }
            return;
        }// end function

        private function noDataToDisplayHandler(event:FlashInterfaceEvent) : void
        {
            dispatchEvent(new FCEvent(FCEvent.FCNoDataToDisplayEvent, this.name));
            return;
        }// end function

        private function set fcBack(value:Class) : void
        {
            var _loc_2:Object = null;
            _loc_2 = this._1281302716fcBack;
            if (_loc_2 !== value)
            {
                this._1281302716fcBack = value;
                dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fcBack", _loc_2, value));
            }
            return;
        }// end function

        private function dataXMLInvalidHandler(event:FlashInterfaceEvent) : void
        {
            dispatchEvent(new FCEvent(FCEvent.FCDataXMLInvalidEvent, this.name));
            return;
        }// end function

        public function set FCFolder(value:String) : void
        {
            if (value == "")
            {
                folder = "fusioncharts/";
            }
            else if (value == ".")
            {
                folder = "";
            }
            else
            {
                folder = value + "/";
            }
            isFolderChanged = true;
            return;
        }// end function

        override protected function createChildren() : void
        {
            super.createChildren();
            if (!loader)
            {
                loader = new Loader();
                loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loaded);
                loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, loaderErrorHandler);
                addChild(loader);
                Id = loader.name.toString();
            }
            img = new Image();
            addChild(img);
            img.source = fcBack;
            return;
        }// end function

        public function FCSaveAsImage() : void
        {
            try
            {
                FlashInterface.call(Id + ".chart.saveAsImage");
            }
            catch (err:Error)
            {
                exIntError();
            }
            return;
        }// end function

        private function savingError() : void
        {
            errorData = "Flash Player 10 missing or the application is not compiled with Flex SDK 3.3 and FP 10 or illegal parameters provided .";
            dispatchEvent(new FCEvent(FCEvent.FCErrorEvent, errorData));
            return;
        }// end function

        public function FCGetCSVData() : String
        {
            var temp:Object;
            try
            {
                temp = FlashInterface.call(Id + ".chart.exportChartDataCSV");
            }
            catch (err:Error)
            {
                exIntError();
            }
            return temp.result;
        }// end function

        public function set FCUseDefaultData(value:Boolean) : void
        {
            useDefaultData = value;
            return;
        }// end function

        private function get fcBack() : Class
        {
            return this._1281302716fcBack;
        }// end function

        public function FCSetDataURL(value:String) : void
        {
            var value:* = value;
            try
            {
                FlashInterface.call(Id + ".setDataURL", value);
            }
            catch (err:Error)
            {
                exIntError();
            }
            return;
        }// end function

        private function exportCancel(event:Event) : void
        {
            var _loc_2:Object = null;
            this.success = false;
            _loc_2 = new Object();
            _loc_2.fileName = this.fileName;
            _loc_2.fileFormat = this.fileFormat;
            _loc_2.success = this.success;
            dispatchEvent(new FCEvent(FCEvent.FCExported, _loc_2));
            return;
        }// end function

        public function FCGetSignature() : String
        {
            var temp:Object;
            try
            {
                temp = FlashInterface.call(Id + ".chart.signature");
            }
            catch (err:Error)
            {
                exIntError();
            }
            return temp.result;
        }// end function

        private function bgLoaderHandler(event:FlashInterfaceEvent) : void
        {
            var _loc_2:Loader = null;
            _loc_2 = new Loader();
            _loc_2.contentLoaderInfo.addEventListener(Event.COMPLETE, bgCompleteHandler);
            _loc_2.load(new URLRequest(event.data));
            return;
        }// end function

        public function set dataProvider(value:FCChartData) : void
        {
            _xmlDATA = "";
            if (String(value.FCData) != "null")
            {
                isFlexDataProvided = true;
                _xmlDATA = String(value.FCData);
            }
            paramDATA = "<chart>";
            if (String(value.FCParams) != "null")
            {
                paramDATA = String(value.FCParams);
            }
            trendDATA = "";
            if (String(value.FCTrendLines) != "null")
            {
                trendDATA = String(value.FCTrendLines);
            }
            vTrendDATA = "";
            if (String(value.FCvTrendLines) != "null")
            {
                vTrendDATA = String(value.FCvTrendLines);
            }
            hTrendDATA = "";
            if (String(value.FChTrendLines) != "null")
            {
                hTrendDATA = String(value.FChTrendLines);
            }
            styleDATA = "";
            if (String(value.FCStyles) != "null")
            {
                styleDATA = String(value.FCStyles);
            }
            chartMessage = "";
            if (value.PBarLoadingText != null)
            {
                chartMessage = chartMessage + ("&PBarLoadingText=" + encodeURIComponent(value.PBarLoadingText));
            }
            if (value.XMLLoadingText != null)
            {
                chartMessage = chartMessage + ("&XMLLoadingText=" + encodeURIComponent(value.XMLLoadingText));
            }
            if (value.ParsingDataText != null)
            {
                chartMessage = chartMessage + ("&ParsingDataText=" + encodeURIComponent(value.ParsingDataText));
            }
            if (value.ChartNoDataText != null)
            {
                chartMessage = chartMessage + ("&ChartNoDataText=" + encodeURIComponent(value.ChartNoDataText));
            }
            if (value.RenderingChartText != null)
            {
                chartMessage = chartMessage + ("&RenderingChartText=" + encodeURIComponent(value.RenderingChartText));
            }
            if (value.LoadDataErrorText != null)
            {
                chartMessage = chartMessage + ("&LoadDataErrorText=" + encodeURIComponent(value.LoadDataErrorText));
            }
            if (value.InvalidXMLText != null)
            {
                chartMessage = chartMessage + ("&InvalidXMLText=" + encodeURIComponent(value.InvalidXMLText));
            }
            return;
        }// end function

        public function get FCFolder() : String
        {
            return folder;
        }// end function

        public function get FCUseDefaultData() : Boolean
        {
            return useDefaultData;
        }// end function

        public function FCvTrendLines(value:Object) : void
        {
            isFlexDataProvided = true;
            _FCChartData.FCvTrendLines = value;
            vTrendDATA = String(_FCChartData.FCvTrendLines);
            return;
        }// end function

        public function FCExportChart(... args) : void
        {
           // args = new activation;
            var bmp:BitmapData;
            var matrix:Matrix;
            var cases:String;
            var jpg:JPEGEncoder;
            var png:PNGEncoder;
            var pdf:PDFEncoder;
            var jpg2:JPEGEncoder;
            var saver:FileReference;
            var value:* = args;
            bmp = new BitmapData(this.width, this.height, true);
            matrix = new Matrix();
            draw();
            fileName = length > 1 ? (args[1]) : ("FusionCharts");
            cases = length >= 1 ? ([0].toString().toUpperCase()) : ("JPG")
            switch(cases)
            {
                case "JPG":
                {
                    jpg = new JPEGEncoder(100);
                    imgData = jpg.encode(bmp);
                    fileFormat = "jpg";
                    break;
                }
                case "PNG":
                {
                    png = new PNGEncoder();
                    imgData = png.encode(bmp);
                    fileFormat = "png";
                    break;
                }
                case "PDF":
                {
//                    pdf = new PDFEncoder();
//                    pdf.setBitmapData(bmp, this.width, this.height);
//                    imgData = pdf.encode(bmp);
//                    fileFormat = "pdf";
                    break;
                }
                default:
                {
                    jpg2 = new JPEGEncoder(100);
                    imgData = jpg2.encode(bmp);
                    fileFormat = "jpg";
                    break;
                    break;
                }
            }
            try
            {
                saver = new FileReference();
                addEventListener(Event.COMPLETE, exportComplete);
                addEventListener(Event.CANCEL, exportCancel);
                saver.save(imgData, fileName + "." + fileFormat);
            }
            catch (err:Error)
            {
                savingError();
            }
            return;
        }// end function

        private function preview(pWidth:Number, pHeight:Number) : void
        {
           //if (Application.application.toString() == "DesignView0")
			if (FlexGlobals.topLevelApplication.toString() == "DesignView0")
            {
                graphics.clear();
                graphics.beginFill(16777215, 1);
                graphics.lineStyle(1, 0, 1);
                graphics.drawRect(0, 0, pWidth, pHeight);
                graphics.endFill();
                img.width = pWidth < 90 ? (pWidth) : (90);
                img.height = pHeight < 60 ? (pHeight) : (60);
                img.visible = true;
                img.move((pWidth - img.width) / 2, (pHeight - img.height) / 2);
            }
            return;
        }// end function

        private function logoLoaderHandler(event:FlashInterfaceEvent) : void
        {
            var _loc_2:Loader = null;
            _loc_2 = new Loader();
            _loc_2.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
            _loc_2.load(new URLRequest(event.data));
            return;
        }// end function

        public function set FCDataURL(value:String) : void
        {
            xmlURL = encodeURIComponent(value);
            paramDATA = "<chart>";
            var _loc_2:String = "";
            xmlDATA = "";
            //var _loc_2:* = _loc_2;
            _xmlDATA = _loc_2;
            //var _loc_2:* = _loc_2;
            styleDATA = _loc_2;
            //var _loc_2:* = _loc_2;
            hTrendDATA = _loc_2;
            //var _loc_2:* = _loc_2;
            vTrendDATA = _loc_2;
            trendDATA = _loc_2;
            isURLprovided = true;
            return;
        }// end function

        private function printHandler(event:FlashInterfaceEvent) : void
        {
            FCPrintChart();
            return;
        }// end function

        override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number) : void
        {
            super.updateDisplayList(unscaledWidth, unscaledHeight);
            preview(unscaledWidth, unscaledHeight);
            return;
        }// end function

        public function set FCChartType(value:String) : void
        {
            chartType = value;
            isChartChanged = true;
            return;
        }// end function

        public function FCTrendLines(value:Object) : void
        {
            isFlexDataProvided = true;
            _FCChartData.FCTrendLines = value;
            trendDATA = String(_FCChartData.FCTrendLines);
            return;
        }// end function

    }
}
