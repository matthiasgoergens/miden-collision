FROM rust:1.65
WORKDIR /app
COPY . .
RUN bash miden-collision.bash
CMD bash miden-collision.bash
