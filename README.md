# Regex toolbox

## 🎯 Description

The goal of this image is to provide a local instance of [RegExr](https://regexr.com/).

## 📦 Build

Use the following set of command to build the docker image of the toolbox:

```bash
git clone https://github.com/righettod/toolbox-regex.git
cd toolbox-regex
docker build . -t righettod/toolbox-regex
```

💡 The image is build every week and pushed to the GitHub image repository. You can retrieve it with the following command:

`docker pull ghcr.io/righettod/toolbox-regex:main`

## 🤝 Sources & credits

* [RegExr author](https://github.com/gskinner/regexr).
