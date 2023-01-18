# Split generated synthetic dataset to train,val,and test sets

import os
import random
from pathlib import Path
from tqdm import tqdm


img_formats = ['bmp', 'jpg', 'jpeg', 'png', 'tif', 'tiff', 'dng', 'webp', 'mpo']  # acceptable image suffixes
def img2label_paths(img_paths):
    # Define label paths as a function of image paths
    sa, sb = os.sep + 'images' + os.sep, os.sep + 'labels' + os.sep  # /images/, /labels/ substrings
    return ['txt'.join(x.replace(sa, sb, 1).rsplit(x.split('.')[-1], 1)) for x in img_paths]

annotated_only=False
files = []
weights=(0.9, 0.1, 0.0)
for path in  ['path/to/yolo/data/dir']:
    path = Path(path)  # images dir
    files.extend(sum([list(path.rglob(f"*.{img_ext}")) for img_ext in img_formats], []))  # image files only
n = len(files)  # number of files
indices = random.choices([0, 1, 2], weights=weights, k=n)  # assign each image to a split
txt = ['autosplit_train.txt', 'autosplit_val.txt', 'autosplit_test.txt']  # 3 txt files
[(path / x).unlink() for x in txt if (path / x).exists()]  # remove existing
print(f'Autosplitting images from {path}' + ', using *.txt labeled images only' * annotated_only)
for i, img in tqdm(zip(indices, files), total=n):
    if not annotated_only or Path(img2label_paths([str(img)])[0]).exists():  # check label
        with open(path / txt[i], 'a') as f:
            f.write(str(img) + '\n')  # add image to txt file
    
    
