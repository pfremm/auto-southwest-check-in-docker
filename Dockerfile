FROM python

RUN apt-get -y update && apt-get install -y zsh chromium chromium-driver vim git
RUN git clone https://github.com/jdholtz/auto-southwest-check-in.git

WORKDIR /auto-southwest-check-in

COPY webdriver.patch webdriver.patch

RUN patch ./lib/webdriver.py webdriver.patch
RUN pip install -r requirements.txt


CMD python3 southwest.py $USER $PASSWORD
