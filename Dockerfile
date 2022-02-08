ARG rds_host=default
ARG rds_user=default
ARG rds_password=default
ARG rds_database=default
FROM node:latest
# 작업 폴더를 만들고 npm 설치
RUN mkdir /app
WORKDIR /app
# 환경 변수 설정
ENV PATH /app/node_modules/.bin:$PATH
ENV rds_host ${rds_host}
ENV rds_user ${rds_user}
ENV rds_password ${rds_password}
ENV rds_database ${rds_database}
# npm install
COPY package*.json ./
RUN npm install -g npm@8.3.2
RUN npm install --silent
RUN npm install react-scripts@2.1.3 -g --silent
# 소스를 작업폴더로 복사하고 앱 실행
EXPOSE 30020
COPY . .
CMD ["node", "server/server.js"]
