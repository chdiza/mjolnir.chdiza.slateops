-- This Mjolnir extension provides versions of some of Slate's
-- window-moving and window-resizing operations, namely, "corner",
-- "push", "resize", and "nudge".
local slateops = {}

local screen = require "mjolnir.screen"
local window = require "mjolnir.window"

------------------------------------------------------------

-- CORNER
function slateops.corner(whichcorner)
  slateops.corner_it(whichcorner, window.focusedwindow())
end

function slateops.corner_it(whichcorner, your_window)
  local profile = slateops_util(your_window)
  local neworigin = profile.origin
  local win = profile.wdw_obj
  if string.match(whichcorner, "W") then
    neworigin.x = 0
  else
    neworigin.x = profile.new_easto
  end
  if string.match(whichcorner, "N") then
    neworigin.y = 22
  else
    neworigin.y = profile.new_southo
  end
  win:settopleft(neworigin)
end

------------------------------------------------------------

-- PUSH
function slateops.push(whichdir)
  slateops.push_it(whichdir, window.focusedwindow())
end

function slateops.push_it(whichdir,your_window)
  local profile   = slateops_util(your_window)
  local neworigin = profile.origin
  local win = profile.wdw_obj
  if whichdir=="N" then
    neworigin.y = 22
  elseif whichdir=="S" then
    neworigin.y = profile.new_southo
  elseif whichdir=="E" then
    neworigin.x = profile.new_easto
  else
    neworigin.x = 0
  end
  win:settopleft(neworigin)
end

------------------------------------------------------------

-- RESIZE
function slateops.resize(xinc, yinc)
  slateops.resize_it(xinc,yinc,window.focusedwindow())
end

function slateops.resize_it(xinc, yinc, your_window)
  local win = your_window
  local cursize = win:size()
  cursize.w = cursize.w+xinc
  cursize.h = cursize.h+yinc
  win:setsize(cursize)
end

------------------------------------------------------------

-- NUDGE
function slateops.nudge(xshift, yshift)
  slateops.nudge_it(xshift,yshift,window.focusedwindow())
end

function slateops.nudge_it(xshift, yshift, your_window)
  local win = your_window
  local curframe = win:frame()
  curframe.x = curframe.x+xshift
  curframe.y = curframe.y+yshift
  win:setframe(curframe)
end

------------------------------------------------------------

-- A utility function used internally by the window-moving functions.
function slateops_util(your_window)
  local this_win = your_window
  local cursize  = this_win:size()
  local skreen   = this_win:screen():fullframe()
  local profile  = {
    wdw_obj = this_win,
    origin  = this_win:topleft(),
    new_easto  = skreen.w - cursize.w,
    new_southo = skreen.h - cursize.h
    }
  return profile
end

return slateops
