"""
views.py
Modifications Copyright (C) 2020  Rigved Rakshit

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published
by the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
"""


from rest_framework import viewsets
from rest_framework import permissions
from .models import Webpage, Paste
from .serializers import WebpageSerializer, PasteSerializer


class WebpageViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows adding new webpage URLs to the queue, summarizing
    webpages, and retrieving all the webpage summaries in the queue.
    """
    queryset = Webpage.objects.all()
    serializer_class = WebpageSerializer
    permission_classes = [permissions.IsAuthenticated]


class PasteViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows adding new pastebin data that can be shared.
    """
    queryset = Paste.objects.all()
    serializer_class = PasteSerializer
    permission_classes = [permissions.IsAuthenticated]
