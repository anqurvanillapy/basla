# Basla

A Scheme implementation of simply typed lambda calculus.

## Requirements

- `rlwrap` for better REPL history
- `mit-scheme`, indeed

## Example

```bash
# Start the REPL.
$ ./basla
;; Definition of `true' type.
basla> (($ a . a) true)
=> ($ x . ($ y . x))
;; Examine variables.
basla> ((true ($ a . a)) ($ b . b))
=> ($ a . a)
```

## License

MIT
