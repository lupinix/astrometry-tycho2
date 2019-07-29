#
# Copyright 2016 Christian Dersch <lupinix@mailbox.org>
# All rights reserved.
#
# License: BSD (2 clause, see LICENSE.txt)
#

import os
from astropy.io import ascii, fits
from astropy.table import Table, vstack
from glob import glob

# Specify columns containing positions and brightness in main Tycho-2
tyc2_ra_col = "col3"
tyc2_dec_col = "col4"
tyc2_vtmag_col = "col20"

# Specify columns containing positions and brightness in Supplement-1
suppl_ra_col = "col3"
suppl_dec_col = "col4"
suppl_vtmag_col = "col14"

# Create a table containing positions and brightness for whole Tycho-2
cat = Table(names=("RA","DEC","MAG_VT"))
tyc2_cat_files = glob("cat/tyc2.dat.*")
tyc2_cat_files.sort()
for tyc2_dat in tyc2_cat_files:
    print("Processing file ",tyc2_dat)
    tyc2_dat_table = ascii.read(tyc2_dat)
    tyc2_dat_table.rename_column(tyc2_ra_col,"RA")
    tyc2_dat_table.rename_column(tyc2_dec_col,"DEC")
    tyc2_dat_table.rename_column(tyc2_vtmag_col,"MAG_VT")
    cat = vstack([cat,tyc2_dat_table["RA","DEC","MAG_VT"]], join_type="exact")
# Append Supplement-1, lists stars  from the  Hipparcos and  Tycho-1 Catalogues
# which are not in Tycho-2.
print("Processing Supplement-1")
suppl_table = ascii.read("cat/suppl_1.dat.gz")
suppl_table.rename_column(suppl_ra_col,"RA")
suppl_table.rename_column(suppl_dec_col,"DEC")
suppl_table.rename_column(suppl_vtmag_col,"MAG_VT")
cat = vstack([cat,suppl_table["RA","DEC","MAG_VT"]])

# Now generate the FITS table
print("Generating FITS table")
if not os.exists("build"):
    os.mkdir("build")
tyc2_fits = fits.BinTableHDU.from_columns([
    fits.Column(name="RA", format="E", array=cat["RA"]),
    fits.Column(name="DEC", format="E", array=cat["DEC"]),
    fits.Column(name="MAG_VT", format="E", array=cat["MAG_VT"])])
tyc2_fits.writeto("build/tyc2.fits", overwrite=True)
print("FITS table written to build/tyc2.fits")

