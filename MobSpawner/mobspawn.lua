os.loadAPI("button")
m = peripheral.wrap("top")
wr = peripheral.wrap("bottom")
m.clear()
local switches={}

function fillTable()
   button.setTable("Lights",lights,10,20,3,5)
   button.setTable("Golems",golems, 22,32,3,5)
   button.setTable("Lasers",lasers,3,13,7,9)
   button.setTable("Particles",particles,15,25,7,9)
   button.setTable("Teslas", teslas, 27,37,7,9)
   button.setTable("Zombie", zombie, 3,13,11,13)
   button.setTable("Skelly", skelly, 15, 25, 11, 13)
   button.setTable("Spider", spider, 27, 37, 11, 13)
   button.screen()
end

function switch(name, colr)
   if switches[name] then
      redstone.setBundledOutput("back", redstone.getBundledOutput("back") - colr)
   else
      redstone.setBundledOutput("back", redstone.getBundledOutput("back") + colr)
   end
   switches[name] = not switches[name]
end

function getClick()
   event,side,x,y = os.pullEvent("monitor_touch")
   button.checkxy(x,y)
end

function lights()
   button.toggleButton("Lights")
   switch("Lights", colors.white)
end

function golems()
   button.toggleButton("Golems")
   switch("Golems", colors.orange)
end

function zombie()
   button.toggleButton("Zombie")
   switch("Zombie", colors.magenta)
end

function skelly()
   button.toggleButton("Skelly")
   switch("Skelly", colors.lightBlue)
end

function spider()
   button.toggleButton("Spider")
   switch("Spider", colors.yellow)
end


function pulseWR(freq, delay)
   wr.setFreq(freq)
   redstone.setOutput("bottom", true)
   sleep(delay)
   redstone.setOutput("bottom", false)
end

function lasers()
   button.toggleButton("Lasers")
   pulseWR(47,0.5)
   button.toggleButton("Lasers")
end

function particles()
   button.toggleButton("Particles")
   pulseWR(45,0.5)
   button.toggleButton("Particles")
end

function teslas()
   button.toggleButton("Teslas")
   pulseWR(46,1.5)
   button.toggleButton("Teslas")
end

function initswitches()
   switches["Lights"] = false
   switches["Golems"] = false
   switches["Zombie"] = false
   switches["Skelly"] = false
   switches["Spider"] = false
   lights()
end

fillTable()
redstone.setBundledOutput("back", 0)
sleep(0.1)
initswitches()
while true do getClick() end