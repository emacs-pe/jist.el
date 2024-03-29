<a href="https://github.com/emacs-pe/jist.el"><img src="https://www.gnu.org/software/emacs/images/emacs.png" alt="Emacs Logo" width="80" height="80" align="right"></a>
## jist.el
*Gist integration*

---
[![License GPLv3](https://img.shields.io/badge/license-GPL_v3-green.svg)](http://www.gnu.org/licenses/gpl-3.0.html)
[![Build Status](https://travis-ci.org/emacs-pe/jist.el.svg?branch=master)](https://travis-ci.org/emacs-pe/jist.el)
[![MELPA](http://melpa.org/packages/jist-badge.svg)](http://melpa.org/#/jist)

Yet another [Gist][] client for Emacs.

### Features:

+ Allows to create gists.
+ Allows to delete/clone/star/unstar a gist.
+ List your owned/starred gists.
+ List public gists.
+ List public gists from another github user.

### Configuration:

To create anonymous gists is not necessary any configuration, but if you want
to create gists with your github account you need to obtain a `oauth-token`
with gist scope in https://github.com/settings/applications, and set it
through any of the following methods:

+ Add `(setq jist-github-token "TOKEN")` to your `init.el`.
+ Add `oauth-token` to your `~/.gitconfig`: `git config --global github.oauth-token MYTOKEN`

### Usage:

> **Warning**: By default, the functions `jist-region` and `jist-buffer`
> create **anonymous** gists.  To create gists with you configured account
> use `jist-auth-region` and `jist-auth-buffer`.

+ Create a gist from an active region:

                            | public | anonymous
  ------------------------- | ------ | ---------
  `jist-auth-region`        |        |
  `jist-auth-region-public` | x      |
  `jist-region`             |        | x
  `jist-region-public`      | x      | x

+ Create a gist of the contents of the current buffer:

                            | public | anonymous
  ------------------------- | ------ | ---------
  `jist-auth-buffer`        |        |
  `jist-auth-buffer-public` | x      |
  `jist-buffer`             |        | x
  `jist-buffer-public`      | x      | x

You can set the variable `jist-enable-default-authorized` to non nil to
always use your configured account when creating gists.

#### Tips:

+ In the current gist API the values of `gist_pull_url` and `git_push_url`
  use the HTTP protocol, but it's inconvenient to use the HTTP for pushes.
  To use the SSH protocol for pushes in cloned gists you need to add the
  following to your git-config(1):

        [url "git@gist.github.com:/"]
            pushInsteadOf = "https://gist.github.com/"

#### Related Projects:

+ [gist.el](https://github.com/defunkt/gist.el)
+ [yagist.el](https://github.com/mhayashi1120/yagist.el)

### TODO:

+ [ ] List Gist forks.
+ [ ] Allow gist edition with `org-mode`.
+ [ ] Handle nicely 422 errors.  See: https://developer.github.com/v3/#client-errors
+ [ ] Add pagination support with rfc5988 link headers.  See:
  - [Github api pagination](https://developer.github.com/v3/#pagination)
  - [Traversing with Pagination](https://developer.github.com/guides/traversing-with-pagination/).
  - [rfc5988](https://www.rfc-editor.org/rfc/rfc5988.txt)

[Gist]: https://gist.github.com/



### Customization Documentation

#### `jist-github-token`

Oauth bearer token to interact with the Github API.

#### `jist-gist-directory`

Directory where to the gists will be cloned.

#### `jist-enable-default-authorized`

Enable gists creation with associated account.

#### `jist-anonymous-name`

Enable gists creation without using the buffer name.

#### `jist-default-per-page`

Default `per_page` argument used in list requests.

#### `jist-disable-asking`

Disable asking before destructive operations.

#### `jist-use-descriptions`

Whether to use gist descriptions for completions.

### Function and Macro Documentation

#### `(jist-json-read &optional CODING-SYSTEM)`

Call `json-read` with CODING-SYSTEM.

#### `(jist-json-encode OBJECT &optional CODING-SYSTEM)`

Return a JSON representation of OBJECT as a string with CODING-SYSTEM.

#### `(jist-dired-auth ARG)`

Create a authenticated gist from marked files(s) in dired.
With prefix ARG create a gist from file at point.

#### `(jist-dired-auth-public ARG)`

Create a public gist from marked files(s) in dired.
With prefix ARG create a gist from file at point.

#### `(jist-auth-region)`

Create an authorized gist from an active region.

#### `(jist-region-public)`

Create a public gist from an active region.

#### `(jist-auth-region-public)`

Create a public and authorized gist from an active region.

#### `(jist-buffer)`

Create a gist from the contents of the current buffer.

#### `(jist-auth-buffer)`

Create an authorized gist from the contents of the current buffer.

#### `(jist-buffer-public)`

Create a public gist from the contents of the current buffer.

#### `(jist-auth-buffer-public)`

Create an authorized and public gist from the contents of the current buffer.

#### `(jist-delete-gist ID)`

Delete gist identified by ID.

#### `(jist-print-gist ID)`

Show a gist identified by ID and put into `kill-ring`.

#### `(jist-browse-gist ID)`

Show a gist identified by ID in a browser using `browse-url`.

#### `(jist-star-gist ID)`

Star a gist identified by ID.

#### `(jist-fork-gist ID)`

Fork a gist identified by ID.

#### `(jist-unstar-gist ID)`

Unstar a gist identified by ID.

#### `(jist-clone-gist ID)`

Clone gist identified by ID.

#### `(jist-edit-description ID)`

Set description to a gist identified by ID.

#### `(jist-refetch-gists)`

Refetch the gists of a jist-list-mode buffer.

#### `(jist-fetch-next-page)`

Fetch the next page of the gists of a jist-list-mode buffer.

#### `(jist-list-user USER)`

Show a list of gist of a github USER.

#### `(jist-list-public)`

Show a list of public gists.

#### `(jist-list-starred)`

Show a list of starred gists of the configured user.

-----
<div style="padding-top:15px;color: #d0d0d0;">
Markdown README file generated by
<a href="https://github.com/mgalgs/make-readme-markdown">make-readme-markdown.el</a>
</div>
