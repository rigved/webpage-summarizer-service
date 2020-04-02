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


# Create the required folders
/bin/mkdir -p /opt/webpage_summarizer_service /etc/sudoers.d

# Copy the code to the correct folders and set the correct ownership
/bin/cp -rv ./src/{etc,opt} /
/bin/chown -R mycroft:mycroft /opt/webpage_summarizer_service

# Restart the Daphne ASGI application servers
/bin/systemctl restart webpage_summarizer_and_pastebin.service
/bin/systemctl restart pastebin_read_only.service
