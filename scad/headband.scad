/************************************************************************

	headband.scad
    
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
use <BOSL/beziers.scad>

module render_headband(x, y, z, rotang)
{
    ncp1 = 0.01;
    ncp2 = 0.02;

    hb_width = 20;
    hb_thick = 3.1; // 3.1 to make the fit between the T-mount tighter

    color("MediumBlue") move([x - 12, y, z]) {
        rotate([0,-rotang,0]) {
            move([0,0,-3]) {
                // Left slotted holder
                difference() {
                    move([0, 0, 34.5]) cuboid([80,hb_width,hb_thick], trimcorners=false, chamfer=1, edges=EDGE_FR_LF+EDGE_BK_LF);

                    // Cut slot for the T-piece
                    move([-7, 0, 34.5]) slot(l=50, r1=3.5, r2=3.5, h=hb_thick + 1);
                }

                // Left small arc
                rotate([90,-25,0]) {
                    move([30,-31,0]) {
                        rotate_extrude(angle = 66) translate([50, 0, 0]) square(size = [hb_thick, hb_width], center = true);
                    }
                }

                // Left strengthener
                rotate([90,0,0]) {
                    move([85,7,0]) cyl(h=hb_width, d=10, chamfer=0.5);
                }
            }
        }

        rotate([0,rotang,0]) {
            move([26,0,-83.5]) rotate([180,0,0]) {
                // Right slotted holder
                difference() {
                    move([0, 0, 34.5]) cuboid([80,hb_width,hb_thick], trimcorners=false, chamfer=1, edges=EDGE_FR_LF+EDGE_BK_LF);

                    // Cut slot for the T-piece
                    move([-7, 0, 34.5]) slot(l=50, r1=3.5, r2=3.5, h=hb_thick+1);
                }

                // Right small arc
                rotate([90,-25,0]) {
                    move([30,-31,0]) {
                        rotate_extrude(angle = 66) translate([50, 0, 0]) square(size = [hb_thick, hb_width], center = true);
                    }
                }

                // Right strengthener
                rotate([90,0,0]) {
                    move([85,7,0]) cyl(h=hb_width, d=10, chamfer=0.5);
                }
            }
        }

        // Upper
        rotate([90,90,0]) {
            move([46,44,0]) {
                // 76.5
                rotate([0,0,30]) rotate_extrude(angle = 122) translate([80.5, 0, 0]) square(size = [hb_thick, hb_width], center = true);
            }
        }
    }
}