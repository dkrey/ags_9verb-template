// Script header
// 9-verb MI-style template
// Version: 1.5.4
//
// Authors: 
//   Proskrito      first release
//   Lazarus        rewritten for AGS 2.7 
//   SSH            rewritten for AGS 2.71 and AGS 2.72 
//   Rulaman        Maniac Mansion Starterpacks
//   Lucasfan       Maniac Mansion Starterpacks
//   KhrisMUC       AGS 3.0 conversion
//   Electroshokker doubleclick code
//
//   abstauber      current maintainer
//
// 
// Abstract: 
//   This template adds a 9 Verb GUI to AGS,  
//   similar to the ones in classic LucasArts Games.
//   The graphics included may be freely used and altered in any way.
//
//
// Translators:
//   Spanish - Josemarg, Unai, Poplamanopla
//   German  - Abstauber
//   French  - Monsieur OUXX
//   Italian - Paolo
//   Portuguese - Miguel
//
// Contact and Support: 
//   Please visit the AGS-Forums at: http://adventuregamestudio.co.uk/forums
//
//
// Dependencies:
//   AGS 3.1 or later 
//   custom dialog rendering supported in AGS 3.2 or later
//
//
// Revision History
// 0.8    initial re-release
// 0.9    removed the usage of global integers 
//        updated door scripts and code cleanup
//        updated GUI graphics
// 1.0    tweaked the global script(CJ)
// 1.1    added exit extension for hotspots
//        added doubleclicks for exits and doors
// 1.1.1  fixed high-res support
// 1.1.2  added AGS 3.1 support
// 1.2    updated fonts to work in high-res
//        code cleanup, moved options from header to script
// 1.2.1  fixed high-res related inventory bug
//        fixed save GUI glitch
//        simplified inventory variables 
// 1.3    added GUI translations for Spanish, French , Italian and German
//        slightly expanded buttons in options GUI
//        added old school inventory handling
// 1.3.1  altered the way of supporting the old sound system (from AGS 3.1)
//        fixed the quit button label
//        modified the any_click_walk_look_pick function to work with empty strings
// 1.3.2  turned off lip sync by default
// 1.4    added portuguese GUI translation
//        added option to choose if player should approch characters for talking
//        renamed fonts and removed an obsolete one
//        bugfixes
// 1.5    support for AGS 3.4
//        added custom dialog rendering
//        adapted eDirection to enum CharacterDirection (and removed eDir_none)
//        fixed talk-to and pickup interactions on inv items
// 1.5.1  switched to 32-bit and D3D9 by default
//        exit rooms via doubleclick now works on objects
//        option to hide the main gui during dialogs
// 1.5.2  bugfix regarding inventory using keyboard shortcuts
//        added option disable the doubleclick entirely
// 1.5.3  added (optional) talk-to for objects and hotspots
// 1.5.4  fixed label description
//        Selected action is restored after unpausing
//
// 1.6    added running option
//        removed invisble mouse cursors
//        slight code cleanup
//        removed obsolete dialog gui
//        
//
// Licence:
//
// The MIT License (MIT)
// 
// Copyright (c) 2006-2016 The AGS-Community
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.


//----------------------------------------------------------------------------


// If your version of AGS is >=3.2, the new, object oriented audio system will be used.

#ifver 3.2
#define USE_OBJECT_ORIENTED_AUDIO
#endif


#define A_COUNT_ 10  // Action Button Count (gMainGUI)
#define X_SPEED 5    // default Player_Speed
#define MAX_DOORS 99 // How many doors accessed by door script
        
enum eGlobCond {
  eGlob_MouseInvWalk,
  eGlob_MouseInvPickup, 
  eGlob_InvOnInv,
  eGlob_GiveTalkNoChar, 
  eGlob_GiveNoInv, 
  eGlob_InvTalk
};

enum Action {
  eGA_LookAt,
  eGA_TalkTo,
  eGA_GiveTo,
  eGA_PickUp,
  eGA_Use,
  eGA_Open,
  eGA_Close,
  eGA_Push,
  eGA_Pull,
  eGA_UseInv,
  eMA_Default,
  eMA_WalkTo
};

#ifnver 3.4
enum CharacterDirection {
  eDirectionUp,
  eDirectionLeft,
  eDirectionRight,
  eDirectionDown
};
#endif

// for compatibility reasons
enum eDirection {
  eDir_None  = 0, 
  eDir_Up    = eDirectionUp, 
  eDir_Left  = eDirectionLeft, 
  eDir_Right = eDirectionRight, 
  eDir_Down  = eDirectionDown
};

