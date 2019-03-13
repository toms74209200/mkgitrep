#!bin/bash
#------------------------------------------------------------------------------
# mkgitrep.sh
# 
# Copyright (c) 2019 toms74209200
# 
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
fullname="fullname"
address="<address>"
year=$(date "+%Y")
project=$(basename $(pwd))

echo "select license :"
read license_type

if [ " $license_type" = " mit" ]; then
    echo "MIT License\n" >> LICENSE
    echo "$project Copyright (c) $year $fullname $address\n" >> LICENSE
    echo "$(cat mit_license.txt)" >> LICENSE
elif [ " $license_type" = " apache" ]; then
    echo "Apache License\n" >> LICENSE
    echo "$project Copyright (c) $year $fullname $address\n" >> LICENSE
    echo "$(cat apache_license.txt)" >> LICENSE
elif [ " $license_type" = " non" ]; then
    echo "The Unlicense\n" > LICENSE
    echo "$project Copyright (c) $year $fullname $address\n" >> LICENSE
    echo "All Rights Reserved." >> LICENSE
else
    echo "Types of license you can select: mit(MIT), apache(Apache), and none(Unlicense)."
    exit
fi

# Make README.md
echo "# $project\n" > README.md
echo "## License\n" >> README.md
if [ $license_type = "mit" ]; then
    echo "MIT License\n" >> README.md
elif [ $license_type = "apache" ]; then
    echo "Apache License\n"  >> README.md
else
    echo "The Unlicense\n" >> README.md
fi
echo "## Author\n" >> README.md
echo "[$fullname]($address)\n" >> README.md

# Make git repository
git init
git add LICENSE
git add README.md