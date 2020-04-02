#!/bin/bash

##############################################################################
# create_database_and_superuser.sh
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


secrets="/opt/webpage_summarizer_service/apiv1/secrets"

# Create the required folder in case it is missing
if [[ ! -d ${secrets} ]]; then
    /bin/mkdir -p "${secrets}"
    # Protect the secret folder
    /bin/chmod 300 ${secrets}
    /bin/chown -v mycroft:mycroft ${secrets}
fi

# Initial setup for the Django project and its Superuser
cd /opt/webpage_summarizer_service/apiv1 || exit 1
source /opt/venvs/mycroft-core/bin/activate
python manage.py migrate
python manage.py createsuperuser --username mycroftai --email mycroftai@localhost --noinput
