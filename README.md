# Bitcoin Transcripts Website

A static [Hugo](https://gohugo.io/) site for hosting [btctranscripts.com](https://btctranscripts.com).

This repository is not the home of the transcripts themselves, which are pulled in as a git submodule. If wishing to add or modify a transcript, your contributions are welcome at [bitcointranscripts](https://github.com/bitcointranscripts/bitcointranscripts).

## Installation and building locally

To build locally, you first need to install Hugo, take a look at the [Hugo install instructions](https://gohugo.io/getting-started/installing/).

- Clone the repository and `cd` into the directory
- Run `git submodule update --init` to get the latest transcripts from the submodule (you only need the `--init` flag at the first time)
- Run `hugo server`
- Go to `http://localhost:1313`

### Preview your transcript

Having a local build allows you to see how your transcript will be displayed in the website. You can do that by using the branch containing your transcript as the content submodule.

Make sure that your transcript is at `<transcript-branch>` at `<your-repository-fork>` of the [bitcointranscripts repository](https://github.com/bitcointranscripts/bitcointranscripts) and run: 

- `git submodule set-url content <your-repository-fork>` to change the submodule url
- `git submodule set-branch --branch <transcript-branch> content` to change the submodule branch (default is master)
- `git submodule update --remote` to fetch the updated submodule content
- `hugo server` to build the website with the updated content

To reset back to using the original submodule, run:

- `git restore .gitmodules`
- `git submodule update`

## i18n

All i18n snippets can be found in the `/i18n` folder. Pre-configured languages are currently Spanish and Portuguese. If you'd like to propose a new language, you can do so by modifying the [site config](https://github.com/bitcointranscripts/bitcointranscripts.github.io/blob/master/config.toml) and translating the appropraite [i18n file](https://github.com/bitcointranscripts/bitcointranscripts.github.io/blob/master/i18n).

We'd love transcripts in other languages so we've made every effort to make i18n as easy as possible.

## Attributions

This project was based on [diyhpluswiki](https://github.com/kanzure/diyhpluswiki) and would not be possible without the many years of work by [kanzure](https://github.com/kanzure).

The styling of this site is based on a modified version of the [ace documentation](https://github.com/vantagedesign/ace-documentation) theme.
