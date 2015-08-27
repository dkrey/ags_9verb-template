.. highlight:: c

Action Functions
================

These functions are mainly used to control the verb buttons.

:ref:`UsedAction <UsedAction>`
:ref:`isAction <isAction>`
:ref:`SetActionButtons <SetActionButtons>`
:ref:`SetDefaultAction <SetDefaultAction>`
:ref:`SetAction <SetAction>`
:ref:`SetAlternativeAction <SetAlternativeAction>`
:ref:`CheckDefaultAction <CheckDefaultAction>`
:ref:`UpdateActionBar <UpdateActionBar>`


.. _UsedAction:

.. index::
	UsedAction
	
UsedAction
----------

::

	function UsedAction (Action test_action);

Used to determine, which action has been selected by the player. Instead of checking cursor modes, this function is used.


.. _isAction:

.. index::
	isAction

isAction
--------

::

	bool isAction(Action test_action);

Used to check, if the current action is the one, given in the parameter.


.. _SetActionButtons:

.. index::
	SetActionButtons
	
SetActionButtons
----------------

::

	function SetActionButtons(Action action, String button_definition);

This functions connects the verb buttons with the action and is also used to assign / change the graphics of the verb buttons.

*See also:*
:ref:`AdjustLanguage <AdjustLanguage>`


.. _SetDefaultAction:

.. index::
	SetDefaultAction
	
SetDefaultAction
----------------

::

	function SetDefaultAction(Action def_action);

Used to define, which action is being used, if no verb has been clicked. Usually this is "walk to".


.. _SetAction:

.. index::
	SetAction
	
SetAction
---------

::

	function SetAction(Action new_action);

Since the cursor modes are bypassed, this function defines the current action. Among other things, this function is called by clicking a verb button.


.. _SetAlternativeAction:

.. index::
	SetAlternativeAction
	
SetAlternativeAction
--------------------

::

	function SetAlternativeAction(char extension, Action alt_action);

This function makes the right-click shortcuts work. If you use extensions like ">p" (e.g. pickup), this function makes sure, that the correct verb button is highlighted.

*See also:*
:ref:`CheckDefaultAction <CheckDefaultAction>`


.. _CheckDefaultAction:

.. index::
	CheckDefaultAction
	
CheckDefaultAction
------------------

::

	function CheckDefaultAction();

This function checks for a given extension in hotspots, objects and characters. If there isn't an extension, a default action is given, e.g. 
"Talk to" if the mouse is over a character. In case of a given extension, the default actions are being overridden. 
It is also defined here, which letters are causing what default action. See the chapter Extensions for more details.

*See also:*
:ref:`Extensions <Extensions>`



.. _UpdateActionBar:

.. index::
	UpdateActionBar

UpdateActionBar
---------------

::

	function UpdateActionBar();

This function is used to show and update the status bar. It checks for an extension, triggers the translation and renders the results on screen.

*See also:*
:ref:`TranslateAction <TranslateAction>`,
:ref:`RemoveExtension <RemoveExtension>`