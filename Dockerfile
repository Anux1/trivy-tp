FROM ubuntu:22.04

# Mise à jour + upgrade + installation minimale
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends curl && \
    rm -rf /var/lib/apt/lists/*

# Créer un utilisateur non-root
RUN useradd -m appuser

# Passer en utilisateur non-root
USER appuser

# Healthcheck simple
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
    CMD curl -f https://example.com || exit 1

CMD ["/bin/bash"]

