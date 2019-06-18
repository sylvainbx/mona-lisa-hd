## This script will download the high resolution photo of the famous painting "La joconde" by the Italian Renaissance artist Leonardo da Vinci

This is especially usefull if you want to print real-size copy of the painting, like for theater scenes, or films.
It is using images provided by the IIPImage server and rebuilding them into a full picture

Usage : 
1. Go to http://technologies.c2rmf.fr/iipimage/showcase/zoom/cop29, inspect the network connections and "copy as curl" the last downloaded part of the photo
2. Change the script accordingly, to use the new curl command
3. `sudo vim /etc/ImageMagick-6/policy.xml`
4. Increase the policies for `memory`, `map` and `disk` to respectively `1GiB`, `2GiB` and `4GiB`
5. run the script
6. delete partial files to save disk space
