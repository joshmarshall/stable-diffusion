FROM python:3.8-buster

WORKDIR /src

RUN apt update && \
    apt install libgl1 -y

COPY requirements.txt /src/
COPY pyproject.toml /src/

RUN pip install .

COPY models /src/models
COPY assets /src/assets
COPY data /src/data
COPY ldm /src/ldm
COPY configs /src/configs

# COPY scripts/download_first_stages.sh /src/
# COPY scripts/download_models.sh /src/

# RUN chmod a+x ./download_*.sh && \
#     ./download_first_stages.sh \
#     ./download_models.sh

ENTRYPOINT ["txt2img"]
