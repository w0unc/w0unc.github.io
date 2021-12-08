FROM debian:stable

SHELL ["/bin/bash", "-c"]

RUN apt update && apt upgrade -y

RUN apt install curl ruby-full build-essential zlib1g-dev -y

RUN echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc && \
    echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc && \
    echo 'export PATH="$HOME/gems/bin:\$PATH"' >> ~/.bashrc && \
    source ~/.bashrc

RUN gem install jekyll bundler

LABEL Name=w0unc.github.io Version=0.0.1

EXPOSE 4000