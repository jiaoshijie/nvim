```
 _   _       _              ____             __ _
| \ | |_   _(_)_ __ ___    / ___|___  _ __  / _(_) __ _
|  \| \ \ / / | '_ ` _ \  | |   / _ \| '_ \| |_| |/ _` |
| |\  |\ V /| | | | | | | | |__| (_) | | | |  _| | (_| |
|_| \_| \_/ |_|_| |_| |_|  \____\___/|_| |_|_| |_|\__, |
                                                  |___/
```

- nvim configuration(as small as possiable).

## Requirements

- nvim lately(~~nightly~~) version
- `:checkhealth` for more infomation.

## Hints

- using `column` to align text
  * markdown table: `!column -t -s "|" -o "|"` or `!column -t -s \| -o \|`
- vim search/replace
  * using tools(rg, grep) search text, and moving the result to quickfix, then do `cdo` for line and `cfdo` for file.
  * `args */**.lua` `argdo`
  * `bufdo`

## Ref

- [align-text-on-an-equals-sign-in-vim](https://stackoverflow.com/questions/8964953/align-text-on-an-equals-sign-in-vim)
- [Dockerfile reference](https://docs.docker.com/engine/reference/builder/)
- [dokcerfile best practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
