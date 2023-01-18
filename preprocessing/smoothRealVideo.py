from PIL import Image
import PIL
import glob
import os
from pathlib import Path
import cv2
import numpy as np

VidDir = "videos"
base_foler = "path/to/base/dir"



smoothType = "2Dconv"
# smoothType = "GaussianBlur"
# smoothType = "medianBlur"
# smoothType = "bilateralFilter"
# smoothType = "lowPassFilter"

videos = glob.glob(os.path.join(base_foler,VidDir,"*.*"))
for vidPath in videos:
    print(vidPath)
    baseName = vidPath.strip().split('/')[-1]
    
    # Video reading
    Path(os.path.join(base_foler,VidDir+"_smoothed2_with_"+smoothType)).mkdir(parents=True, exist_ok=True)
    save_path = os.path.join(base_foler,VidDir+"_smoothed2_with_"+smoothType,baseName)
    
    image = cv2.imread(vidPath)
    vid_cap = cv2.VideoCapture(vidPath)
    i = 0
    while(vid_cap.isOpened()):
      ret, img = vid_cap.read()
      
      print(i, ret)
      i += 1
      if i==1:
        fps = vid_cap.get(cv2.CAP_PROP_FPS)
        w = int(vid_cap.get(cv2.CAP_PROP_FRAME_WIDTH))
        h = int(vid_cap.get(cv2.CAP_PROP_FRAME_HEIGHT))
        vid_writer = cv2.VideoWriter(save_path, cv2.VideoWriter_fourcc(*'mp4v'), fps, (w, h))
        
      if ret == True:
        if smoothType == "2Dconv":
            # kernel2 = np.ones((5, 5), np.float32)/25
            kernel2 = np.ones((3, 3), np.float32)/9
            img = cv2.filter2D(src=img, ddepth=-1, kernel=kernel2)
        elif smoothType == "GaussianBlur":
            img = cv2.GaussianBlur(img, (3, 3), 0)
        elif smoothType == "medianBlur":
            img = cv2.medianBlur(img, 3)
        elif smoothType == "bilateralFilter":
            img = cv2.bilateralFilter(img, 9, 75, 75)
        elif smoothType == "lowPassFilter":
            img = cv2.blur(img,(5,5))
        vid_writer.write(img)
        
      # Break the loop
      else: 
        break
    vid_cap.release()
