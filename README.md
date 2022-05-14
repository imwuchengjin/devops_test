- Use Terraform or Ansible or CloudFormation to automate the following tasks against any cloud provider platform, e.g. AWS, GCP, Aliyun.

  Using terraform to achieve it. See in the terraform directory.

- Provision a new VPC and any networking related configurations.

  Using terraform to achieve it. See in the terraform directory.

- In this environment provision a virtual machine instance, with an OS of your choice.

  Using terraform to achieve it. See in the terraform directory.

- Apply any security hardening (OS, firewall, etc..) you see fit for the VM instance.

  Using terraform to achieve it. See in the terraform directory.

- Install Docker CE on that VM instance.

```she
sudo yum install docker
```

- Deploy/Start an Nginx container on that VM instance.

```she
sudo docker run -itd --name nginx-test nginx
```

- Demonstrate how you would test the healthiness of the Nginx container.

```she
# watch uptime
docker ps

# test nginx web response code if is 200
curl -l -o /dev/null -w %{http_code} -s localhost:80
```

- Expose the Nginx container to the public web on port 80.

```she
sudo docker run -itd --name -p 80:80 nginx-test nginx
```

- Fetch the output of the Nginx container’s default welcome page.

```
curl localhost:80
```

- Excluding any HTML/JS/CSS tags and symbols, output the words and their frequency count for the words that occurred the most times on the default welcome page.

Writing a python script to achieve it.

 ```py
 !pip3 install beautifulsoup4
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
 ```

•    Demonstrate how you would log the resource usage of the containers every 10 seconds.

```shel
sudo docker stats nginx-test --no-stream | tail -n 1
```

