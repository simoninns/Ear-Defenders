/************************************************************************

	ear_muff.scad
    
	Ear Defenders - Open hardware ear defense
    Copyright (C) 2020 Simon Inns
	
    This file is part of Ear_Defenders.
    
    This is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.
    
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
	
    Email: simon.inns@gmail.com
    
************************************************************************/

include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>

// Render the TPU ear-muff
//
// This is a manifold shape, so it needs to be printed with a
// very low infill and low number of perimeters to make it as soft
// as possible
module ear_muff(x, y, z)
{
    ncp1 = 0.01;
    ncp2 = 0.02;
    cup_offset = 3;
    roundrad = 10;
    height = 15;

    color("DimGray") move([x,y,z]) {
        difference() {
            union() {
                move([0,0,0]) rounded_prismoid(size1=[110 - cup_offset,80 - cup_offset], size2=[110 - cup_offset,80 - cup_offset], h=1, r=roundrad, center=false); // Bottom
                move([0,0,-(height - 3)]) rounded_prismoid(size1=[110 - cup_offset - 5,80 - cup_offset - 5], size2=[110 - cup_offset - 5,80 - cup_offset - 5], h=height - 3, r=roundrad + 5, center=false); // Middle
                move([0,0,-(height - 1)]) rounded_prismoid(size1=[110 - cup_offset - 10,80 - cup_offset - 10], size2=[110 - cup_offset - 5,80 - cup_offset - 5], h=2, r=roundrad + 5, center=false); // Top
            }

            // Remove the material from the centre
            move([0,0,-height]) rounded_prismoid(size1=[110 - cup_offset - 5 - 24,80 - cup_offset - 5 - 24], size2=[110 - cup_offset - 10 - 25,80 - cup_offset - 10 - 25], h=3 + ncp1, r=roundrad + 5, center=false);

            move([0,0,-(height - 3)]) rounded_prismoid(size1=[110 - cup_offset - 5 - 30,80 - cup_offset - 5 - 30], size2=[110 - cup_offset - 10 - 25,80 - cup_offset - 10 - 25], h=height - 1, r=roundrad + 5, center=false);
        }
    }
}

module render_ear_muff(x, y, z, rotang, tilt)
{
    move([x, y, z]) {
        rotate([0,rotang - tilt,rotang]) {
            ear_muff(0, 0, 1);
        }
    }
}