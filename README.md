# 2017 Medical Imaging Project

This is the main resource for the code for a 2017 Medical Imaging Project I am working on. For the project's website, please see: [Project Website](https://jmostovoy.github.io/ml/). 

Our first step was figuring a way for how to download medical data from [The MedInfraRed Website](http://medinfrared.com/). To do this, we made use of the Chrome/Firefox plugin [iMacros](https://imacros.net/overview/). We wrote two scrips to automate the download of zipped files, and download of pdf reports, found [here](https://github.com/jmostovoy/Medical_Imaging/blob/master/red_download.java) and [here](https://github.com/jmostovoy/Medical_Imaging/blob/master/white_download.java) respectively.

We are now working on a way to read pdfs, jpgs, and .fff files. We are making use of the following [example](http://data.library.virginia.edu/reading-pdf-files-into-r-for-text-mining/), and software: [Homebrew (for installation of)](https://brew.sh/) [xpdf](http://www.foolabs.com/xpdf/download.html), for which installation instructions are found: [here](https://apple.stackexchange.com/questions/171003/install-xpdf-in-mac-os).