// This script creates a mount for the MatterControl Touch
// tablet for attaching to a 3D printer. 
// 
// I wanted to create this mount so that I can mount my
// MatterControl Touch to the printer in place of the LCD panel.
// If you haven't used one of these before, you will be 
// amazed at its power, ease of use, and convenience. Simply
// stated, the MatterControl Touch is the LCD panel you've 
// always wanted but have never found. There have been some 
// other good attempts at a full featured LCD/computer mount
// but this one is the best hands down. Don't take my word(s)
// for it - try one yourself.
//
// As you can see, you can modify this script to change the
// mount if you want a different type - clamp or whatever.
// You can also change the length of the arm if you want the 
// table to be further away from the print bed. Feel free
// to customize at will!
// 
// Vitamins:
//
// (2) M3 nylock nuts
// (2) M3 nuts
// (2) 15x30mm strips of self adhesive foam ~1/8" thick
// (4) M3 washers
// (1) M3x25mm bolt
// (1) M3x50mm bolt
// (2) M3x8mm bolts
// (1) MatterControl Touch ;)
//
// Note: you may be able to substitute #6 bolts for the longer M3,
//       but you may need to drill out the holes a bit. Or, better,
//       modify the code to use larger holes.
// 
// Instructions:
//
// 1. Print (1) arm, (1) mount, and (2) clips. PLA is fine.
//    I would use 0.3 layer height and 40% infill for strength.
//    No supports are needed. There are pads on the clip at key locations 
//    to help prevent lifting. Just cut those away when printed.
// 2. Attach the mount to the printer using (2) M3x8 bolts and (2) M3 nuts.
// 3. Attach the arm to the mount using (1) M3x25 bolt, (2) M3 washers and 
//    (1) M3 nylock. Do not tighten, just snug the bolt.
// 4. Attach the clips to either side of the arm using (1) M3x50 bolt,
//    (2) M3 washers, and (1) M3 nylock. Do not tighten, just snug the bolt.
// 5. Attach foam strips.
// 6. Clip the MatterControl Touch into the clip, position, and tighten
//    the bolts. 
//    Tip: Use the camera preview to sight your build plate.
// 
// Created by: drcharlesbell@gmail.com
//
// Enjoy!

module clip(height=3) {
    difference() {
        union() {
            cube([127.5,17,height]);
            // lever
            translate([127.5,-15,0]) cylinder(height,r=20,$fn=32);
            // mount
            translate([51.5,15,0]) rotate([0,0,-60]) cube([5,55,height]);
            translate([116.5,13,0]) rotate([0,0,30]) cube([5,30,height]);
            translate([101.5,40,0]) cylinder(height,r=6,$fn=32);
        }
        translate([5,0,0]) cube([117.5,12,height]);
        translate([100,-40,0]) cube([50,40,height]);
        // mount hole
        translate([101.5,40,-1]) cylinder(height+2,r=1.82,$fn=32);
    }
    // snap clips
    translate([4,1,0]) cylinder(height,r=2,$fn=32);
    translate([123.5,1,0]) cylinder(height,r=2,$fn=32);
    // lever
    translate([139.5,0,0]) cylinder(height,r=1,$fn=32);
    // pads for lift control
    translate([4,0,0]) cylinder(0.5,r=6,$fn=32);
    translate([2,17,0]) cylinder(0.5,r=6,$fn=32);
    translate([126,17,0]) cylinder(0.5,r=6,$fn=32);
    translate([123.5,1,0]) cylinder(0.5,r=6,$fn=32);
    translate([139.5,0,0]) cylinder(0.5,r=6,$fn=32);
}

module mount() {
    difference() {
        union() {
            cube([35,15,5]);
            translate([6,0,5]) cube([23,15,15]);
            translate([6,7.5,20]) rotate([0,90,0]) cylinder(23,r=7.5,$fn=32);
            translate([0,7.5,0]) cylinder(5,r=7.5,$fn=32);
            translate([35,7.5,0]) cylinder(5,r=7.5,$fn=32);
        }
        translate([10,0,5]) cube([15,15,30]);
        translate([0,7.5,0]) cylinder(5,r=1.82,$fn=32);
        translate([35,7.5,0]) cylinder(5,r=1.82,$fn=32);
        translate([5,7.5,20]) rotate([0,90,0]) cylinder(25,r=1.82,$fn=32);
    }
}

module arm(length=30,height=3) {
    difference() {
        union() {
            cube([length,height,height]);
            translate([0,height/2,0]) cylinder(height,r=height/2,$fn=32);
            translate([length,7.5,0]) cylinder(height,r=height/2,$fn=32);
        }
        translate([0,height/2,-1]) cylinder(height+2,r=1.82,$fn=32);
        translate([length,height/2,-1]) cylinder(height+2,r=1.82,$fn=32);
    }
}

translate([0,-25,0]) mount();
clip(15);
translate([0,-45,0]) arm(40,15);