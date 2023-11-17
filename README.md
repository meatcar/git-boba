# git-boba

*The best (git) clone, more skilled than all the rest.*

## Features

- [ ] Clone repos into a configurable project directory, i.e. `{project_dir}/{host}/{user}/{repo}`
- [ ] Accept any HTTP(S) or SSH repo URL, extract `host`, `user`, and `repo`. 
- [ ] Use a preferred git scheme, configurable per host, i.e. SSH when given a HTTPS URL.
- [ ] Support host, user remapping, i.e. `github.com => hub`, `gitlab.com => lab`.
    This makes shortened paths in shells like `fish` still be useful, for example:
    - No host remapping: 
        ```
        projects/github.com/user/repo => p/g/u/repo
        projects/gitlab.com/user/repo => p/g/u/repo
        ```
    - With host remapping: 
        ```
        projects/hub/user/repo => p/h/u/repo
        projects/lab/user/repo => p/l/u/repo
        ```
- [ ] Optionally `cd` into the repo after clone.
- [ ] Optionally run commands in the repo after clone, i.e. `tmux`, `nix develop`, `mr register`

## Inspiration

These projects do something similar, but they're not good enough for me.

| Project | Compliments | Criticism |
| ------- | ----------- | --------- |
| [git-get](https://github.com/grdl/git-get) | git-config support | Not flexible enough |
| [myrepos](https://myrepos.branchable.com/) | very flexible | Can't clone unknown repos | 
| [ghq](https://github.com/x-motemen/ghq) | supports host dir map, cd via `--look`, ssh via `-p` | [can't map ssh hosts](https://github.com/x-motemen/ghq/issues/307), no commands after cd |
