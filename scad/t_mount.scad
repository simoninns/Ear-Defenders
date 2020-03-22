/************************************************************************

	t_mount.scad
    
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

// Render the T-shaped mount
module t_mount(x, y, z)
{
    // band is 20mm by 5mm
    color("darkred") move([x,y,z]) {
        move([-5, -3,0]) cuboid([8,6, 14], center = false, chamfer=0.5);

        difference() {
            move([-5,-15,13]) cuboid([8,30,12], chamfer=0.5, center = false);

            move([-6,-12.5,15]) cuboid([12,25,12], center = false);

            rotate([-90,0,0]) move([-1,-21,-16]) cyl(l=32, r=2, center=false);
        }

        
    }
}

module t_mount_clip(x, y, z)
{
    color("green") move([x,y,z]) {
        difference() {
            move([-5,-12.25,17]) cuboid([8,24.5,8], chamfer=0.5, center = false);

            move([-6,-10, 18.5]) cuboid([10,20,5], center = false);
        }

        rotate([-90,0,0]) move([-1,-21,-14]) cyl(l=3, r=2, center=false, chamfer=0.7);
        rotate([-90,0,0]) move([-1,-21,+11]) cyl(l=3, r=2, center=false, chamfer=0.7);
    }
}

module render_t_mount(x, y, z, rotang, tilt, printpos)
{
    move([x, y, z]) {
        rotate([0,rotang - tilt,rotang]) {
            if (!printpos) {
                // Layout for display
                t_mount(-5, 0, 21);
                t_mount_clip(-5, 0, 21);
            } else {
                // Layout for printing
                t_mount(-5, 0, 21);
                t_mount_clip(-5, 0, 30);
            }
        }
    }
}