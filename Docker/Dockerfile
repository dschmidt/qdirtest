FROM kdeneon/plasma:user-lts

USER root

RUN apt-get install -y qt5-default

WORKDIR /
COPY qdir /
CMD /qdir
