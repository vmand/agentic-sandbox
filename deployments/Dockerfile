FROM node:25

RUN npm install -g @anthropic-ai/claude-code@latest
RUN npm install -g @openai/codex@latest
RUN npm install -g @google/gemini-cli@latest
RUN ARCH=$(uname -m); \
    if [ "$ARCH" = "x86_64" ]; then \
        OP_ARCH="x64"; \
    elif [ "$ARCH" = "aarch64" ] || [ "$ARCH" = "arm64" ]; then \
        OP_ARCH="arm64"; \
    else \
        echo "Unsupported architecture: $ARCH" && exit 1; \
    fi; \
    curl -L "https://github.com/anomalyco/opencode/releases/latest/download/opencode-linux-${OP_ARCH}.tar.gz" -o /tmp/opencode.tar.gz && \
    tar -xzf /tmp/opencode.tar.gz -C /usr/local/bin && \
    rm /tmp/opencode.tar.gz

WORKDIR /home/node
