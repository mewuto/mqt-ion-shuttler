# ベースイメージとしてPython 3.9を使用
FROM python:3.9-slim

# 必要なシステムパッケージをインストール
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    && rm -rf /var/lib/apt/lists/*

# Pythonパッケージの依存関係を一括管理するためのrequirements.txtを使用
COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Jupyter Notebookの設定ファイルをコピー
COPY jupyter_notebook_config.py /root/.jupyter/

# Jupyter Notebookのポートを公開
EXPOSE 8888

# コンテナ起動時にJupyter Notebookを起動
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
