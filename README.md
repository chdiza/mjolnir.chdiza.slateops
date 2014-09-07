# mjolnir.chdiza.slateops

This [Mjolnir](https://github.com/mjolnir-io/mjolnir) extension
provides versions of some of
[Slate's](https://github.com/jigish/slate) window-moving and
window-resizing operations, namely, "corner", "push", "resize", and
"nudge".

I'm new to Lua, so if you see that I do something incorrect or newbish, file an issue or PR.

**Required modules**: mjolnir.window, mjolnir.screen.

**Recommended modules**: mjolnir.hotkey (This module is pretty worthless
unless you bind its functions to hotkeys.)

For each of these Slate operations, there are two Mjolnir functions.
One is the one that mimics Slate directly---it performs that operation
on the currently-focused window.  The other will perform that same
Slate operation on a window you specify within your lua code.

## Things Slate does that now Mjolnir can too:

### Corner

`slateops.corner(whichcorner)`

This function puts the currently focused window in either Northeast,
Southeast, Southwest, or Northwest corner of your current monitor
screen.  You call it with a single string argument of either "SW",
"SE", "NW", or "NE".

`slateops.corner_it(whichcorner,your_window)`

Like `slateops.corner` but operates on `your_window`.

### Push

`slateops.push(whichdir)`

This function "slides" the currently focused window to either the top,
bottom, right, or left edge of the screen, while keeping the position
of the window on the other axis the same.  You call it with a single
string argument representing the edge you want the window to be moved
to: "N", "S", "E", "W".

`slateops.push_it(whichdir,your_window)`

Like `slateops.push` but operates on `your_window`.

### Resize

`slateops.resize(xinc,yinc)`

This function resizes currently-focused window by the specified number
of pixels in either the x-axis or y-axis.  (You can do both at once,
which makes this function technically more powerful than Slate's
resizing, but I can't imagine you'd want to do that.) You call it with
two integer arguments, the first being the number of x-axis pixels you
want the window shifted and the second being the number of y-axis
pixels you want it moved.  Negative numbers mean "downward" or
"leftward".

`slateops.resize_it(xinc,yinc,your_window)`

Like `slateops.resize` but operates on `your_window`.

### Nudge

`slateops.nudge(xshift,yshift)`

This function moves the currently-focused window by the specified
number of pixels in the x or y axis.  It's called just like with
slateops.resize.

`slateops.nudge_it(xshift,yshift,your_window)`

Like `slateops.nudge` but operates on `your_window`.

