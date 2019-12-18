-- https://learnxinyminutes.com/docs/lua/

hs.hotkey.bind({"alt"}, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x - 10
  f.y = f.y + 30
  win:setFrame(f)
end)

-- hs.hotkey.bind({"cmd"}, "R", function()
--   hs.reload()
-- end)
-- hs.alert.show("Config loaded")

 hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
   hs.notify.new({ title="Hammerspoon", informativeText="HelloWorld" }):send()
   -- hs.alert.show("Hello World!")
 end)

local log = hs.logger.new('main', 'info')
DEVELOPING_THIS = true -- set to true to ease debugging

-- HYPER = {'ctrl', 'shift', 'alt', 'cmd'}
HYPER = {'ctrl', 'cmd'}

-- App bindings
function setUpAppBindings()
--  hyperFocusAll('w', '')
 hyperFocusOrOpen('e', 'Notes')
 hyperFocusOrOpen('i', 'Visual Studio Code')
 hyperFocusOrOpen('[', 'Finder')
 hyperFocusOrOpen('i', 'iTerm2')
 hyperFocusOrOpen('f', 'Firefox')
 hyperFocusOrOpen('c', 'Google Chrome')
 hyperFocusOrOpen('s', 'Safari')
 hyperFocusOrOpen('m', 'Slack')
end

