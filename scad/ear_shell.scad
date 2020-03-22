/************************************************************************

	ear_shell.scad
    
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
    wall = 4;
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
            move([0,0,0 - ncp1]) rounded_prismoid(size1=[110 -  (wall * 2),80 - (wall * 2)], size2=[110 -  (wall * 2),80 - (wall * 2)], h=7 + ncp2, r=roundrad, center=false); // Top
            move([0,0,7 - ncp1]) rounded_prismoid(size1=[110 -  (wall * 2),80 - (wall * 2)], size2=[90 -   (wall * 2),70 -  (wall * 2)], h=14 + ncp2, shift=[1,0], r=roundrad); // Middle
            move([1,0,21 - ncp1]) rounded_prismoid(size1=[90 -  (wall * 2),70 - (wall * 2)], size2=[60 -   (wall * 2),50 -  (wall * 2)], h=12 + ncp2 - 2, shift=[0,0], r=roundrad); // Bottom

            // Cavity for ear muff
            move([0,0,0 - ncp1]) rounded_prismoid(size1=[110 -  2,80 - 2], size2=[110 -  2,80 - 2], h=2 + ncp2, r=roundrad, center=false); // Top

            // Hole for head band mount
            move([1,-3,30]) cuboid([8,6, wall + 2], center=false);
        }

        difference() {
            // Mounting hole for head band mounting post
            move([0,-4,21 - 2]) cuboid([10,8,12], center=false);
            move([1,-3,21]) cuboid([8,6,12], center=false);
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

module render_ear_shell(x, y, z, rotang, tilt)
{
    move([x, y, z]) {
        rotate([0,rotang - tilt,rotang]) {
            ec_shell(0, 0, 0);
        }
    }
}
