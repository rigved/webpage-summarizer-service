#!/bin/bash

##############################################################################
# update_superuser_password.sh
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
webpage_summarizer_service_apiv1_path="${webpage_summarizer_service_path}/apiv1"

# Start the process to reset the Django Superuser password
cd ${webpage_summarizer_service_apiv1_path} || exit 1
source /opt/venvs/mycroft-core/bin/activate
python manage.py changepassword mycroftai

# Set the correct ownership again
/bin/chown -Rv mycroft:mycroft ${webpage_summarizer_service_path}
