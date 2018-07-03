// Script header for module 'dialogscript'
//
// simplified custom dialog gui based on v.1.6.3
//
// This script is compatible with AGS 3.2 and higher
// Therefore it doesn't work with AGS 3.1 and below.
//
//
// Licence:
//
//   CustomDialogGui AGS script module
//   Copyright (C) 2008 - 2015 Dirk Kreyenberg
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to 
// deal in the Software without restriction, including without limitation the
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
// sell copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in 
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING 
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
// DEALINGS IN THE SOFTWARE.


#define GUI_9VERB_SPRITESENUM_LENGTH  7      //This must be the size of enum 'GUI9Verb_SpritesEnum' +1 (because enums are 1-based)
#define GUI_9VERB_TEXTENUM_LENGTH    11      //This must be the size of enum 'GUI9Verb_TextSettingsEnum' +1 (because enums are 1-based)
#define GUI_9VERB_BORDERSENUM_LENGTH  7      //This must be the size of enum 'GUI9Verb_BordersSettingsEnum' +1 (because enums are 1-based)
#define GUI_9VERB_LAYOUTENUM_LENGTH   9      //This must be the size of enum 'GUI9Verb_LayoutSettingsEnum' +1 (because enums are 1-based)
#define GUI_9VERB_AUTOSIZEENUM_LENGTH 5      //This must be the size of enum 'GUI9Verb_AutoSizeSettingsEnum' +1 (because enums are 1-based)
#define GUI_9VERB_BGENUM_LENGTH       5      //This must be the size of enum 'GUI9Verb_BgSettingsEnum' +1 (because enums are 1-based)




  

struct CustomDialogGui {
  import function init();
  DialogOptionsRenderingInfo *dialog_window;
  bool hide_gui_while_dialog;

  //Settings
  int sprites[GUI_9VERB_SPRITESENUM_LENGTH];
  int textSettings[GUI_9VERB_TEXTENUM_LENGTH];
  int bordersSettings [GUI_9VERB_BORDERSENUM_LENGTH];
  int layoutSettings[GUI_9VERB_LAYOUTENUM_LENGTH];
  int autoSizeSettings[GUI_9VERB_AUTOSIZEENUM_LENGTH];
  int bgSettings[GUI_9VERB_BGENUM_LENGTH];
  
  int yscreenborder;
  int xscreenborder;
  
  bool autosize_height;
  bool autosize_width;

  int auto_arrow_align;
  int auto_arrow_up_offset_x;
  int auto_arrow_up_offset_y;
  int auto_arrow_down_offset_x;
  int auto_arrow_down_offset_y;  
  
  int bullet;

  float scroll_btn_delay;

  bool mousewheel;
  bool reset_scrollstate;
  bool dialog_options_upwards;

  int scroll_rows;


  //-------------------------------
  //    Static functions
  //-------------------------------
  
  import static int[] GetDefaultSettings_Sprites();
  import static int[] GetDefaultSettings_Text();
  import static int[] GetDefaultSettings_Borders();
  import static int[] GetDefaultSettings_Layout();
  import static int[] GetDefaultSettings_Autosize();
  import static int[] GetDefaultSettings_Background();
  
  import void ApplySettings_Sprites(int settings[]);
  import void ApplySettings_Text(int settings[]);
  import void ApplySettings_Borders(int settings[]);
  import void ApplySettings_Layout(int settings[]);
  import void ApplySettings_Autosize(int settings[]);
  import void ApplySettings_Background(int settings[]);
  
  //-------------------------------
  //    internal Stuff from here on
  //-------------------------------
  
  int scroll_from;
  int scroll_to;
  
  int max_option_height;
  int max_option_width;
  int active_options_count;  
  int locked_xpos;
  int locked_ypos;
  int uparrow_current_img;
  int downarrow_current_img;  
};

struct CDG_Arrow {
  int x1;
  int y1;
  int x2;
  int y2;
};

import CustomDialogGui CDG;



/***********************************************************************
 * Enums for all kinds of settings
 * 
 ***********************************************************************/
 
 //Sprites (6)
enum GUI9Verb_SpritesEnum {
  e9verb_uparrow_img, 
  e9verb_uparrow_hi_img, 
  e9verb_uparrow_push_img, 
  e9verb_downarrow_img, 
  e9verb_downarrow_hi_img, 
  e9verb_downarrow_push_img
};

//Text settings (10)
enum GUI9Verb_TextSettingsEnum {
  e9verb_text_font, 
  e9verb_text_color, 
  e9verb_text_color_active, 
  e9verb_text_alignment, 
  e9verb_text_bg, 
  e9verb_text_bg_xpos, 
  e9verb_text_bg_scaling, 
  e9verb_text_bg_transparency,  
  e9verb_text_line_space, 
  e9verb_text_numbering
};

//Borders settings (6)
enum GUI9Verb_BordersSettingsEnum {
  e9verb_border_top,
  e9verb_border_bottom,
  e9verb_border_left,
  e9verb_border_right,
  e9verb_border_visible,
  e9verb_border_color
};

//Layout (positionning) (8)
enum GUI9Verb_LayoutSettingsEnum {
  e9verb_gui_xpos,
  e9verb_gui_ypos,
  e9verb_gui_width,
  e9verb_gui_height,
  
  e9verb_uparrow_xpos,
  e9verb_uparrow_ypos,
  e9verb_downarrow_xpos,
  e9verb_downarrow_ypos
};

//Autosize (4)
enum GUI9Verb_AutoSizeSettingsEnum {
  e9verb_autosize_minheight,
  e9verb_autosize_maxheight,
  e9verb_autosize_minwidth,
  e9verb_autosize_maxwidth
};



//Background (4)
enum GUI9Verb_BgSettingsEnum {
  e9verb_bg_img, 
  e9verb_bg_img_scaling, 
  e9verb_bg_img_transparency, 
  e9verb_bg_color
};

