FROM python:3.8-alpine
RUN echo "@community http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
        && apk add py3-pandas@community
ENV PYTHONPATH="/usr/lib/python3.8/site-packages"
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY requirements.txt /usr/src/app/
COPY ./twoslotgroundpokemons.csv /usr/src/app
RUN pip install --no-cache-dir -r requirements.txt

COPY . /usr/src/app

EXPOSE 8089

CMD [ "python", "./app.py" ]