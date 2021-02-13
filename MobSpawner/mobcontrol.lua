os.loadAPI("button")
m = peripheral.wrap("top")
rednet.open("left")
m.clear()

function fillTable()
   button.setTable("Sheep",sheer,10,25,3,6)
   button.setTable("Place Mobs",place,10,25,8,11)
   button.setTable("Remove Mobs",remove,10,25,13,16)
   button.screen()
end

function getClick()
   event,side,x,y = os.pullEvent("monitor_touch")
   button.checkxy(x,y)
end

function place()
   button.toggleButton("Place Mobs")
   shell.run("sendmsg","place")
   button.toggleButton("Place Mobs")
end

function remove()
   button.toggleButton("Remove Mobs")
   shell.run("sendmsg","remove2")
   button.toggleButton("Remove Mobs")
end

function sheer()
   button.flash("Sheep")
   shell.run("sheepmsg")
end

fillTable()
while true do getClick() end