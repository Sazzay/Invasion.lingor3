class RscTitles {
	class Default {
		idd = -1;
		fadein = 0;
		fadeout = 0;
		duration = 0;
	};
	
	class I_HUD_NOTIFICATION {
		 idd = 9000;
		 movingEnable = 0;
		 enableSimulation = 1;
		 enableDisplay = 1;
		 duration = 2;
		 fadein = 0.7;
		 fadeout = 0.7;
		 name = "I_HUD_NOTIFICATION";
		 onLoad = "with uiNameSpace do { I_HUD_NOTIFICATION = _this select 0}";
		 
		 class controls {
			class RscStructuredText_1500: RscStructuredText
			{
				idc = 1500;
				text = "";
				x = 0.5 * safezoneW + safezoneX - (0.3 * safezoneW / 2);
				y = 0.1 * safezoneH + safezoneY - (0.03 * safezoneH / 2);
				w = 0.3 * safezoneW;
				h = 0.03 * safezoneH;
				size = "0.023 / (getResolution select 5)";
				
				class Attributes
				{
					font = "PuristaMedium";
					color = "#ffffff";
					align = "center";
					shadow = 1;
				};
			};
		 };	
	};
	
	class I_HUD_PROGRESSBAR {
		 idd = 9001;
		 movingEnable = 0;
		 enableSimulation = 1;
		 enableDisplay = 1;
		 duration = 999999;
		 fadein = 0.7;
		 fadeout = 0.7;
		 name = "I_HUD_PROGRESSBAR";
		 onLoad = "with uiNameSpace do { I_HUD_PROGRESSBAR = _this select 0}";
		 
		 class controls {
			class RscPicture_1200: RscPicture {
				idc = 1200;
				text = "textures\progressbar_512.paa";
				x = 0.5 * safezoneW + safezoneX - (0.2666667 * safezoneW / 2);
				y = 0.175 * safezoneH + safezoneY - (0.474074 * safezoneH / 2);
				w = 0.2666667 * safezoneW;
				h = 0.474074 * safezoneH;  
				style = "0x30+0x800";
			};
		 };	
	};
	
	class I_HUD_PROGRESSBAR_TILE {
		 idd = 9002;
		 movingEnable = 0;
		 enableSimulation = 1;
		 enableDisplay = 1;
		 duration = 999999;
		 fadein = 0.7;
		 fadeout = 0.7;
		 name = "I_HUD_PROGRESSBAR_TILE";
		 onLoad = "with uiNameSpace do { I_HUD_PROGRESSBAR_TILE = _this select 0}";
		 
		 class controls {
			class RscPicture_1200: RscPicture {
				idc = 1200;
				text = "textures\progressbar_tile_64.paa";
				x = 0.6 * safezoneW + safezoneX - (0.0333333375 * safezoneW / 2);
				y = 0.175 * safezoneH + safezoneY - (0.05925925 * safezoneH / 2);
				w = 0.0333333375 * safezoneW;
				h = 0.05925925 * safezoneH; 
				style = "0x30+0x800";
			};
		 };	
	};
};