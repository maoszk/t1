# jupyter/scipy-notebook　イメージをもとにReNom環境を構築する
FROM jupyter/scipy-notebook

#proxy設定を追加する必要がある

USER root
#build-essentialsなど基本的なモジュールのインストール
RUN apt-get update 
RUN apt-get upgrade -y
RUN apt-get install build-essential -y
RUN apt-get install vim -y
RUN pip install --upgrade pip

#不足?
#他のモジュールについても、一部ReNom指定とバージョン異なるものあり
RUN pip install pytest==3.0.7
RUN pip install PyQt5


USER jovyan
#ReNom DP install
RUN git clone https://github.com/ReNom-dev-team/ReNom.git /tmp/ReNom
WORKDIR /tmp/ReNom
RUN pip install -e .

#ReNom TDA
RUN git clone https://github.com/ReNom-dev-team/ReNomTDA.git /tmp/ReNomTDA
WORKDIR /tmp/ReNomTDA
RUN pip install -e .
