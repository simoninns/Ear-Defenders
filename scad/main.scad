/************************************************************************

	main.scad
    
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

include <ear_cup.scad>
include <headband.scad>

// Rendering quality
$fn=100;

// Choose what to display:
output = "All"; // [All, Ear Shell, T-Mount, Ear Muff, Headband]

// Display all
if (output == "All") {
    rotate([0,-90,0]) {
        move([0,0,45]) {
            // Ear cup left
            render_ear_shell(0, 0, 0, 0, 15);
            render_t_mount(0, 0, 0, 0, 15);
            render_ear_muff(0, 0, 0, 0, 15);

            // Ear cup right
            render_ear_shell(0, 0, -100, 180, 15);
            render_t_mount(0, 0, -100, 180, 15);
            render_ear_muff(0, 0, -100, 180, 15);

            // Headband
            render_headband(0,0,0,15);
        }
    }
}

// Display ear shell
if (output == "Ear Shell") {
    render_ear_shell(0, 0, 33, 0, 180);
}

// Display T-Mount
if (output == "T-Mount") {
    render_t_mount(-5, 0, 39, 0, 180);
}

// Display Ear Muff
if (output == "Ear Muff") {
    render_ear_muff(0, 0, 2, 0, 180);
}

// Display headband
if (output == "Headband") {
    rotate([90,0,0]) render_headband(-30,12.5,50,15);
}
