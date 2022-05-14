from bs4 import BeautifulSoup
import requests
import re
from collections import defaultdict

url = "http://localhost"
response = requests.get(url)

# Using BeautifulSoup module to parse html body content
soup = BeautifulSoup(response.text, 'html.parser')

# Word tokenizing, cut html content to word. Also can use jieba/nltk with using stop word.
pattern = re.compile(r'\w+')
html_words = re.findall(pattern, soup.text)

# Word count
word_count = defaultdict(int)
for word in html_words:
    word_count[word] += 1

# print  word count and  the most time word
for word,count in word_count.items():
    print(f'{word} : {count}')
print(sorted(word_count.items(), key = lambda x: x[1], reverse = True)[0])
