import base64
from sklearn.cluster import KMeans
import random as rng
import cv2
# import imutils
import argparse
# from imutils import contours
from skimage.io import imread
import numpy as np
import matplotlib.pyplot as plt
import os

from utils import *


ImgPath = 'data/barefeet1.jpeg'

# with open(ImgPath, "rb") as image2string:
#     converted_string = base64.b64encode(image2string.read())
# with open('encode.bin', "wb") as file:
#     file.write(converted_string)

# file = open('encode.bin', 'rb')
# byte = file.read()
# file.close()
  
# decodeit = open('new.jpeg', 'wb')
# decodeit.write(base64.b64decode((byte)))
# decodeit.close()



# def main(byte):
def main(ImgPath):

    oimg = imread(ImgPath)

    # decodeit = open('new.jpeg', 'wb')
    # decodeit.write(base64.b64decode((byte)))
    # decodeit.close()
    # oimg = oimg = imread('new.jpeg')

    if not os.path.exists('output'):
        os.makedirs('output')



    preprocessedOimg = preprocess(oimg)
    cv2.imwrite('output/preprocessedOimg.jpg', preprocessedOimg)

    clusteredImg = kMeans_cluster(preprocessedOimg)
    cv2.imwrite('output/clusteredImg.jpg', clusteredImg)

    edgedImg = edgeDetection(clusteredImg)
    cv2.imwrite('output/edgedImg.jpg', edgedImg)

    boundRect, contours, contours_poly, img = getBoundingBox(edgedImg)
    pdraw = drawCnt(boundRect[1], contours, contours_poly, img)
    cv2.imwrite('output/pdraw.jpg', pdraw)


    croppedImg, pcropedImg = cropOrig(boundRect[1], clusteredImg)
    cv2.imwrite('output/croppedImg.jpg', croppedImg)
    

    newImg = overlayImage(croppedImg, pcropedImg)
    cv2.imwrite('output/newImg.jpg', newImg)

    fedged = edgeDetection(newImg)
    fboundRect, fcnt, fcntpoly, fimg = getBoundingBox(fedged)
    fdraw = drawCnt(fboundRect[2], fcnt, fcntpoly, fimg)
    cv2.imwrite('output/fdraw.jpg', fdraw)

    res = ("feet size (cm): " + str(calcFeetSize(pcropedImg, fboundRect)/10))
    return res


# if __name__ == '__main__':
# main()