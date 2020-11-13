# hardware v2

We are currently working on a second version of the low cost plastic sensor based on a MEMS-FPI chip by HAMAMATSU.

This folder now contains the schematics in the folders spectrometer-2 and usb-interface-2.

# reremeter hardware

![Sketch of reremeter exported from CAD model](../images/reremeter_sketch.png)

This folder contains all of the source files for making your own reremeter PCB hardware: a Autodesk Eagle project file for the PCB in spectrometer/, rendered gerber files from the Eagle project in manufacturing/, and exported schematics in this [file](Spectrometer_Schematic.pdf).

The PCB design includes mainly SMT components as the handheld form factor was design criteria. It is possible to assemble individual boards by hand in a few hours (if you bring in decent SMT soldering skills), however for multiple boards it would be advisable to order multiple fully assembled (or at least SMT assembled) PCBs. If you wish to have the PCB manufactured, the files in manufacturing/ should be all you need; additionally, a bill of materials is available [here](manufacturing/Spectrometer_BOM.txt).

Following parts on the BOM previously raised issues:
- X301 is a quartz crystal with 8MHz: FL0800008QDICT-ND
- X302 is a 9pin ARM debug connector: SAM9438-ND
- D20 is a 800nm ~ 1700nm photodetector: 209-003-151-001CT-ND

The mentioned part numbers are from DigiKey. The 8MHz quartz is a replacement part that should fit properly. 
