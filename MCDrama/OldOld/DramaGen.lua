files = {"ac1","activates","adj","badsoft","ban","code","crash","drama","enormous","functions","ircchannel","mods","packs","people","price","says","sentences","sites","things","worse"}

ac1 = {}
activates = {}
adj= {}
badsoft= {}
ban = {}
code = {}
crash = {}
drama = {}
enormous = {}
functions = {}
ircchannel = {}
mods = {}
packs = {}
people = {}
price = {}
says = {}
sentences = {}
sites = {}
things = {}
worse = {}

function loadFile(array,file)
TempFile = fs.open("Drama/"..file..".txt","r")
i = 1
EoF = 0
repeat
  TempText = TempFile.readLine()
  if TempText == nil then
    EoF = 1
  else
    array[i] = TempText
  end
  i = i + 1
until EoF == 1 
TempFile.close()
end

function Get(word)
  --math.randomseed(os.time()+math.random(100))
  --convert array name to array
  funcD = loadstring("return "..word)
  setfenv(funcD, getfenv())
  array = funcD()
  --array ready
  R = math.random(#array)
  print(R)
  --string1 = word.."[R]"
  --funcD = loadstring("return "..word.."[R]")
  --setfenv(funcD, getfenv())
  --out = funcD()
  return array[R]
end

--[[
for i,j in pairs(files) do
    print("loadFile("..j..",files["..i.."])")
end
--]]
loadFile(ac1,files[1])
loadFile(activates,files[2])
loadFile(adj,files[3])
loadFile(badsoft,files[4])
loadFile(ban,files[5])
loadFile(code,files[6])
loadFile(crash,files[7])
loadFile(drama,files[8])
loadFile(enormous,files[9])
loadFile(functions,files[10])
loadFile(ircchannel,files[11])
loadFile(mods,files[12])
loadFile(packs,files[13])
loadFile(people,files[14])
loadFile(price,files[15])
loadFile(says,files[16])
loadFile(sentences,files[17])
loadFile(sites,files[18])
loadFile(things,files[19])
loadFile(worse,files[20])

math.randomseed(os.time()+math.random(100))
while true do
  R = math.random(#sentences)
  print("Sentense: "..R)
  minecraftdrama = sentences[29]
  --print(minecraftdrama)
  repeat
    usage = 0
    for i,j in pairs(files) do	
      pattern = "%["..j.."]"
      minecraftdrama,k = string.gsub(minecraftdrama, pattern, Get(j),1)
      usage = usage + k 
    end
  until usage == 0
  --minecraftdrama = "'"..minecraftdrama.."'"
  -- 
  -- "'..Get("..j..")..'"
  print(minecraftdrama)
  sleep(5)
end