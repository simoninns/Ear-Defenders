/************************************************************************

	ear_cup.scad
    
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

module ec_shell(x, y, z)
{
    ncp1 = 0.01;
    ncp2 = 0.02;
    wall = 2;
    roundrad = 10;

    color("darkOrange") move([x,y,z]) {
        difference() {
            union() {
                // Ear cup shell
                move([0,0,0]) rounded_prismoid(size1=[110,80], size2=[110,80], h=7, r=roundrad, center=false); // Top 
                move([0,0,7]) rounded_prismoid(size1=[110,80], size2=[90,70], h=14, shift=[1,0], r=roundrad); // Middle
                move([1,0,21]) rounded_prismoid(size1=[90,70], size2=[60,50], h=12, shift=[0,0], r=roundrad); // Bottom
            }

            // Hollow out the ear cup shell
            move([0,0,0 - ncp1]) rounded_prismoid(size1=[110 -  wall,80 - wall], size2=[110 -  wall,80 - wall], h=7 + ncp2, r=roundrad, center=false); // Top
            move([0,0,7 - ncp1]) rounded_prismoid(size1=[110 -  wall,80 - wall], size2=[90 -   wall,70 -  wall], h=14 + ncp2, shift=[1,0], r=roundrad); // Middle
            move([1,0,21 - ncp1]) rounded_prismoid(size1=[90 -  wall,70 - wall], size2=[60 -   wall,50 -  wall], h=12 + ncp2 - 2, shift=[0,0], r=roundrad); // Bottom

            // Hole for head band mount
            move([-5,0,21]) cyl(l = 12, d = 7, center=false);
        }

        difference() {
            // Mounting hole for head band mounting post
            move([-5,0,21 - 2]) cyl(l = 12, d = 7 + wall, center=false);

            move([-5,0,21]) cyl(l = 12, d = 7, center=false);
        }

        // Lip for TPU ear shell
        lip_width = 8;
        lip_offset = 3;
        difference() {
            union() {
                move([0,0,lip_offset]) rounded_prismoid(size1=[110 - wall,80 - wall], size2=[110 - wall,80 - wall], h=4, r=roundrad, center=false);
                move([0,0,lip_offset - 1]) rounded_prismoid(size1=[110 - wall,80 - wall], size2=[110 - wall,80 - wall], h=1, r=roundrad, center=false);
            }

            move([0,0,lip_offset - ncp1]) rounded_prismoid(size1=[110 - lip_width - wall,80 - lip_width - wall], size2=[110 - wall,80 - wall], h=4 + ncp2, r=roundrad, center=false);
            move([0,0,lip_offset - 1 - ncp1]) rounded_prismoid(size1=[110 - lip_width - wall,80 - lip_width - wall], size2=[110 - lip_width - wall,80 - lip_width - wall], h=1 + ncp2, r=roundrad, center=false);
        }

        // Lips to hold TPU ear shell in place
        move([0,39.5,1]) {
            rotate([0,0,0]) {
                rotate([180,0,-90]) prismoid(size1=[1,30], size2=[3,30], shift=[1,0], h=1);
                move([0,-1,-1.5]) cuboid([30,3,1], center = true, chamfer=0.3, edges=EDGE_BOT_FR+EDGE_BOT_BK);
            }
        }

        move([0,-39.5,1]) {
            rotate([0,0,180]) {
                rotate([180,0,-90]) prismoid(size1=[1,30], size2=[3,30], shift=[1,0], h=1);
                move([0,-1,-1.5]) cuboid([30,3,1], center = true, chamfer=0.3, edges=EDGE_BOT_FR+EDGE_BOT_BK);
            }
        }

        move([-54.5,0,1]) {
            rotate([0,0,90]) {
                rotate([180,0,-90]) prismoid(size1=[1,20], size2=[3,20], shift=[1,0], h=1);
                move([0,-1,-1.5]) cuboid([20,3,1], center = true, chamfer=0.3, edges=EDGE_BOT_FR+EDGE_BOT_BK);
            }
        }

        move([54.5,0,1]) {
            rotate([0,0,-90]) {
                rotate([180,0,-90]) prismoid(size1=[1,20], size2=[3,20], shift=[1,0], h=1);
                move([0,-1,-1.5]) cuboid([20,3,1], center = true, chamfer=0.3, edges=EDGE_BOT_FR+EDGE_BOT_BK);
            }
        }
    }
}

// Render the T-shaped mount
module t_mount(x, y, z)
{
    length = 16;
    color("darkred") move([x,y,z]) {
        move([0,0,0]) cyl(l = length, d = 6.8, center = false, chamfer=0.5);
        move([-3.5,-6.5,length -1]) cuboid([7,13,3], chamfer=0.5, center = false);
    }
}

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

module render_ear_shell(x, y, z, rotang, tilt)
{
    move([x, y, z]) {
        rotate([0,rotang - tilt,rotang]) {
            ec_shell(0, 0, 0);
        }
    }
}

module render_t_mount(x, y, z, rotang, tilt)
{
    move([x, y, z]) {
        rotate([0,rotang - tilt,rotang]) {
            t_mount(-5, 0, 21);
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