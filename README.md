# Windows and Tabs API Extensions

This library adds useful methods to Opera's Windows and Tabs API for extensions.
It adds a global **TabUtils** object and extends Opera's **BrowserTab**,
**BrowserTabGroup** and **BrowserWindow** objects with new methods and properties.

Just add js/api-extensions.js to your project and include it in your 
extension's index.html with a `<script>` tag like so:

	<script src="js/api-extensions.js"></script>

More in-depth documentation can be found in the **jsdoc** folder.

## Bug-Fixes

* **Opera 12.00**: BrowserTabManager.create() causes the addressbar to be 
focused when opening a tab in the background. The method is now rewritten to
open tabs in the foreground, then immediately return focus to the original tab
so that it opens in the background without switching keyboard focus to the 
address bar.

## TabUtils

	TabUtils.isTab(object)
Returns whether an object is a BrowserTab

	TabUtils.isGroup(object)
Returns whether an object is a BrowserTabGroup

	TabUtils.isWindow(object)
Returns whether an object is a BrowserWindow

	TabUtils.isAccessible(tab)
Returns whether messages can be posted to a tab

	TabUtils.firstTab(group)
Gets the leftmost tab within a tab group

	TabUtils.lastTab(group)
Gets the rightmost tab within a tab group

	TabUtils.nextSibling(item)
Gets the next tab or tab group within a tab or group's container.

	TabUtils.nextTab(item)
Gets the tab immediately to the right of a tab or group

	TabUtils.previousSibling(item)
Gets the previous tab or tab group within a tab or group's container.

	TabUtils.previousTab(item)
Gets the tab immediately to the left of a tab or group

## BrowserTab

### Properties
	nextSibling
If the tab is part of a group, gets the next tab in the group. 
Otherwise, gets the next tab or tab group in the window.

	nextTab
Gets the tab immediately to the right of this tab.

	previousSibling
If the tab is part of a group, gets the previous tab in the group. 
Otherwise, gets the next tab or tab group in the window.

	previousTab
Gets the tab immediately to the left of this tab.

### Methods
	ungroup(before = false)
Removes the tab from its current tab group. 
If the tab is not part of a group, does nothing.

* **before** (Boolean): Optional. If true, the tab will be placed to the left of
its group. If false or omitted, the tab will be placed to the right.

## BrowserTabGroup

### Properties
	firstTab
Gets the leftmost tab in the group

	lastTab
Gets the rightmost tab in the group

	nextSibling
Gets the next tab or group within the window

	previousSibling
Gets the previous tab or group within the window

### Methods
	at(position)
Gets the tab at a given position in the group

	insertAfter(tab, child)
Just like `BrowserTabGroup.insert(tab, child)`, but inserts the tab to the
right of the child tab instead of before it.

	move(tab, to)
Moves a tab to a new position within the group. 
If the position does not exist, the tab will be placed at the end of the group.

	move(from, to)
Moves the tab at position **from** to a new position within the group.
If the position does not exist, the tab will be placed at the end of the group.

	ungroup()
Dissolves the tab group

	expand()
Shortcut for `tabGroup.update({ collapsed: false })`

	collapse()
Shortcut for `tabGroup.update({ collapsed: true })`

## BrowserWindow

### Methods
	at(position)
Gets the tab or group at a given position in the window

	insertAfter(tab, child)
Just like `BrowserWindow.insert(tab, child)`, but inserts the tab or group to 
the right of the child item instead of before it.

	move(item, to)
Moves a tab or tab group to a new position within the window. 
If the position does not exist, the item will be placed at the end of the window.

	move(from, to)
Moves the tab or group at position **from** to a new position within the window.
If the position does not exist, the item will be placed at the end of the window.
