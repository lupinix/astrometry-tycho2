#
# Copyright 2016 Christian Dersch <lupinix@mailbox.org>
# All rights reserved.
#
# License: BSD (2 clause, see LICENSE.txt)
#

# Generate indices as mentioned in http://data.astrometry.net/4100/README
cd build
for i in `seq -w 11 19` ; do
    build-astrometry-index -d 3 -o index-tycho2-${i}.fits -P $i -S MAG_VT -B 0.1 -s 0 -r 1 -I 41${i} -M -i tyc2.fits
done

for i in `seq -w 7 10` ; do
    build-astrometry-index -d 4 -o index-tycho2-${i}.fits -P $i -S MAG_VT -B 0.1 -s 0 -r 1 -I 41${i} -M -i tyc2.fits
done

cd ..
