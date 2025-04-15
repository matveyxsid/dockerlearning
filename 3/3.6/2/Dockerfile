FROM python:3.9
ARG BUILD_MODE=dev
RUN echo "Building mode $BUILD_MODE"
LABEL maintainer="test@test.test" \
      version="1.0.0"
RUN useradd -m -s /bin/bash user
USER user
VOLUME /home/user/myapp/data
WORKDIR /home/user/myapp
ONBUILD COPY . /home/myapp/extra
STOPSIGNAL SIGQUIT
HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
            CMD curl -f http://localhost:8080 || exit 1
SHELL ["/bin/bash", "-c"]
COPY ./app.py /home/user/myapp/
RUN pip install Flask
EXPOSE 8080
CMD ["python", "/home/user/myapp/app.py"]

