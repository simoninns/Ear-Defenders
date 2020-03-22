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
    band_thickness = 3;
    color("darkred") move([x,y,z]) {
        move([0,0,0]) cyl(l = 13.5, d = 6.8, center = false, chamfer=0.5);

        difference() {
            move([-3.5,-13,12.5]) cuboid([7,26,2 + 3 + 3], chamfer=0.5, center = false);

            move([-4,-10.25,15]) cuboid([8,20.5,3], center = false);
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