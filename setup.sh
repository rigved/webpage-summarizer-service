#!/bin/bash

##############################################################################
# setup.sh
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
webpage_summarizer_apiv1_path="${webpage_summarizer_service_path}/apiv1"

# Create the required folders
/bin/mkdir -p ${webpage_summarizer_service_path} /etc/sudoers.d

# Copy the code to the correct folders and set the correct ownership
/bin/cp -rv ./src/{etc,opt} /
/bin/chown -Rv mycroft:mycroft ${webpage_summarizer_service_path}

# Setup the Django project
if [[ ! -f ${webpage_summarizer_apiv1_path}/db.sqlite3 ]]; then
    webpage_summarizer_scripts_path="${webpage_summarizer_service_path}/scripts"
    ${webpage_summarizer_scripts_path}/create_database_and_superuser.sh
    ${webpage_summarizer_scripts_path}/update_password_and_token.sh
    ${webpage_summarizer_scripts_path}/update_certificates.sh
fi

# Restart the Daphne ASGI application servers
/bin/systemctl restart webpage_summarizer_and_pastebin.service
/bin/systemctl restart pastebin_read_only.service
