# Overview

Working from home seems like a great idea when it’s by choice, but during these strange times of social distancing and self-isolation it can be hard to focus and get things done with the kids screaming and running around, teenagers blaring music and video games as well as the general background noise of life in a busy house.

Fear not, even if you can’t go to the hardware store, you can now 3D print your very own set of attractive ear defenders!  These handy head-mounted devices recreate the warm, calm, happy space of a quiet office allowing you to focus and get those TPS reports done on time.

All parts are suitable for printing with PETG except the ear-muffs (the bits that sit around the ear) which should be printed in TPU to ensure a soft, silky caress to the sides of your head.

It should go without saying that these are not designed or certified for ear protection from heavy machinery, loud explosions or steam-hammers (why on earth would you be doing that at home?) - put them on, use your laptop or read a book in happy isolation from minor noise sources.

<img src="/images/ear_defenders1.png" width="800">

# Printing instructions

## Overview

The model has been printed and tested on the Prusa MK3S/MMU2S printer. All parts are symmetrical, so the same part is printed twice for each ear (except the headband of course).  All parts fit on a 20x20 printing bed.

The OpenSCAD source files provide a parameter interface that allows you to render either the whole model or the individual parts (placed flat on the axis read for STL (or other 3D format) export).  This requires OpenSCAD 2019.05 or later.

The github repository for the model can be found at https://github.com/simoninns/Ear-Defenders

You may be wondering "do they really work?", well the effectiveness of the ear defenders depends on two things, 1) the quality of the acoustic foam and 2) the quality of the seal around the ears.  Solving 1 is just a case of using the right stuff.  Solving 2 is a bit more difficult; ideally you would use a headband made with spring-steel to increase the lateral pressure on the ear cups, but I wanted to keep it completely 3D printable.  By using thick PETG you can achieve a fairly good amount of pressure, but it's not the ideal material for the job (there's quite a limit to how much it can flex before it breaks).  Simply replacing the headband with a cloth-wrapped spring steel alternative would make the ear defenders every bit as good as the commercial ones.  You could also improve the seal by using softer TPU (or making some foam filled ear-muffs). For the sake of simplicity (and ease of printing) I used 98A TPU; a softer filament would be even better, but they are tricky to print with.

## Recommended print settings
### Ear shell
* Number required: 2
* Material: Prusament PETG (Prusa Orange)
* Layer: 0.20mm (Quality)
* Infill: 15%
* Supports: None
* Notes: The ear shell should be stuffed with dense acoustic foam (although just about any foam or other material will act to lower ambient sound amplitude).  Simply cut some foam with scissors and push into the ear cups after the ear-muffs have been clipped in place. For additional attenuation of sound glue the ear muffs to the ear shell to form an air tight seal.

<img src="/images/ear_shell.png" width="800">

### T-Mount
* Number required: 2
* Material: Prusament PETG (Jet Black)
* Layer: 0.20mm (Quality)
* Infill: 25%
* Supports: None
* Notes: The T-Mounts should press in firmly into the holes in the ear shells (don't use too much force though).  If the fit is too tight sand down the sides of the mounting post a little until the mount slides in but is held firmly.  It's best to fit the lower part of the T-mount into the ear shell first, then slide the second part onto the headband before finally snapping the two parts of the mount together.

<img src="/images/t_mount.png" width="800">

### Headband
* Number required: 1
* Material: Prusament PETG (Jet Black)
* Layer: 0.20mm (Quality)
* Infill: 25%
* Supports: Everywhere

<img src="/images/headband.png" width="800">

### Ear muff
* Number required: 2
* Material: Fillamentum Flexfill 98A (Traffic Black)
* Layer: 0.20mm (Quality)
* Infill: 7% (set to rectilinear)
* Supports: None
* Notes: If you don't have TPU filament available it's possible to print this part in PETG too, only it won't be quite as comfortable (but it still works to isolate your ears); just make sure to increase the infill for other materials.  The ear muffs are designed to clip into the ear cups using the four small clips around the ear-cup (they are designed to be removed easily in case you wish to clean them).

<img src="/images/ear_muff.png" width="800">

## Print time
Clearly this depends on your printer and it's settings, but I had the following approximate timings:

* Ear shells - 8h45 (2 at the same time)
* Headband and T-mounts - 4h20 (1 headband, 2 T-mounts)
* Ear muffs - 7h05 (2 at the same time)

So a total of about 20 hours and 10 minutes.

# Author

The 3D printable ear-defenders are designed and maintained by Simon Inns.

# Licensing

## OpenSCAD source files - software license (GPLv3)

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

## 3D model file - Creative Commons license (Creative Commons BY-SA 4.0)

Please see the following link for details: https://creativecommons.org/licenses/by-sa/4.0/

You are free to:

Share - copy and redistribute the material in any medium or format
Adapt - remix, transform, and build upon the material
for any purpose, even commercially.

This license is acceptable for Free Cultural Works.

The licensor cannot revoke these freedoms as long as you follow the license terms.

Under the following terms:

Attribution - You must give appropriate credit, provide a link to the license, and indicate if changes were made. You may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use.

ShareAlike - If you remix, transform, or build upon the material, you must distribute your contributions under the same license as the original.

No additional restrictions - You may not apply legal terms or technological measures that legally restrict others from doing anything the license permits.

