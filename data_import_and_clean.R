#Thermal Images

#Preamble
library(EBImage)
setwd("~/Documents/Medical_Imaging")
options(EBImage.display = "raster")

f = "~/Documents/Medical_Imaging/0101_baseline_anterior.jpg"
img = readImage(f)
display(img)
View(img@.Data)

#Get Data about Image
img
str(img)
hist(img)


#Crop Image to Necessary constraints (w/o side stuff)
img2 = img[26:615,41:440,]
display(img2)

#Invert Image
img_neg = max(img) - img
display(img_neg)

#Some Linear / Gamma Correction Examples
img_comb = combine(
  img2,
  img2 + 0.3,
  img2 * 2,
  img2 ^ 0.5
)
display(img_comb, all=T)

#Example of Binary Images:
img_thresh = img2 > .56
display(img_thresh)
img_thresh

#Translation
img_translate = translate(img2, v = c(100, -50))
display(img_translate)

#Rotation
img_rotate = rotate(img2, angle = -30, bg.col = "white")
display(img_rotate)

#Scaling
img_resize = resize(img2, w = 295, h = 400)
display(img_resize)
display(img2)

#Verticle and Horizontal Reflections, and transpose
display( flip(img2) )
display( flop(img2) )
imgcol_t = transpose(img2)
display(imgcol_t)

#Filters!
w = makeBrush(size = 11, shape = 'gaussian', sigma = 2)
plot(w[(nrow(w)+1)/2, ], ylab = "w", xlab = "")
img_flo = filter2(img2, w)
display(img_flo)

w = makeBrush(size = 7, shape = 'disc', sigma = 2)
plot(w[(nrow(w)+1)/2, ], ylab = "w", xlab = "")
img_flo = filter2(img2, w)
display(img_flo)
w

#Edge Detection
fhi = matrix(1, nrow = 3, ncol = 3)
fhi[2, 2] = -8
fhi

img_fhi = filter2(img2, fhi)
display(img_fhi)






#Save the present image in wd
filename = "the_name_of_your_file.jpg"
dev.print(jpeg, filename = filename , width = dim(img)[1], height = dim(img)[2])
file.size(filename)
writeImage(img, "sample.jpeg", quality = 100)


#Selecting files with common name
files = list.files(pattern = "*common_part*")
#Show said files and their size
data.frame(row.names=files, size=file.size(files))
