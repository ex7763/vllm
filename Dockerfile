FROM nvcr.io/nvidia/pytorch:22.12-py3
MAINTAINER hpc

# RUN pip uninstall -y torch

# WORKDIR /workspace

# RUN git clone https://github.com/vllm-project/vllm
# WORKDIR /workspace/vllm
# RUN pip install -e .
# RUN pip install --force-reinstall typing-extensions==4.5.0
# RUN pip install tiktoken "fschat==0.2.23"

RUN pip3 install vllm
RUN pip3 uninstall -y torch
RUN pip3 install pandas ray fschat
RUN pip3 install fschat==0.2.23
RUN pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
RUN pip3 install --force-reinstall typing-extensions==4.5.0
RUN pip3 uninstall -y transformer-engine


# CMD ["python", "-m", "vllm.entrypoints.openai.api_server", \
#                "--model", "Qwen/Qwen-7B-Chat", \
#                "--download-dir", "/model", \
#                "--host", "0.0.0.0", \
#                "--port", "8425", \
#                "--trust-remote-code"]

               # "--api-keys", "", \

CMD ["python", "-m", "vllm.entrypoints.openai.api_server", \
               "--model", "lmsys/vicuna-7b-v1.5", \
               "--download-dir", "/model", \
               "--gpu-memory-utilization", "0.5", \
               "--host", "0.0.0.0", \
               "--port", "8425", \
               "--trust-remote-code"]

