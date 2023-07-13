pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
--------------------------------
-- a simple example of using  --
-- large numbers in pico-8    --
-- code. it is intented to be --
-- simple to understand and   --
-- use in your own projects.  --
--------------------------------     
-- copyright (c) 2019         --
-- alanna kelly               --
-- this file is part of       --
-- "pico-8 examples" which is --
-- released under the terms of--
-- the mit licence.           -- 
--------------------------------

-- total score global, if you --
-- want bigger numbers just   --
-- add another 0              --
total={0,0,0,0,0,0,0,0,0,0,0,0}

-- converts a number to a     --
-- least significant digit    --
-- (lsd) first sequence.      --
function num_to_lsd_seq(num)
  seq = {}
  while num != 0 do
    add(seq,num % 10)
    num = flr(num/10)
  end
  return seq
end

-- converts a lsd first seq to--
-- a string                   --
function lsd_seq_to_str(seq)
  str = ""
  for i=#seq,1,-1 do
    str=str..seq[i] 
  end
  return str
end

-- adds points to score. this --
-- is the same alogoritm a    --
-- human uses to add large    --
-- numbers or a cpu uses to   --
-- add numbers larger than    --
-- native word size. it can't --
-- add more than 32767 points --
-- at a time as implemented   -- 
function score(points)
  carry = 0
  points_seq = num_to_lsd_seq(points)
  for i=1,#total do
    acc = carry + total[i]
    if points_seq[i] != nil then
      acc += points_seq[i]
    end
    carry = flr(acc/10)
    total[i]= acc % 10
  end
end

function _init()
 
end

function _update()
  score(23456)
end

function _draw()
  cls()
  print(lsd_seq_to_str(total),20,20)
end  
