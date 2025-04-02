--

pals={
 "1a1c2c5d275db13e53ef7d57ffcd75a7f07038b76425717929366f3b5dc941a6f673eff7f4f4f494b0c2566c86333c57",
 "140c1c44243430346d4e4a4f854c30346524d04648757161597dced27d2aa996dc2cadad45edeeed6",
 "0000007e7e7ebebebeffffff7e0000ff0000007e0000ff007e7e00ffff0000007e0000ff7e007eff00ff007e7e00ffff",
 "0000001d2b537e255383769cab5236008751ff004d5f574fff77a8ffa300c2c3c700e436ffccaa29adffffec27fff1e8",
 "000000626262898989adadadffffff9f4e44cb7e756d5412a1683cc9d4879ae29b5cab5e6abfc6887ecb50459ba057a3",
 "000000111111222222333333444444555555666666777777888888999999aaaaaabbbbbbccccccddddddeeeeeeffffff",
 "242124302a463c3368483d8b854974c2565dff6347ff678fff7b96ff9f5affc41dffdd00ffeb00fff800f6f653e6e6fa",
 "002244002851002e5e00356b0a407e144b921e57a62862ba3570be4682b442c0c653e5d779efe79ff9f7c6fcfff0f8ff"
}

function pal(p)
 for i=0,15 do
  poke(0x3fc0+i*3,tonumber(p:sub(i*6+1,i*6+2),16))
  poke(0x3fc1+i*3,tonumber(p:sub(i*6+3,i*6+4),16))
  poke(0x3fc2+i*3,tonumber(p:sub(i*6+5,i*6+6),16))
 end
end

function chgpal()
 if btnp(0) then
  cpal=(cpal-2)%#pals+1
  pal(pals[cpal])
 elseif btnp(1) then
  cpal=cpal%#pals+1
  pal(pals[cpal])
 end
end

cpal=1
pal(pals[cpal])

w=240
s=18
t=0
text="Wobble! Wobble!"

function TIC()
 cls()

 for i=1,#text do
  c=string.sub(text,i,i)
  x=(i*s-t)%(w+(4*s))
  y=60+math.sin(i+t/9)*10
  print(c,x,y,12,true,3)
 end

 t=t+1

 if t%120==0 then
  cpal=cpal%#pals+1
  pal(pals[cpal])
 end 
end