enum eLanguage {
  eLangEN, 
  eLangDE,
  eLangES, 
  eLangIT, 
  eLangFR, 
  eLangPT, 
  eLangNL
};

// ============================= Math & Helper Functions =========================================
import int Absolute(int value);
import int Offset(int point1, int point2);
import int getButtonAction(int action);
import function disable_gui();
import function enable_gui();
import bool is_gui_disabled();
import int GlobalCondition(eGlobCond condition);
import function GetLucasSavegameListBox(ListBox*lb);
import function set_double_click_speed(int speed);
import function InitGuiLanguage();

// ============================= Verb Action Functions ===========================================
import function UsedAction (Action test_action);
import bool isAction(Action test_action);
import function SetActionButtons(Action action, String button_definition);
import function SetDefaultAction(Action def_action);
import function SetAction(Action new_action);
import function SetAlternativeAction(char extension, Action alt_action);
import function CheckDefaultAction();
import function UpdateActionBar();

// ============================= Player/character functions =======================================
import function freeze_player();
import function unfreeze_player();
import function SetPlayer(Character*ch);
#ifnver 3.4
import function FaceDirection (this Character*, CharacterDirection dir);
#endif
import function EnterRoom(this Character*, int newRoom, int x, int y, CharacterDirection dir);
import function Go();
import function set_approaching_char(bool enable);
// ================ Cancelable, semi-blocking move-player-character functions =====================
import int MovePlayer(int x, int y);
import int GoToCharacter(Character*charid, CharacterDirection dir, bool NPCfacesplayer, int blocking);
import int NPCGoToCharacter(Character*charidwhogoes, Character*charidtogoto, CharacterDirection dir, bool NPCfacesplayer, int blocking);
import int MovePlayerEx(int x, int y, WalkWhere direct);
import int GoToCharacterEx(Character*chwhogoes, Character*ch, CharacterDirection dir, int xoffset, int yoffset, bool NPCfacesplayer, int blocking);
import int any_click_move(int x, int y, CharacterDirection dir);
import int any_click_walk(int x, int y, CharacterDirection dir);
import int any_click_walk_look(int x, int y, CharacterDirection dir, String lookat);

#ifdef USE_OBJECT_ORIENTED_AUDIO
  import int any_click_walk_look_pick(int x, int y, CharacterDirection dir, String lookat, int objectID, InventoryItem*item, AudioClip *sound=false);
#endif

#ifndef USE_OBJECT_ORIENTED_AUDIO
  import int any_click_walk_look_pick(int x, int y, CharacterDirection dir, String lookat, int objectID, InventoryItem*item, int sound=0);
#endif

import int any_click_use_inv (InventoryItem*item, int x, int y, CharacterDirection dir);
import function GoTo(int blocking);
// ============================= Unhandled Events =================================================
import function Unhandled(int door_script=0);

// ============================= Door functions ==========================================
import function set_door_state(int door_id, int value);
import int get_door_state(int door_id);
import function init_object(int door_id, int act_object);
import function set_door_strings(String lookat =false, String islocked =false, String wrongitem =false, String closefirst =false, String unlock =false, String relock =false);
import String get_door_strings(String what_type);
import int any_click_on_door(int door_id, int act_object, int x, int y, CharacterDirection dir, int nr_room, int nr_x, int nr_y, CharacterDirection nr_dir);
#ifdef USE_OBJECT_ORIENTED_AUDIO
    import int any_click_on_door_special (int door_id, int act_object, int x, int y, CharacterDirection dir, int nr_room, int nr_x, int nr_y, CharacterDirection nr_dir, AudioClip *opensound, AudioClip *closesound, int key, int closevalue);
#endif

#ifndef USE_OBJECT_ORIENTED_AUDIO
    import int any_click_on_door_special (int door_id, int act_object, int x, int y, CharacterDirection dir, int nr_room, int nr_x, int nr_y, CharacterDirection nr_dir, int opensound=0, int closesound=0, int key, int closevalue);
#endif
// ============================= translation ====================================================
import String clearToSpace(String text);
import int getInteger();
import function TranslateAction(int action, int tr_lang=eLangEN);
import function AdjustLanguage();
import function AdjustGUIText();

// ============================= Extensions functions ==========================================
import function RemoveExtension();
import function AddExtension(char extension);
import char Extension();
import function OpenCloseExtension(int door_id);
import function VariableExtensions();