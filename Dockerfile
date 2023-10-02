ARG LLAMACPP_IMAGE="full"
FROM "ghcr.io/ggerganov/llama.cpp:${LLAMACPP_IMAGE}"
WORKDIR /app
COPY requirements.txt ./
RUN pip install --upgrade pip && pip install -r requirements.txt
COPY . .
ARG MODEL_URL="None"
ARG QUANT_TYPE="Q4_K_M"
RUN python3 GetModel.py --model_url ${MODEL_URL} --quant_type ${QUANT_TYPE}
EXPOSE 8091
ENTRYPOINT ["/app/entrypoint.sh"]
