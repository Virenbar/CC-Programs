echest = "west"
net = peripheral.wrap("back")
ae = "appeng_me_tilecolorlesscable_1"
glass= "openperipheral_glassesbridge_0"
net.callRemote(glass,"clear")
screenheight = 768
screenwidth = 1366




request = function()
   event, itmqty = os.pullEvent("chat_command")
   itmqty = tonumber(itmqty)
   event, itmid = os.pullEvent("chat_command")
   itmid = tonumber(itmid)
   event, itmdmg = os.pullEvent("chat_command")
   itmdmg = tonumber(itmdmg)
   reqitem = {id = itmid;dmg = itmdmg;qty = itmqty;}
   unavailable = itmqty - net.callRemote(ae,"countOfItemType",itmid,itmdmg)
      if unavailable > 0 then
      craft = reqitem
      craft[qty] = unavailable
      net.callRemote(ae,requestCrafting,craft)
   end
   net.callRemote(ae,"extractItem",reqitem,echest)	 
end
	    


refresh = function()
end

event,action = os.pullEvent("chat_command")
if action == "req" then
   request()
end