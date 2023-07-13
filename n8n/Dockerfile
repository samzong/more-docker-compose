FROM n8nio/n8n:latest

# 安装所需软件包
RUN npm install -g jsdom fs fs-core --no-cache
RUN cd /usr/local/lib/node_modules/n8n && npm install -g jsdom fs fs-core --no-cache


# 设置环境变量等

# 执行启动命令
CMD ["n8n"]

