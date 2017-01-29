An exercise in lambda calculus and Erlang, inspired by [Lambda Calculus video by Computerphile](https://youtu.be/eis11j_iGMs).

## Test

Easiest way is using [Docker](https://www.docker.com/):

```sh
docker run \
  -it \
  --rm \
  --volume "$PWD":/app \
  --workdir /app \
  erlang escript boolean.erl
```

Expect `ok` to be printed in the terminal.
