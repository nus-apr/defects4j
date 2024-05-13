import os
import json
import shutil
from os.path import join


with open("meta-data.json") as f:
    data = json.load(f)
    for entry in data:
        dest_dir = join(entry["subject"],entry["bug_id"])
        patch_dir = join(dest_dir, "patches", "arja_e")
        if not os.path.exists(patch_dir):
            continue
        
        for filename in os.listdir(patch_dir):
            file_path = os.path.join(patch_dir, filename)
            try:
                if os.path.isfile(file_path) or os.path.islink(file_path):
                    os.unlink(file_path)
                elif os.path.isdir(file_path):
                    shutil.rmtree(file_path)
            except Exception as e:
                print('Failed to delete %s. Reason: %s' % (file_path, e))
        
        