-- Window management
function setUpWindowManagement()
 hs.window.animationDuration = 0 -- disable animations
 hs.grid.setMargins({20, 20})
 hs.grid.setGrid('4x4')

 function mkSetFocus(to)
   return function() hs.grid.set(hs.window.focusedWindow(), to) end
 end

 local fullScreen = hs.geometry("0,0 2x2")
 local leftHalf = hs.geometry("0,0 1x2")
 local rightHalf = hs.geometry("1,0 1x2")
 local upperLeft = hs.geometry("0,0 1x1")
 local lowerLeft = hs.geometry("0,1 1x1")
 local upperRight = hs.geometry("1,0 1x1")
 local lowerRight = hs.geometry("1,1 1x1")

 -- command + ctrl + f = full screen
 hs.hotkey.bind(HYPER, 'f', mkSetFocus(fullScreen))
 hs.hotkey.bind(HYPER, 'h', mkSetFocus(leftHalf))
 hs.hotkey.bind(HYPER, "'", mkSetFocus(rightHalf))
 hs.hotkey.bind(HYPER, "y", mkSetFocus(upperLeft))
 hs.hotkey.bind(HYPER, "b", mkSetFocus(lowerLeft))
 hs.hotkey.bind(HYPER, "u", mkSetFocus(upperRight))
 hs.hotkey.bind(HYPER, "n", mkSetFocus(lowerRight))

 hs.hotkey.bind(HYPER, "up", hs.window.filter.focusNorth)
 hs.hotkey.bind(HYPER, "down", hs.window.filter.focusSouth)
 hs.hotkey.bind(HYPER, "left", hs.window.filter.focusWest)
 hs.hotkey.bind(HYPER, "right", hs.window.filter.focusEast)
 -- hs.hotkey.bind(HYPER, "v", hs.window.filter.focusNorth)
 -- hs.hotkey.bind(HYPER, "c", hs.window.filter.focusSouth)
 -- hs.hotkey.bind(HYPER, "j", hs.window.filter.focusWest)
 -- hs.hotkey.bind(HYPER, "p", hs.window.filter.focusEast)
 hs.hotkey.bind(HYPER, "q", hs.hints.windowHints)
 -- HYPER "d" -- Bound in Karabiner to Cmd+Tab (application switcher)
 -- HYPER "k" -- Bound in Karabiner to Cmd+` (next window of application)
 --
 -- throw to other screen
 hs.hotkey.bind(HYPER, 'a', function()
   local window = hs.window.focusedWindow()
   window:moveToScreen(window:screen():next())
 end)
end

hs.hotkey.bind({"alt"}, "1", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"alt"}, "2", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

-- focus on the last-focused window of the application given by name, or else launch it
function hyperFocusOrOpen(key, app)
 local focus = mkFocusByPreferredApplicationTitle(true, app)
 function focusOrOpen()
   return (focus() or hs.application.launchOrFocus(app))
 end
 hs.hotkey.bind(HYPER, key, focusOrOpen)
end

-- focus on the last-focused window of the first application given by name
function hyperFocus(key, ...)
 hs.hotkey.bind(HYPER, key, mkFocusByPreferredApplicationTitle(true, ...))
end


-- focus on the last-focused window of every application given by name
function hyperFocusAll(key, ...)
 hs.hotkey.bind(HYPER, key, mkFocusByPreferredApplicationTitle(false, ...))
end


-- creates callback function to select application windows by application name
function mkFocusByPreferredApplicationTitle(stopOnFirst, ...)
 local arguments = {...} -- create table to close over variadic args
 return function()
   local nowFocused = hs.window.focusedWindow()
   local appFound = false
   for _, app in ipairs(arguments) do
     if stopOnFirst and appFound then break end
     log:d('Searching for app ', app)
     local application = hs.application.get(app)
     if application ~= nil then
       log:d('Found app', application)
       local window = application:mainWindow()
       if window ~= nil then
         log:d('Found main window', window)
         if window == nowFocused then
           log:d('Already focused, moving on', application)
         else
           window:focus()
           appFound = true
         end
       end
     end
   end
   return appFound
 end
end


function maybeEnableDebug()
 if DEVELOPING_THIS then
   log.setLogLevel('debug')
   log.d('Loading in development mode')
   -- automatically reload changes when we're developing
   hs.pathwatcher.new(os.getenv('HOME') .. '/.hammerspoon/', hs.reload):start()
   hs.alert('Hammerspoon config reloaded')
   log:d('Hammerspoon config reloaded')
 end
end

function setUpClipboardTool()
 ClipboardTool = hs.loadSpoon('ClipboardTool')
 ClipboardTool.show_in_menubar = false
 ClipboardTool:start()
 ClipboardTool:bindHotkeys({
   toggle_clipboard = {HYPER, "p"}
 })
end

function reloadConfig(files)
  doReload = false
  for _,file in pairs(files) do
      if file:sub(-4) == ".lua" then
          doReload = true
      end
  end
  if doReload then
      hs.reload()
  end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")

----------------------------------------------------------------------

-------------~-------------- examples --------------------------------

----------------------------------------------------------------------

-- drawing on the screen :)
mouseCircle = nil
mouseCircleTimer = nil

function mouseHighlight()
    -- Delete an existing highlight if it exists
    if mouseCircle then
        mouseCircle:delete()
        if mouseCircleTimer then
            mouseCircleTimer:stop()
        end
    end
    -- Get the current co-ordinates of the mouse pointer
    mousepoint = hs.mouse.getAbsolutePosition()
    -- Prepare a big red circle around the mouse pointer
    mouseCircle = hs.drawing.circle(hs.geometry.rect(mousepoint.x-40, mousepoint.y-40, 80, 80))
    mouseCircle:setStrokeColor({["red"]=1,["blue"]=0,["green"]=0,["alpha"]=1})
    mouseCircle:setFill(false)
    mouseCircle:setStrokeWidth(5)
    mouseCircle:show()

    -- Set a timer to delete the circle after 3 seconds
    mouseCircleTimer = hs.timer.doAfter(3, function() mouseCircle:delete() end)
end
hs.hotkey.bind({"cmd","alt","shift"}, "D", mouseHighlight)

-- applescript
ok,result = hs.applescript('tell Application "iTunes" to artist of the current track as string')
hs.alert.show(result)

-- interacting with application menus
function cycle_safari_agents()
  hs.application.launchOrFocus("Safari")
  local safari = hs.appfinder.appFromName("Safari")

  local str_default = {"Develop", "User Agent", "Default (Automatically Chosen)"}
  local str_ie10 = {"Develop", "User Agent", "Internet Explorer 10.0"}
  local str_chrome = {"Develop", "User Agent", "Google Chrome — Windows"}

  local default = safari:findMenuItem(str_default)
  local ie10 = safari:findMenuItem(str_ie10)
  local chrome = safari:findMenuItem(str_chrome)

  if (default and default["ticked"]) then
      safari:selectMenuItem(str_ie10)
      hs.alert.show("IE10")
  end
  if (ie10 and ie10["ticked"]) then
      safari:selectMenuItem(str_chrome)
      hs.alert.show("Chrome")
  end
  if (chrome and chrome["ticked"]) then
      safari:selectMenuItem(str_default)
      hs.alert.show("Safari")
  end
end
hs.hotkey.bind({"cmd", "alt", "ctrl"}, '7', cycle_safari_agents)

-- automatically sms & imessage when u arrive at a kaffeaffar wifi (via SSID)
coffeeShopWifi = "Baristartisan_Guest"
lastSSID = hs.wifi.currentNetwork()
wifiWatcher = nil

function ssidChanged()
    newSSID = hs.wifi.currentNetwork()

    if newSSID == coffeeShopWifi and lastSSID ~= coffeeShopWifi then
        -- We have arrived at the coffee shop
        hs.messages.iMessage("iphonefriend@hipstermail.com", "Hey! I'm at Baristartisan's, come join me!")
        hs.messages.SMS("+1234567890", "Hey, you don't have an iPhone, but you should still come for a coffee")
    end
end

wifiWatcher = hs.wifi.watcher.new(ssidChanged)
wifiWatcher:start()

-- automate the automation tools; enter `open -g hammerspoon://someAlert` from cl et voil`a
hs.urlevent.bind("someAlert", function(eventName, params)
    hs.alert.show("Received someAlert")
end)

-- Main

maybeEnableDebug()
setUpAppBindings()
setUpWindowManagement()
-- setUpClipboardTool()
