from PIL import Image
import PIL
import glob
import os
from pathlib import Path
import cv2
import numpy as np

ImageDir = "images"
base_foler = "path/to/base/dir"



smoothType = "2Dconv"
# smoothType = "GaussianBlur"
# smoothType = "medianBlur"
# smoothType = "bilateralFilter"
# smoothType = "lowPassFilter"

images = glob.glob(os.path.join(base_foler,ImageDir,"*.*"))
for imagePath in images:
    print(imagePath)
    baseName = imagePath.strip().split('/')[-1]
    
    # Reading the image
    image = cv2.imread(imagePath)
    
    if smoothType == "2Dconv":
        kernel2 = np.ones((5, 5), np.float32)/25
        img = cv2.filter2D(src=image, ddepth=-1, kernel=kernel2)
    elif smoothType == "GaussianBlur":
        img = cv2.GaussianBlur(image, (3, 3), 0)
    elif smoothType == "medianBlur":
        img = cv2.medianBlur(image, 3)
    elif smoothType == "bilateralFilter":
        img = cv2.bilateralFilter(image, 9, 75, 75)
    elif smoothType == "lowPassFilter":
        img = cv2.blur(image,(5,5))
    
    Path(os.path.join(base_foler,ImageDir+"_smoothed_with_"+smoothType)).mkdir(parents=True, exist_ok=True)
    cv2.imwrite(os.path.join(base_foler,ImageDir+"_smoothed_with_"+smoothType,baseName), img)
