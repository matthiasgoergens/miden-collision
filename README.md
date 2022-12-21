# Nonsense proof

This repository demonstrates a potential problem with [Polygon Miden](https://github.com/0xPolygonMiden/miden-vm).  See there for more context.

## Details

When you execute the following Miden Assembly program, you end up with a stack of all 0s:

```
begin
  if.true
    push.1
  end
end
```

However this repository has a proof to show that the execution ends with a 1 on the stack.

To try it out, make sure you have Docker installed, and run `bash build-docker.bash`.
