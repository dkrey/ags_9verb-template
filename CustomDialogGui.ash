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




/***********************************************************************
 * Enums for all kinds of settings
 * 
 ***********************************************************************/
 
 //Sprites
enum CustomDialogGui_SpritesEnum {
  eCustomDialog_uparrow_img, 
  eCustomDialog_uparrow_hi_img, 
  eCustomDialog_uparrow_push_img, 
  eCustomDialog_downarrow_img, 
  eCustomDialog_downarrow_hi_img, 
  eCustomDialog_downarrow_push_img, 
  eCustomDialog_sprites_enumsize
};

//Text settings 
enum CustomDialogGui_TextSettingsEnum {
  eCustomDialog_text_font, 
  eCustomDialog_text_color, 
  eCustomDialog_text_color_active, 
  eCustomDialog_text_alignment, 
  eCustomDialog_text_bg, 
  eCustomDialog_text_bg_xpos, 
  eCustomDialog_text_bg_scaling, 
  eCustomDialog_text_bg_transparency,  
  eCustomDialog_text_line_space, 
  eCustomDialog_text_enumsize
};

//Borders settings
enum CustomDialogGui_BordersSettingsEnum {
  eCustomDialog_border_top,
  eCustomDialog_border_bottom,
  eCustomDialog_border_left,
  eCustomDialog_border_right,
  eCustomDialog_border_color, 
  eCustomDialog_borders_enumsize
};

//Layout (positionning)
enum CustomDialogGui_LayoutSettingsEnum {
  eCustomDialog_gui_xpos,
  eCustomDialog_gui_ypos,
  eCustomDialog_gui_width,
  eCustomDialog_gui_height,
  
  eCustomDialog_uparrow_xpos,
  eCustomDialog_uparrow_ypos,
  eCustomDialog_downarrow_xpos,
  eCustomDialog_downarrow_ypos, 
  eCustomDialog_layout_enumsize
};

//Autosize
enum CustomDialogGui_AutoSizeSettingsEnum {
  eCustomDialog_autosize_minheight,
  eCustomDialog_autosize_maxheight,
  eCustomDialog_autosize_minwidth,
  eCustomDialog_autosize_maxwidth, 
  eCustomDialog_autosize_enumsize
};



//Background
enum CustomDialogGui_BgSettingsEnum {
  eCustomDialog_bg_img, 
  eCustomDialog_bg_img_scaling, 
  eCustomDialog_bg_img_transparency, 
  eCustomDialog_bg_color, 
  eCustomDialog_bg_enumsize
};

//Auto arrows
enum CustomDialogGui_AutoArrowsSettingsEnum {
  eCustomDialog_auto_arrow_align, 
  eCustomDialog_auto_arrow_up_offset_x, 
  eCustomDialog_auto_arrow_up_offset_y, 
  eCustomDialog_auto_arrow_down_offset_x, 
  eCustomDialog_auto_arrow_down_offset_y, 
  eCustomDialog_autoarrows_enumsize
};

enum ArrowsAlign_Enum {
  eCustomDialog_align_arrows_left, 
  eCustomDialog_align_arrows_center, 
  eCustomDialog_align_arrows_right 
};

struct CustomDialogGui {
    
  //-------------------------------
  //    public functions
  //-------------------------------
  
  import void ApplySettings_Sprites(int settings[]);
  import void ApplySettings_Text(int settings[]);
  import void ApplySettings_Borders(int settings[]);
  import void ApplySettings_Layout(int settings[]);
  import void ApplySettings_Autosize(int settings[]);
  import void ApplySettings_Background(int settings[]);
  import void ApplySettings_AutoArrows(int settings[]);
  
  import function init();
  
  DialogOptionsRenderingInfo *dialog_window;

  //Bulk settings
  int sprites[eCustomDialog_sprites_enumsize];
  int textSettings[eCustomDialog_text_enumsize];
  int bordersSettings [eCustomDialog_borders_enumsize];
  int layoutSettings[eCustomDialog_layout_enumsize];
  int autoSizeSettings[eCustomDialog_autosize_enumsize];
  int bgSettings[eCustomDialog_bg_enumsize];
  int autoArrowsSettings[eCustomDialog_autoarrows_enumsize];
  
  //Other settings
  bool hide_gui_while_dialog;
  bool border_visible;
  bool text_numbering;
  
  int yscreenborder;
  int xscreenborder;
  
  bool autosize_height;
  bool autosize_width;
  
  int bullet;

  float scroll_btn_delay;

  bool mousewheel;
  bool reset_scrollstate;
  bool dialog_options_upwards;

  int scroll_rows;



  
  //-------------------------------
  //    Static functions
  //-------------------------------
  
  //Get default settings for each group of settings
  import static int[] GetDefaultSettings_Sprites();
  import static int[] GetDefaultSettings_Text();
  import static int[] GetDefaultSettings_Borders();
  import static int[] GetDefaultSettings_Layout();
  import static int[] GetDefaultSettings_Autosize();
  import static int[] GetDefaultSettings_Background();
  import static int[] GetDefaultSettings_AutoArrows();
  
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





