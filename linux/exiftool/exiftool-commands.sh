######################################################################

brew install exiftool

######################################################################

### show exif data
exiftool $FILE_PATH

### clear all exif data
exiftool -all= $FILE_PATH
