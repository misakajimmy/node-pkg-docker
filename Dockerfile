FROM node:12

RUN npm config set registry https://registry.npm.taobao.org && \
    yarn config set registry http://registry.npm.taobao.org/ && \
    yarn config set sass_binary_site https://npm.taobao.org/mirrors/node-sass && \
    yarn config set electron_mirror https://npm.taobao.org/mirrors/electron/ && \
    yarn config set ELECTRON_MIRROR https://cdn.npm.taobao.org/dist/electron/ && \
    yarn config set puppeteer_download_host https://npm.taobao.org/mirrors && \
    yarn config set chromedriver_cdnurl https://npm.taobao.org/mirrors/chromedriver && \
    yarn config set operadriver_cdnurl https://npm.taobao.org/mirrors/operadriver && \
    yarn config set phantomjs_cdnurl https://npm.taobao.org/mirrors/phantomjs && \
    yarn config set selenium_cdnurl https://npm.taobao.org/mirrors/selenium && \
    yarn config set node_inspector_cdnurl https://npm.taobao.org/mirrors/node-inspector 

RUN npm install -g node-notifier github:vercel/pkg && \
    mkdir /pkg

RUN export PKG_CACHE_PATH=/pkg && \
    pkg-fetch -n node10 -a x64 && \
    pkg-fetch -n node10 -a x64 -p win && \
    pkg-fetch -n node10 -a armv7 && \
    pkg-fetch -n node12 -a x64 && \
    pkg-fetch -n node12 -a x64 -p win && \
    pkg-fetch -n node12 -a armv7 && \   
    pkg-fetch -n node14 -a x64 && \
    pkg-fetch -n node14 -a x64 -p win && \
    pkg-fetch -n node14 -a armv7

ENV PKG_CACHE_PATH=/pkg 