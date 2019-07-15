FROM ubuntu:18.04
MAINTAINER takashi imagire "imagire@gmail.com"

ENV LANG ja_JP.UTF-8
ENV PYTHONIOENCODING utf-8

RUN apt-get -y update
RUN apt-get -y install python3
RUN apt-get -y update
RUN apt-get -y install python3-pip

RUN apt update && apt install -y --no-install-recommends \
# for (u)platex
texlive-lang-japanese \
# for CTAN packages
texlive-plain-generic texlive-latex-base texlive-latex-extra \
# for latexmk
latexmk \
# for noto font: Bold and Regular
fonts-noto-cjk \
# for noto font: Black, DemiLight, Light, Medium, Thin and so on
fonts-noto-cjk-extra \
# for extra fonts
texlive-fonts-recommended \
# for Awesome CV: https://github.com/posquit0/Awesome-CV
texlive-fonts-extra \
texlive-xetex fonts-font-awesome fonts-roboto fontconfig \
# algorithm2e
texlive-science \
# git
git \
&& rm -rf /var/lib/apt/lists/*

RUN mkdir -p $HOME/bin
RUN ln -s /usr/bin/python3.6 $HOME/bin/python
RUN ln -s /usr/bin/python /usr/bin/python3
ENV PATH $PATH:$HOME/bin

CMD ["/bin/bash"]
