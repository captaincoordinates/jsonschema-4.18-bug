FROM python:3.11-slim-bullseye

ARG jsonschema_version

RUN pip install jsonschema==${jsonschema_version}

COPY core-meta.schema.json /schema/
COPY a.schema.json /schema/

WORKDIR /src
COPY validate.py .

CMD [ "python", "-m", "validate" ]
