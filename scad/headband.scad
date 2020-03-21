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

    color("MediumBlue") move([x - 12, y, z]) {
        rotate([0,-rotang,0]) {
            move([0,0,-3]) {
                // Left slotted holder
                difference() {
                    move([-5, 0, 34.5]) cuboid([90,25,3], trimcorners=false, chamfer=1, edges=EDGE_FR_LF+EDGE_BK_LF);

                    // Cut slot for the T-piece
                    move([-15, 0, 34.5]) slot(l=50, r1=3.5, r2=3.5, h=4);
                }

                // Left small arc
                rotate([90,-25,0]) {
                    move([30,-31,0]) {
                        rotate_extrude(angle = 66) translate([50, 0, 0]) square(size = [3, 25], center = true);
                    }
                }

                // Left strengthener
                rotate([90,0,0]) {
                    move([85,7,0]) cyl(h=25, d=8, chamfer=0.5);
                }
            }
        }

        rotate([0,rotang,0]) {
            move([26,0,-93.5]) rotate([180,0,0]) {
                // Right slotted holder
                difference() {
                    move([-5, 0, 34.5]) cuboid([90,25,3], trimcorners=false, chamfer=1, edges=EDGE_FR_LF+EDGE_BK_LF);

                    // Cut slot for the T-piece
                    move([-10, 0, 34.5]) slot(l=50, r1=3.5, r2=3.5, h=4);
                }

                // Right small arc
                rotate([90,-25,0]) {
                    move([30,-31,0]) {
                        rotate_extrude(angle = 66) translate([50, 0, 0]) square(size = [3, 25], center = true);
                    }
                }

                // Right strengthener
                rotate([90,0,0]) {
                    move([85,7,0]) cyl(h=25, d=8, chamfer=0.5);
                }
            }
        }

        // Upper
        rotate([90,90,0]) {
            move([50,84,0]) {
                rotate_extrude(angle = 180) translate([76.5, 0, 0]) square(size = [3, 25], center = true);
            }
        }
    }
}