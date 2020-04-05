#!/bin/bash

##############################################################################
# update_password_and_token.sh
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


webpage_summarizer_service_path="/opt/webpage_summarizer_service"
apiv1="${webpage_summarizer_service_path}/apiv1"
secrets="${apiv1}/secrets"
scripts="${webpage_summarizer_service_path}/scripts"

# Create the required folders
/bin/mkdir -p "${secrets}"

# Setup a random Django Superuser password
cd ${scripts} || exit 1
/usr/bin/strings /dev/urandom | /bin/grep -o '[[:graph:]]' | /usr/bin/head -n 128 | /usr/bin/tr -d '\n' | /usr/bin/head -c 64 | /usr/bin/xargs -0 -I{} ./update_superuser_password.exp {}

# Generate a random Django Rest Framework API Token
cd ${apiv1} || exit 1
source /opt/venvs/mycroft-core/bin/activate
python manage.py drf_create_token -r mycroftai | awk '{print $3}' > ${secrets}/api.token

# Protect secret files
/bin/chmod 300 ${secrets}
/bin/chmod 600 ${secrets}/*
/bin/chown -R mycroft:mycroft ${secrets}
