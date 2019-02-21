pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
--------------------------------
-- an example of a 'hacked'   --
-- form of isometric          --
-- projection - it's actually --
-- a dimetric projection.     --
--------------------------------
-- copyright (c) 2019         --
-- alanna kelly               --
-- all rights reserverd.      --
-- this file is part of       --
-- "pico-8 examples" which is --
-- released under the terms of--
-- the mit licence.           --
--------------------------------

-- the 2d screen cordinates of
-- the 3d origin
o={x=63,y=63}

-- a table to store the mesh
mesh={}

-- rotation angle around the z
-- axis
angle_z=0

-- create a 3d point with an
-- optional colour.
function vec3(x,y,z,c)
  c=c or 7
  return {x=x,y=y,z=z,c=c}
end

-- xzy 
-- \|/
function isoproj(v)
  return {
    x=o.x+(v.x-v.y),
    y=o.y-v.z-((v.x/2)+(v.y/2))
  }
end

-- set a 3d point
function isoset(v,c)
  p0=isoproj(v)
  pset(p0.x,p0.y,c)
end

-- draw a 3d line
function isoline(v0,v1,c)
  p0=isoproj(v0)
  p1=isoproj(v1)
  line(p0.x,p0.y,p1.x,p1.y,c)
end

-- rotate points around z axis
-- same as 2d rotation.
function rotz(mesh,th)
-- |x| * |cos(th) -sin(th)|
-- |y|   |sin(th)  cos(th)|
  rotmesh={}
  foreach(mesh,
    function(p)
      add(rotmesh,vec3(
        (p.x*cos(th))-(p.y*sin(th)),
        (p.x*sin(th))+(p.y*cos(th)),
        p.z,
        p.c
      ))
    end
  )
  return rotmesh
end

-- generates a wavy mesh of
-- 3d points
function generate_mesh()
  local mesh={}
  for y=-1.0,1.0,0.1 do
    for x=-1.0,1.0,0.1 do
      local v=vec3(x*40,y*40,sin(y)*5,flr(rnd(15))+1)
      v.r=x
      add(mesh,v)
    end
  end
  return mesh
end

function _init()
  mesh=generate_mesh()
end

function _update()
  -- rotate around z by 1 degree
  -- every update
  angle_z=angle_z+(1.0/360.0)
  if(angle_z>1.0) then
    angle_z=0.0
  end
end

function _draw()
  cls()
  -- draw mesh as points in 3d
  foreach(rotz(mesh,angle_z),
    function(p)
      isoset(p,p.c)
    end
  )
end
