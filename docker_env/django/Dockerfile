FROM registry.cn-zhangjiakou.aliyuncs.com/dvadmin-pro/python38-base-backend:latest
WORKDIR /backend
COPY ./backend/ .
COPY ./backend/conf/env.example.py /dvadmin-backend/conf/env.py
RUN python3 -m pip install -i https://mirrors.aliyun.com/pypi/simple/ -r /requirements.txt
CMD ["daphne","-b","0.0.0.0","-p","8000","application.asgi:application"]
