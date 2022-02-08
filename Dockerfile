FROM node:latest
# 작업 폴더를 만들고 npm 설치
RUN mkdir /app
WORKDIR /app
# 환경 변수 설정
ARG rds_host=${rds_host}
ARG rds_user=${rds_user}
ARG rds_password=${rds_password}
ARG rds_database=${rds_database}
RUN touch ./.env                                                                                                   
RUN echo "rds_host=goormy-database-1.ce7mkzss15bi.ap-northeast-2.rds.amazonaws.com \nrds_user=admin \n" \
         "rds_password=groomy1! \n rds_database=goormy_first_database" > ./.env 
# npm install
COPY package*.json ./
RUN npm install -g npm@8.3.2
RUN npm install --silent
RUN npm install react-scripts@2.1.3 -g --silent
# 소스를 작업폴더로 복사하고 앱 실행
EXPOSE 30020
COPY . .
CMD ["node", "server/server.js"]
