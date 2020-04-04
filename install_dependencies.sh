#!/bin/bash

##############################################################################
# install_dependencies.sh
# Copyright (C) 2020  Rigved Rakshit
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
##############################################################################


deb_packages="expect gcc gfortran python-dev libopenblas-dev liblapack-dev cython3 python3-numpy python3-scipy libxml2-dev libxslt1-dev python3-cryptography libmysqlclient-dev"
py_packages="lxml mechanicalsoup pattern gensim django argon2-cffi djangorestframework Twisted[tls,http2] daphne whitenoise[brotli]"

# Install Debian Packages
for deb_package in `echo "${deb_packages}"`; do
    /usr/bin/apt-get --assume-yes install ${deb_package}
done

# Install Python Packages
source /opt/venvs/mycroft-core/bin/activate
for py_package in `echo "${py_packages}"`; do
    python -m pip install ${py_package}
done
