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

module side_part()
{
    hb_width = 20;
    hb_thick = 3;

    move([0,0,0]) {
        // Left
        move([0, 0, 31.5]) cuboid([90,hb_width,hb_thick], trimcorners=false, chamfer=1, edges=EDGE_FR_LF+EDGE_BK_LF);

        rotate([0,35,0]) {
            move([37, 0, 51.5]) cuboid([38,hb_width,hb_thick]);
        }

        rotate([0,90,0]) {
            move([-1.3, 0, 74.8]) cuboid([20,hb_width,hb_thick]);
        }

        // Top
        rotate([90,0,0]) {
            move([76,-7,0]) cyl(h=hb_width, d=10, chamfer=0.5);
        }

        // Middle
        rotate([90,0,0]) {
            move([75,10,0]) cyl(h=hb_width, d=6, chamfer=0.5);
        }

        // Bottom
        rotate([90,0,0]) {
            move([45,31,0]) cyl(h=hb_width, d=6, chamfer=0.5);
        }
    }
}

module render_headband(x, y, z, rotang)
{
    hb_width = 20;
    hb_thick = 3;

    color("MediumBlue") move([x - 12, y, z]) {
        move([0,0,0]) rotate([0,-rotang,0]) {
            side_part();
        }

        move([0,0,-75]) rotate([180,rotang,0]) {
                side_part();
        }

        // Upper
        $fn=30;
        rotate([90,90,0]) {
            move([37.5,56,0]) {
                rotate([0,0,10]) rotate_extrude(angle = 160) translate([70, 0, 0]) square(size = [hb_thick + 1, hb_width], center = true);
            }
        }
    }
}