.. highlight:: c

Math and Helper Functions
=========================

:ref:`Absolute <Absolute>`
:ref:`Offset <Offset>`
:ref:`getButtonAction <getButtonAction>`
:ref:`disable_gui <disable_gui>`
:ref:`enable_gui <enable_gui>`
:ref:`is_gui_disabled <is_gui_disabled>`
:ref:`GlobalCondition <GlobalCondition>`
:ref:`GetLucasSavegameListBox <GetLucasSavegameListBox>`
:ref:`InitGuiLanguage <InitGuiLanguage>`
:ref:`getInteger <getInteger>`
:ref:`clearToSpace <clearToSpace>`


.. _Absolute:

.. index::
	Absolute
	
Absolute
--------

::

	int Absolute(int value);

Returns the absolute value of a given value.


.. _Offset:

.. index::
	Offset
	
Offset
------

::

	int Offset(int point1, int point2);

Returns the offset between to two given values.


.. _getButtonAction:

.. index::
	getButtonAction
	
getButtonAction
---------------

::

	int getButtonAction(int action);

Returns the connected action of a verb button. The actions for the verb buttons are not "hard-wired" inside the GUI-script, but defined in the function SetButtonAction.

*See also:*
:ref:`SetActionButtons <SetActionButtons>`,
:ref:`AdjustLanguage <AdjustLanguage>`


.. _disable_gui:

.. index::
	disable_gui
	
disable_gui
-----------

::

	function disable_gui();

This functions disables the GUI and hides it.

*See also:*
:ref:`is_gui_disabled <is_gui_disabled>`,
:ref:`enable_gui <enable_gui>`


.. _enable_gui:

.. index::
	enable_gui
	
enable_gui
-----------

::

	function enable_gui();

This function enables the GUI again.

*See also:*
:ref:`is_gui_disabled <is_gui_disabled>`,
:ref:`disable_gui <disable_gui>`


.. _is_gui_disabled:

.. index::
	is_gui_disabled
	
is_gui_disabled
---------------

::

	bool is_gui_disabled();

Returns true, if the GUI is currently disabled, false otherwise

*See also:*
:ref:`disable_gui <disable_gui>`


.. _GlobalCondition:

.. index::
	GlobalCondition

GlobalCondition
---------------

::

	int GlobalCondition(int parameter);

Used to check for conditions that are used many times in the script. For example, it's used to check, if the mouse cursor is in the inventory and the mode walk or pickup are selected.
Returns 1, if the condition is true and 0 otherwise.


.. _GetLucasSavegameListBox:

.. index::
	GetLucasSavegameListBox

GetLucasSavegameListBox
-----------------------

::

	function GetLucasSavegameListBox(ListBox*lb);

This is a helper function to initialize the save and restore dialogs.


.. _InitGuiLanguage:

.. index::
	InitGuiLanguage
	
InitGuiLanguage
---------------

::

	function InitGuiLanguage();

This is a helper function to set the correct sprites for the verb GUI.


.. _getInteger:

.. index::
	getInteger
	
getInteger
----------

::

	int getInteger();

This function returns the first integer value of the internal variable "numbers" and calls the function clearToSpace to overwrite that number with blank characters.

*See also:*
:ref:`clearToSpace <clearToSpace>`


.. _clearToSpace:

.. index::
	clearToSpace
	
clearToSpace
------------

::

	String clearToSpace(String text);

This function overwrites the first value or word from the given string with blank characters. Afterwards the new string is being returned.

*See also:*
:ref:`getInteger <getInteger>`

Unhandled Events
================

In order to give a the player a feedback for actions the author hasn't thought of, unhandled events come into play. 
With a single function, you can achieve something like "That doesn't work" or "I can't pull that", 
which makes a game much more authentic and alive.


.. _Unhandled:

.. index::
	Unhandled
	
Unhandled
---------

::

	function Unhandled(int door_script);

Use this function at the end of your any_click functions in order to cause default reactions. For example:

::

	function cChar_AnyClick()
	{
		if (UsedAction(eGA_LookAt)) player.Say("He looks like he is hungry.");
		else Unhandled();
	}

In this example, you get a default reaction for everything but look at. The optional parameter is only used internally to make the function work with the door scripts.

