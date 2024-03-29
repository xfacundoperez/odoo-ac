ARG ODOO_VERSION
FROM odoo:${ODOO_VERSION}

USER root

# Generate locale (es_AR for right odoo es_AR language config, and C.UTF-8 for postgres and general locale data)
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -qq && apt-get install -y locales -qq
RUN echo 'es_AR.UTF-8 UTF-8' >> /etc/locale.gen && locale-gen
RUN echo 'es_CL.UTF-8 UTF-8' >> /etc/locale.gen && locale-gen
RUN echo 'es_US.UTF-8 UTF-8' >> /etc/locale.gen && locale-gen
RUN echo 'C.UTF-8 UTF-8' >> /etc/locale.gen && locale-gen
RUN dpkg-reconfigure locales && /usr/sbin/update-locale LANG=C.UTF-8
ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8

# Install some deps
RUN apt-get update && apt-get install -y \
    python-pip python-virtualenv gcc git swig \
    mercurial build-essential m2crypto

# Workers and longpolling dependencies
RUN apt-get install -y python-gevent

## Install pip dependencies for adhoc used odoo repositories
# 
# used by many pip packages
RUN apt-get install -y python-dev freetds-dev

# odoo-extra
RUN apt-get install -y python-matplotlib font-manager python-setuptools

# odoo argentina (nuevo modulo de FE).
RUN apt-get install -y libffi-dev libssl-dev python-m2crypto python-httplib2 mercurial

# NECESARIOS PARA SIGNXML
RUN apt-get install -y libxml2-dev libxslt-dev lib32z1-dev liblz-dev

RUN apt-get install -y python3-pip python3-gevent python3-dev python3-venv \
    python3-matplotlib python3-httplib2 python3-wheel python3-setuptools

# Upgrade antes de instalar modulos
RUN pip3 install --upgrade pip

# Copy file requirements.txt
# Before execute: addons/get_requirements.sh
COPY ./files/requirements.txt /
COPY ./files/requirements-manual.txt /

# Install Requeriments of addons
RUN python3 -m pip install -r requirements.txt --no-cache-dir

# Install Requeriments Manual
RUN python3 -m pip install -r requirements-manual.txt --no-cache-dir

## Clean apt-get (copied from odoo)
RUN apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false -o APT::AutoRemove::SuggestsImportant=false
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# fix 'dh key too small' error https://stackoverflow.com/questions/38015537/python-requests-exceptions-sslerror-dh-key-too-small
RUN sed  -i "s/CipherString = DEFAULT@SECLEVEL=2/CipherString = DEFAULT@SECLEVEL=1/" /etc/ssl/openssl.cnf
RUN mkdir /usr/local/lib/python3.7/dist-packages/pyafipws/cache
RUN chmod -R 777 /usr/local/lib/python3.7/dist-packages/pyafipws/cache

# Fix Jquery
COPY ./files/jquery-3.5.1.js /usr/lib/python3/dist-packages/odoo/addons/web/static/lib/jquery/jquery.js

USER odoo
