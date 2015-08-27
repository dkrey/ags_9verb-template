.. highlight:: c

Door functions
==============
:ref:`set_door_state <set_door_state>`
:ref:`get_door_state <get_door_state>`
:ref:`init_object <init_object>`
:ref:`set_door_strings <set_door_strings>`
:ref:`get_door_strings <get_door_strings>`
:ref:`any_click_on_door <any_click_on_door>`
:ref:`any_click_on_door_special <any_click_on_door_special>`

This template implements a clever door scripting system, which is a real timesaver if you use a lot of doors. 
It uses a hotspot for the closed door and a non-clickable object, to show the opened door.
If you enter a room the first time, you have to set up its containing doors:

::

	function room_FirstLoad()
	{
		// Lock door on startup when entering the room
		set_door_state(20, 2);
		init_object(20, oDoor.ID);
	}

This will set up a door with the id 20 to the state 2, locked. With "init_object", you connect the object, displaying a sprite of an opened door, with the door ID.
Now let's take a look at your hotspot's function:

::

	function hDoor_AnyClick()
	{
		if (any_click_on_door(20, oDoor.ID, 61, 104, eDir_Left, 1, 115, 135, eDir_Down)==0) Unhandled();
	}

This function is explained in detail later in this document. But for starters, this is all you have to do in the room script. 
And looks much harder than it is, just take a look at the sample room, supplied with this template.

If you want to have the script to show the correct default actions, you also need to change a line in the gui-script: 
so look for a function, called VariableExtensions.
In VariableExtensions, look at this line:

::

	if (r==1 && h == 1)
	OpenCloseExtension (20);

This tells the script, that Room 1 contains a hotspot with the id 1. This is connected to a door a door with the id 20. 
So now, the right-click should suggest open/close, depending on the door's state.


.. _set_door_state:

.. index::
	set_door_state
	
set_door_state
--------------

::

	function set_door_state(int door_id, int value);

Call this function to set a door state for the given door_id.
A door can have 3 different states:

* 0 = The door is closed
* 1 = The door is open
* 2 = The door is closed and locked

*See also:*
:ref:`get_door_state <get_door_state>`,
:ref:`init_object <init_object>`


.. _get_door_state:

.. index::
	get_door_state
	
get_door_state
--------------

::

	int get_door_state(int door_id);

Returns the current state of a door.

0 = The door is closed
1 = The door is open
2 = The door is closed and locked

*See also:*
:ref:`set_door_state <set_door_state>`,
:ref:`init_object <init_object>`


.. _init_object:

.. index::
	init_object
	
init_object
-----------

::

	function init_object(int door_id, int act_object);

Used to set up the corresponding object, used by the door with the given id. If the state of the door is closed, the object will be invisible. 
Otherwise, the object will be shown. The object stays unclickable all the time.

*See also:*
:ref:`set_door_state <set_door_state>`


.. _set_door_strings:

.. index::
	set_door_strings
	
set_door_strings
----------------

::

	function set_door_strings(String lookat, String islocked, String wrongitem, String closefirst, String unlock, String relock);

Use this function to define the messages, the player character says, when approaching a door.

*lookat*
: shown, if the player looks at the door
*islocked*
: shown, if the player tries to open a locked door
*wrongitem*
: shown, it the player tries to unlock the door with a wrong item
*closefirst*
: shown, if the player wants to lock a opened door
*relock*
: shown, if the player locks a previously unlocked door

*See also:* 
:ref:`get_door_strings <get_door_strings>`



.. _get_door_strings:

.. index::
	get_door_strings
	
get_door_strings
----------------

::

	String get_door_strings(String what_type);

Returns the message, which has been set up by set_door_strings. Accepted parameters are:

* lookat, islocked, wrongitem, closefirst, relock

Remember, that these are strings, so don't forget the quotation marks.

Usage: 

::

	if(!String.IsNullOrEmpty(get_door_strings("islocked"))) player.Say(get_door_strings("islocked"));

*See also:*
:ref:`set_door_strings <set_door_strings>`


.. _any_click_on_door:

.. index::
	any_click_on_door
	
any_click_on_door
-----------------

::
	
	int any_click_on_door(int door_id, int act_object, int x, int y, eDirection dir, int nr_room, int nr_x, int nr_y, eDirection nr_dir);

This function is used in the room script in combination with the door hotspot.
Parameters:

* door_id: The door id, you have defined
* act_object: The object, containing the open sprite
* x,y: the walk-to point of the door (please don't use the built in "walk-to coordinates" feature of the room editor.
* dir: the direction, the player's character should face, after it reached x,y
* nr_room: if the door is opened and walking through it, the player is being send to this room
* nr_x,nr_y: the x,y coordinates of inside of the new room
* nr_dir: after the room change, the player faces this direction

This is the main function of the door scripts. With this you connect the hotspot with the door and the player's action. 
If you have defined default door sounds, these are also being called in this function. Also you can't unlock a door with this function. 
You need any_click_on_door_special for that.

*See also:*
:ref:`any_click_on_door_special <any_click_on_door_special>`


.. _any_click_on_door_special:

.. index::
	any_click_on_door_special
	
any_click_on_door_special
-------------------------

::

	int any_click_on_door_special (int door_id, int act_object, int x, int y, eDirection dir, int nr_room, int nr_x, int nr_y, eDirection nr_dir, AudioClip *opensound, AudioClip *closesound, int key, int closevalue);

This function extends any_click_door with the following parameters:

* opensound: custom sound to be played, when the door is being opend
* closesound: custom sound to be played, when the door is being closed
* key: the id of the inventory item, that can unlock the door, -1 masterkey, -2 if the door cannot be unlocked
* closevalue: default 0 (closed), but you can also set 2 (locked).

*See also:*
:ref:`any_click_on_door <any_click_on_door>`
