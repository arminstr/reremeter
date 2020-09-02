# reremeter

![Picture of reremeter](images/handheld_plastic_type_sensor_reremeter.jpeg)

Reremeter is an handheld and low-cost discrete near infrared reflectance spectrometer and a machine learning algorithm developed to detect different types of plastic. Watch our [video](https://www.youtube.com/watch?v=hrVgNUm2_Jo) to find out more!

This repository contains all the files required to build an reremeter from scratch, and you can use them to make your own version. Please take note that this work is published under GPL-3.0. 

### How to get started
> Please note the current *Issues* before getting started with the build of your own reremeter.

Now the guide on how to get started with the build of your own reremeter.
- Build your own [hardware](./hardware).
- Build and upload the [firmware](./firmware).
- Collect data of your samples (or check out our example [dataset](./data)).
- Make Predictions using our provided Python [scripts](./software).
- Visualize results in an [UI](./webapp).

### Additional information 
- The main idea behind this project came from reading this paper about [Identification and classification of plastic resins using near infrared reflectance spectroscopy](https://www.researchgate.net/publication/285330830_Identification_and_classification_of_plastic_resins_using_near_infrared_reflectance_spectroscopy) by Hamed Masoumi, Seyed Mohsen Safavi, and Zahra Khani.
- Inspiration for the analog frontend design was given by the [ADS1255](https://www.ti.com/product/ADS1255) reference designs on the TI website. They used this ADC in several DLP NIR spectrometer designs. (e.g. [DLP® NIRscan™ Evaluation Module](https://www.ti.com/tool/DLPNIRSCANEVM#2), [DLP Ultra-mobile NIR Spectrometer for Portable Chemical Analysis with Bluetooth Connectivity](https://www.ti.com/tool/TIDA-00554))
- Super interesting [MEMS spectrometer](https://www.neospectra.com/wp-content/uploads/2019/03/NeoSpectra-Polymer-Commodities-01.pdf) by NeoSpectra.

### Notes
The reremeter project is a part of [RealRecycling](https://re-re.org) by Armin Straller and Bernhard Gessler. 
