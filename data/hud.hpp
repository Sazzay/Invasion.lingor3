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
		 fadein = 1.5;
		 fadeout = 0.7;
		 name = "I_HUD_PROGRESSBAR";
		 onLoad = "with uiNameSpace do { I_HUD_PROGRESSBAR = _this select 0}";
		 
		 class controls {
			class RscPicture_1200: RscPicture {
				idc = 1200;
				text = "textures\progressbar_512.paa";
				x = 0.5 * safezoneW + safezoneX - (0.1333335 * safezoneW / 2);
				y = 0.05 * safezoneH + safezoneY - (0.237037  * safezoneH / 2);
				w = 0.1333335 * safezoneW;
				h = 0.237037 * safezoneH;      
				style = "0x30+0x800";
			};
		 };	
	};
	
	class I_HUD_PROGRESSBAR_TILES {
		 idd = 9002;
		 movingEnable = 0;
		 enableSimulation = 1;
		 enableDisplay = 1;
		 duration = 999999;
		 fadein = 1.5;
		 fadeout = 0.7;
		 name = "I_HUD_PROGRESSBAR_TILES";
		 onLoad = "with uiNameSpace do { I_HUD_PROGRESSBAR_TILES = _this select 0}";
		 
		 class controls {
			class RscPicture_1200: RscPicture {
				idc = 1200;
				text = "textures\progressbar_tile_64.paa";
				x = 0.4531 * safezoneW + safezoneX - (0.0333333375 * safezoneW / 2);
				y = 0.049 * safezoneH + safezoneY - (0.05925925 * safezoneH / 2);
				w = 0.0333333375 * safezoneW;
				h = 0.05925925 * safezoneH; 
				style = "0x30+0x800";
			};
			class RscPicture_1201: RscPicture {
				idc = 1201;
				text = "textures\progressbar_tile_64.paa";
				x = 0.4578 * safezoneW + safezoneX - (0.0333333375 * safezoneW / 2);
				y = 0.049 * safezoneH + safezoneY - (0.05925925 * safezoneH / 2);
				w = 0.0333333375 * safezoneW;
				h = 0.05925925 * safezoneH; 
				style = "0x30+0x800";
			};
			class RscPicture_1202: RscPicture {
				idc = 1202;
				text = "textures\progressbar_tile_64.paa";
				x = 0.4625 * safezoneW + safezoneX - (0.0333333375 * safezoneW / 2);
				y = 0.049 * safezoneH + safezoneY - (0.05925925 * safezoneH / 2);
				w = 0.0333333375 * safezoneW;
				h = 0.05925925 * safezoneH; 
				style = "0x30+0x800";
			};
			class RscPicture_1203: RscPicture {
				idc = 1203;
				text = "textures\progressbar_tile_64.paa";
				x = 0.4672 * safezoneW + safezoneX - (0.0333333375 * safezoneW / 2);
				y = 0.049 * safezoneH + safezoneY - (0.05925925 * safezoneH / 2);
				w = 0.0333333375 * safezoneW;
				h = 0.05925925 * safezoneH; 
				style = "0x30+0x800";
			};
			class RscPicture_1204: RscPicture {
				idc = 1204;
				text = "textures\progressbar_tile_64.paa";
				x = 0.4719 * safezoneW + safezoneX - (0.0333333375 * safezoneW / 2);
				y = 0.049 * safezoneH + safezoneY - (0.05925925 * safezoneH / 2);
				w = 0.0333333375 * safezoneW;
				h = 0.05925925 * safezoneH; 
				style = "0x30+0x800";
			};
			class RscPicture_1205: RscPicture {
				idc = 1205;
				text = "textures\progressbar_tile_64.paa";
				x = 0.4765 * safezoneW + safezoneX - (0.0333333375 * safezoneW / 2);
				y = 0.049 * safezoneH + safezoneY - (0.05925925 * safezoneH / 2);
				w = 0.0333333375 * safezoneW;
				h = 0.05925925 * safezoneH; 
				style = "0x30+0x800";
			};
			class RscPicture_1206: RscPicture {
				idc = 1206;
				text = "textures\progressbar_tile_64.paa";
				x = 0.4812 * safezoneW + safezoneX - (0.0333333375 * safezoneW / 2);
				y = 0.049 * safezoneH + safezoneY - (0.05925925 * safezoneH / 2);
				w = 0.0333333375 * safezoneW;
				h = 0.05925925 * safezoneH; 
				style = "0x30+0x800";
			};
			class RscPicture_1207: RscPicture {
				idc = 1207;
				text = "textures\progressbar_tile_64.paa";
				x = 0.486 * safezoneW + safezoneX - (0.0333333375 * safezoneW / 2);
				y = 0.049 * safezoneH + safezoneY - (0.05925925 * safezoneH / 2);
				w = 0.0333333375 * safezoneW;
				h = 0.05925925 * safezoneH; 
				style = "0x30+0x800";
			};
			class RscPicture_1208: RscPicture {
				idc = 1208;
				text = "textures\progressbar_tile_64.paa";
				x = 0.4906 * safezoneW + safezoneX - (0.0333333375 * safezoneW / 2);
				y = 0.049 * safezoneH + safezoneY - (0.05925925 * safezoneH / 2);
				w = 0.0333333375 * safezoneW;
				h = 0.05925925 * safezoneH; 
				style = "0x30+0x800";
			};
			class RscPicture_1209: RscPicture {
				idc = 1209;
				text = "textures\progressbar_tile_64.paa";
				x = 0.4953 * safezoneW + safezoneX - (0.0333333375 * safezoneW / 2);
				y = 0.049 * safezoneH + safezoneY - (0.05925925 * safezoneH / 2);
				w = 0.0333333375 * safezoneW;
				h = 0.05925925 * safezoneH; 
				style = "0x30+0x800";
			};
			class RscPicture_1210: RscPicture {
				idc = 1210;
				text = "textures\progressbar_tile_64.paa";
				x = 0.5 * safezoneW + safezoneX - (0.0333333375 * safezoneW / 2);
				y = 0.049 * safezoneH + safezoneY - (0.05925925 * safezoneH / 2);
				w = 0.0333333375 * safezoneW;
				h = 0.05925925 * safezoneH; 
				style = "0x30+0x800";
			};
			class RscPicture_1211: RscPicture {
				idc = 1211;
				text = "textures\progressbar_tile_64.paa";
				x = 0.5047 * safezoneW + safezoneX - (0.0333333375 * safezoneW / 2);
				y = 0.049 * safezoneH + safezoneY - (0.05925925 * safezoneH / 2);
				w = 0.0333333375 * safezoneW;
				h = 0.05925925 * safezoneH; 
				style = "0x30+0x800";
			};
			class RscPicture_1212: RscPicture {
				idc = 1212;
				text = "textures\progressbar_tile_64.paa";
				x = 0.5094 * safezoneW + safezoneX - (0.0333333375 * safezoneW / 2);
				y = 0.049 * safezoneH + safezoneY - (0.05925925 * safezoneH / 2);
				w = 0.0333333375 * safezoneW;
				h = 0.05925925 * safezoneH; 
				style = "0x30+0x800";
			};
			class RscPicture_1213: RscPicture {
				idc = 1213;
				text = "textures\progressbar_tile_64.paa";
				x = 0.5141 * safezoneW + safezoneX - (0.0333333375 * safezoneW / 2);
				y = 0.049 * safezoneH + safezoneY - (0.05925925 * safezoneH / 2);
				w = 0.0333333375 * safezoneW;
				h = 0.05925925 * safezoneH; 
				style = "0x30+0x800";
			};
			class RscPicture_1214: RscPicture {
				idc = 1214;
				text = "textures\progressbar_tile_64.paa";
				x = 0.5188 * safezoneW + safezoneX - (0.0333333375 * safezoneW / 2);
				y = 0.049 * safezoneH + safezoneY - (0.05925925 * safezoneH / 2);
				w = 0.0333333375 * safezoneW;
				h = 0.05925925 * safezoneH; 
				style = "0x30+0x800";
			};
			class RscPicture_1215: RscPicture {
				idc = 1215;
				text = "textures\progressbar_tile_64.paa";
				x = 0.5235 * safezoneW + safezoneX - (0.0333333375 * safezoneW / 2);
				y = 0.049 * safezoneH + safezoneY - (0.05925925 * safezoneH / 2);
				w = 0.0333333375 * safezoneW;
				h = 0.05925925 * safezoneH; 
				style = "0x30+0x800";
			};
			class RscPicture_1216: RscPicture {
				idc = 1216;
				text = "textures\progressbar_tile_64.paa";
				x = 0.5281 * safezoneW + safezoneX - (0.0333333375 * safezoneW / 2);
				y = 0.049 * safezoneH + safezoneY - (0.05925925 * safezoneH / 2);
				w = 0.0333333375 * safezoneW;
				h = 0.05925925 * safezoneH; 
				style = "0x30+0x800";
			};
			class RscPicture_1217: RscPicture {
				idc = 1217;
				text = "textures\progressbar_tile_64.paa";
				x = 0.5328 * safezoneW + safezoneX - (0.0333333375 * safezoneW / 2);
				y = 0.049 * safezoneH + safezoneY - (0.05925925 * safezoneH / 2);
				w = 0.0333333375 * safezoneW;
				h = 0.05925925 * safezoneH; 
				style = "0x30+0x800";
			};
			class RscPicture_1218: RscPicture {
				idc = 1218;
				text = "textures\progressbar_tile_64.paa";
				x = 0.5375 * safezoneW + safezoneX - (0.0333333375 * safezoneW / 2);
				y = 0.049 * safezoneH + safezoneY - (0.05925925 * safezoneH / 2);
				w = 0.0333333375 * safezoneW;
				h = 0.05925925 * safezoneH; 
				style = "0x30+0x800";
			};
			class RscPicture_1219: RscPicture {
				idc = 1219;
				text = "textures\progressbar_tile_64.paa";
				x = 0.5422 * safezoneW + safezoneX - (0.0333333375 * safezoneW / 2);
				y = 0.049 * safezoneH + safezoneY - (0.05925925 * safezoneH / 2);
				w = 0.0333333375 * safezoneW;
				h = 0.05925925 * safezoneH; 
				style = "0x30+0x800";
			};
			class RscPicture_1220: RscPicture {
				idc = 1220;
				text = "textures\progressbar_tile_64.paa";
				x = 0.5469 * safezoneW + safezoneX - (0.0333333375 * safezoneW / 2);
				y = 0.049 * safezoneH + safezoneY - (0.05925925 * safezoneH / 2);
				w = 0.0333333375 * safezoneW;
				h = 0.05925925 * safezoneH; 
				style = "0x30+0x800";
			};
		 };	
	};
};