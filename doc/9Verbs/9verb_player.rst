.. highlight:: c

Player functions
================

:ref:`freeze_player <freeze_player>`
:ref:`unfreeze_player <unfreeze_player>`
:ref:`SetPlayer <SetPlayer>`
:ref:`FaceDirection <FaceDirection>`
:ref:`EnterRoom <EnterRoom>`


.. _freeze_player:

.. index::
	freeze_player
	
freeze_player
-------------

::

	function freeze_player();

Use this function to prevent the player from moving by the following movement functions of the template.

*See also:*
:ref:`unfreeze_player <unfreeze_player>`


.. _unfreeze_player:

.. index::
	unfreeze_player
	
unfreeze_player
---------------

::
	
	function unfreeze_player();

Use this function to undo the freeze_player function and let the characters move again.

*See also:*
:ref:`freeze_player <freeze_player>`


.. _SetPlayer:

.. index::
	SetPlayer
	
SetPlayer
---------

::

	function SetPlayer(Character*ch);

Usage: 

::

	cEgo.SetPlayer();
	
Similar to the AGS function Character.SetAsPlayer(). The difference is, that make the previous character clickable again, whereas the new character gets unclickable.



.. _FaceDirection:

.. index::
	FaceDirection
	
FaceDirection
-------------

::

	function FaceDirection (this Character*, eDirection dir);
	
Usage: 

::

	cEgo.FaceDirection(eDir_Left);

Similar to the AGS function Character.FaceLocation. Possible directions are:
eDir_Left, eDir_Right, eDir_Up, eDir_Down


.. _EnterRoom:

.. index::
	EnterRoom
	
EnterRoom
---------

::

	function EnterRoom(this Character*, int newRoom, int x, int y, eDirection dir, bool onWalkable);
	
Usage: 

::

	cEgo.EnterRoom(1,15,15,eDir_Left,true);

Similar to the AGS function Character.ChangeRoom. The difference is, that you can also define, it which direction the character should look.
Using this function makes the character turn to the direction, mentioned above.



Semi-blocking movement functions
==========================================================
Semi-blocking means, that you can cancel the movement, but certain code is only executed, after the character has actually reached it's goal. 
To archive this, these functions are called inside an if-clause.

Example: 

::
	
	if(MovePlayer(20,20)) Display("The player has reached the destination.");

If the player's character reaches the coordinates 20,20, the message "I'm there" is being displayed. 
If the movement is being cancelled by a mouseclick, the message doesn't appear.

:ref:`MovePlayer <MovePlayer>`
:ref:`MovePlayerEx <MovePlayerEx>`
:ref:`GoToCharacter <GoToCharacter>`
:ref:`GoToCharacterEx <GoToCharacterEx>`
:ref:`NPCGoToCharacter <NPCGoToCharacter>`
:ref:`any_click_move <any_click_move>`
:ref:`any_click_walk <any_click_walk>`
:ref:`any_click_walk_look <any_click_walk_look>`
:ref:`any_click_walk_look_pick <any_click_walk_look_pick>`
:ref:`any_click_use_inv <any_click_use_inv>`
:ref:`GoTo <GoTo>`
:ref:`Go <Go>`
:ref:`WalkOffScreen <WalkOffScreen>`
:ref:`set_approaching_char <set_approaching_char>`


.. _MovePlayer:

.. index::
	MovePlayer
	
MovePlayer
----------

::

	int MovePlayer(int x, int y);

Moves the player character around on walkable areas, a wrapper for MovePlayerEx.
Returns 1, if the character has reached it's goal and 0 if the movement has been cancelled before.

*See also:*
:ref:`MovePlayerEx <MovePlayerEx>`


.. _MovePlayerEx:

.. index::
	MovePlayerEx
	
MovePlayerEx
------------

::

	int MovePlayerEx(int x, int y, WalkWhere direct);

Move the player character to x,y coords, waiting until he/she gets there, but allowing to cancel the action by pressing a mouse button.
Returns 1, if the character hasn't cancelled the movement and 0 if the movement has been cancelled before. 
2 is returned, if the characters has actually reached it's goal: eg. if a walkable area is being removed while the player is still moving.


.. _GoToCharacter:

.. index::
	GoToCharacter
	
GoToCharacter
-------------

::

	int GoToCharacter(Character*charid, eDirection dir, bool NPCfacesplayer, int blocking);

The same as GoToCharacterEx, just with the one character being the player and a default offset of x=35px and y=20px.
Returns 1, if the character has reached it's goal and 0 if the movement has been cancelled before.

*See also:*
:ref:`GoToCharacterEx <GoToCharacterEx>`


.. _GoToCharacterEx:

.. index::
	GoToCharacterEx
	
GoToCharacterEx
---------------

::

	int GoToCharacterEx(Character*chwhogoes, Character*ch, eDirection dir, int xoffset, int yoffset, bool NPCfacesplayer, int blocking);

Goes to a character staying at the side defined by 'direction': 1 up, 2 right, 3 down, 4 left and it stays at xoffset or yofsset from the character. 
blocking: 0=non-blocking; 1=blocking; 2=semi-blocking
Returns 1, if the character has reached it's goal and 0 if the movement has been cancelled before.

