FROM ruby:2.7.2
ENV LANG=C.UTF-8 \
    APP_HOME=/app \
        TZ=Asia/Tokyo

ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
    BUNDLE_JOBS=2 \
    BUNDLE_PATH=/bundle \
    DOCKER=1

WORKDIR $APP_HOME
COPY Gemfile Gemfile.lock package.json yarn.lock $APP_HOME/

# 必要なパッケージインストール
# gcloud, node12, yarn, chromeは標準のaptにないので追加install
# NOTE: node12でいいのか問題: https://nodejs.org/ja/about/releases/
RUN mkdir -p $APP_HOME && \
    apt-get update -qq && \
    apt-get install -y \
        apt-transport-https \
        apt-utils \
        build-essential \
        cmake \
        curl \
        gnupg \
        graphviz \
        python \
        vim \
        wget && \
    curl -s https://sdk.cloud.google.com | bash && \
    curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    sh -c 'wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -' && \
    sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update -qq && \
    apt-get install -y \
        yarn \
        google-chrome-stable && \
        nodejs && \
    gem install bundler && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists

COPY . $APP_HOME
RUN mkdir -p -m 0777 tmp/cache tmp/cache/assets tmp/pids tmp/sockets tmp/storage
