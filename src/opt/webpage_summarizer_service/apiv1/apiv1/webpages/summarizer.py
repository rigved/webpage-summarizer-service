"""
summarizer.py
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


from mechanicalsoup import StatefulBrowser
from gensim.summarization.summarizer import summarize


class WebpageSummarizer(object):
    """
    Generates summary of a given web page.
    """
    def __init__(self):
        self.browser = StatefulBrowser(user_agent='Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:73.0) Gecko/20100101 Firefox/73.0')
        self.browser.session.headers.update({'Upgrade-Insecure-Requests': '1'})

    def summarize_webpage(self, url, summarization_ratio):
        """
        Takes a web page URL and returns the title and a summary of the web page.
        :param url: Web page URL.
        :param summarization_ratio: Fraction of original text to include in the summary.
        :return: Web page title and summarized web page text.
        """
        title = summarized_text = ''
        try:
            self.browser.open(url)
            page = self.browser.get_current_page()
            # Find all the paragraphs because they contain the main web page text
            page_text = ' '.join(map(lambda p: p.text, page.find_all('p')))
            title = page.title.text.strip()
            # Generate a summary of the given web page text if it contains more than 10 sentences
            if len(page_text.split(' ')) > 10:
                summarized_text = summarize(page_text, ratio=summarization_ratio).strip()
            else:
                summarized_text = page_text
        except Exception as e:
            print(e)
        finally:
            self.browser.close()

        return title, summarized_text
