Translation
===========

:ref:`TranslateAction <TranslateAction>`
:ref:`AdjustLanguage <AdjustLanguage>`

To make the verbs work with translations, strings are being used to define the button graphics, hotkeys and so on. 
If you like to customize your game or get it translated, you need to take a closer look at the function AdjustLanguage.
The functions getInteger and clearToSpace are being used to extract the informations from those white space seperated strings.


.. _TranslateAction:

.. index::
	TranslateAction
	
TranslateAction
---------------

::

	function TranslateAction(int action, int tr_lang);

This function defines the text for the verb buttons, e.g. if you click on the talk verb button, "Talk to" is being displayed in the action/status bar. The second parameter defines the returned language. If you want to customize this text, you have to edit this function.


.. _AdjustLanguage:

.. index::
	AdjustLanguage
	
AdjustLanguage
--------------

::

	function AdjustLanguage();

This function has to be called from inside the global script's game_start() function. 
It sets up everything related to the verb buttons, so you need to take a look at this, if you want to customize your GUI. 
It is also import to understand, how this function works, if you want to get you game translated.
If you take a closer look at this function, you will notice the following lines:

::

	SetActionButtons(eGA_GiveTo, "a_button_give
		0
		1
		2 
		Gg");

::

	SetActionButtons(eGA_PickUp, "a_button_pick_up 
		1
		7
		8 
		Pp");

::

	SetActionButtons(eGA_Use, "a_button_use
		2 
		13 
		14 
		Uu");

and so on.

Your verb buttons are initialized here, by calling the function SetActionButtons. 
The first parameter is the action being called by the button, the second one is a string containing the following informations: 
* Name
* GUI-button ID
* Spriteslot normal
* Sprite slot highlighted
* Keyboard-Shortcut.

So all those parameters are encapsulated inside a string, sepereated by white spaces. 
It doesn't matter, how many spaces are used to seperate the parameters, as long as it is at least a single blank character.

This line 

::

	SetActionButtons(eGA_GiveTo, "a_button_give 0 1 2 Gg"); 
	
tells the AGS:

* The button for the action eGA_GiveTo is named "a_button_give" (also this information is not being used outside of this function).
* The buttons has the GUI-ID 0. If you take a look at the GUI "gMaingui", you can see several buttons. The one with the ID 0 will be used for the action you define here.
* The button will use the spriteslot 1 as the default graphic and 
* spriteslot 2, if it's highlighted. This can be a little bit confusing, since if you look at gMaingui, those graphics have already been assigned. But you also need to define the graphics slots in this function, because eventually these are the ones being used.
* The last parameter defines the hotkey for this action.

You might wonder, why this function overrides the values of gMaingui. 
But in some other languages the translation for use could be a very long word, so you might want to swap it with something else. 
E.g. in german "use" means "Benutze", so you need more space for the verb. But "pick up" can be translated to "nimm", so you save some space here. 
Now in your translation file (e.g: german.tra), you can simply swap the button with GUI of the english "pick up" with the german "Benutze".

| a_button_use
| 1 794 795 Bb

*Of course you don't have to do that for the languages already provided*

This function also sets up the fonts for every written text (Option GUI, Status Bar and so on). This is done by this string:

::

	font_info=GetTranslation("font_320: 1
	0
	0
	0
	0
	0
	0
	3
	0
	0
	0
	0
	0
	3
	3");

Each numer stands for a text element. The first number is the spoken text, the second number defines the font in the status bar. The other columns are explained in the code itself, if you'd like to customize them.

*See also:*
:ref:`SetActionButtons <SetActionButtons>`