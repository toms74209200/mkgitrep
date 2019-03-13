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
    echo "$project\n" > LICENSE
    echo "MIT License\n" >> LICENSE
    echo "Copyright (c) $year $fullname $address\n" >> LICENSE
    echo "Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:\n" >> LICENSE.txt
    echo "The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.\n" >> LICENSE.txt
    echo "THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.\n" >> LICENSE.txt
elif [ " $license_type" = " apache" ]; then
    echo "$project\n" > LICENSE
    echo "Copyright (c) $year $fullname $address\n" >> LICENSE
    echo "$(cat apache_license.txt)" >> LICENSE
elif [ " $license_type" = " non" ]; then
    echo "$project\n" > LICENSE
    echo "Copyright (c) $year $fullname $address\n" >> LICENSE
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