*See also:*
:ref:`GoToCharacter <GoToCharacter>`,
:ref:`NPCGoToCharacter <NPCGoToCharacter>`


.. _NPCGoToCharacter:

.. index::
	NPCGoToCharacter
	
NPCGoToCharacter
----------------

::
	
	int NPCGoToCharacter(Character*charidwhogoes, Character*charidtogoto, eDirection dir, bool NPCfacesplayer, int blocking);

The same as GoToCharacterEx, just with an default offset of x=35 and y=20
Returns 1, if the character has reached it's goal and 0 if the movement has been cancelled before.

*See also:*
:ref:`GoToCharacterEx <GoToCharacterEx>`


.. _any_click_move:

.. index::
	any_click_move
	
any_click_move
--------------

::

	int any_click_move(int x, int y, eDirection dir);

Moves the player character to the coordinates given in the parameters. If the player reaches the destination, it's turns to the given direction.
Returns 1, if the character has reached it's goal and 0 if the movement has been cancelled before. 
You can use this kind of functions (including the movePlayer function which is called by this function), 
to check if the player actually reached it's destination. For example:

::

	if (any_click_move(130,110,eDir_Left)==1) player.Say("I've reached the place.");

So the Message is only displayed, if the movement hasn't been cancelled.

*See also:*
:ref:`MovePlayer <MovePlayer>`,
:ref:`MovePlayerEx <MovePlayerEx>`


.. _any_click_walk:

.. index::
	any_click_walk
	
any_click_walk
--------------

::

	int any_click_walk(int x, int y, eDirection dir);

This function is almost similar to any_click_move. But it's only called, if the current action is eMA_WalkTo.

*See also:*
:ref:`MovePlayer <MovePlayer>`,
:ref:`MovePlayerEx <MovePlayerEx>`,
:ref:`any_click_move <any_click_move>`


.. _any_click_walk_look:

.. index::
	any_click_walk_look
	
any_click_walk_look
-------------------

::

	int any_click_walk_look(int x, int y, eDirection dir, String lookat);

This function moves the player character to the given location, turns it to the given direction and lets it say the message, given in the string.

*See also:*
:ref:`any_click_walk <any_click_walk>`



.. _any_click_walk_look_pick:

.. index::
	any_click_walk_look_pick

any_click_walk_look_pick
------------------------

::

	int any_click_walk_look_pick(int x, int y, eDirection dir, String lookat, int objectID, InventoryItem*item, AudioClip *sound);

This function starts the same as any_click_walk_look. If an object ID > 0 has been given, this object is set invisible. Afterwards the inventory item is going to be added to the player's inventory and if there's an audioclip in the parameters, that one is played too.

The function return 0 if the action has been cancelled, before the player has reached the coordinates. 1 is returned if the player has reached the given destination, but has not picked up the item. 2 is returned, if the item has been picked up.

*See also:*
:ref:`any_click_walk_look <any_click_walk_look>`,
:ref:`any_click_walk <any_click_walk>`


.. _any_click_use_inv:

.. index::
	any_click_use_inv
	
any_click_use_inv
-----------------

::

	int any_click_use_inv (InventoryItem*item, int x, int y, eDirection dir);

This function moves the player to the given destination. It returns 0, if the action is unhandled, 1 is returned, 
if the action is handled, but has been cancelled. 2 is returned, if everything went fine. A possible usage is:

::

	if (any_click_use_inv (iWrench,100,130,eDir_Left)==2) player.Say("I will now repair this pipe.");

*See also:*
:ref:`any_click_walk_look <any_click_walk_look>`,
:ref:`any_click_walk <any_click_walk>`


.. _GoTo:

.. index::
	GoTo
	
GoTo
----

::

	GoTo(int blocking);

Go to whatever the player clicked on. This function is used to intercept a walk-to event and check if the player has reached it's goal. 
E.g. this is used in the exit extension processing.
blocking: 0=non-blocking; 1=blocking; 2=semi-blocking

*See also:*
:ref:`Go <Go>`,
:ref:`MovePlayer <MovePlayer>`,
:ref:`WalkOffScreen <WalkOffScreen>`


.. _Go:

.. index::
	Go
	
Go
--

::

	Go();

Goes to whatever the player clicked on. You can cancel the action, and returns 1 if the player has gone to it. This is just a shortcut for GoTo(2), which means semi-blockable.

*See also:*
:ref:`GoTo <GoTo>`


.. _WalkOffScreen:

.. index::
	WalkOffScreen
	
WalkOffScreen
-------------

::

	WalkOffScreen();

Handles the action of hotspots or objects with the exit extension ('>e'). Take a look at chapter about extensions to see what this function does.

*See also:*
:ref:`Extensions <Extensions>`


.. _set_approaching_char:

.. index::
	set_approaching_char
	
set_approaching_char
--------------------

::

	set_approaching_char(bool enable);

If set to true, the player walks to other chars before talking or giving items. This behaviour is initially defined in the guiscript, this function is used to change it during runtime.
