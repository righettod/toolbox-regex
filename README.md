# 💻 Regex toolbox

![Build and deploy the toolbox image](https://github.com/righettod/toolbox-regex/actions/workflows/build_docker_image.yml/badge.svg?branch=main) ![MadeWithDocker](https://img.shields.io/static/v1?label=Made%20with&message=Docker&color=blue&?style=for-the-badge&logo=docker) ![AutomatedWith](https://img.shields.io/static/v1?label=Automated%20with&message=GitHub%20Actions&color=blue&?style=for-the-badge&logo=github)


## 🎯 Description

> [!NOTE]
> I created this repository because [my PR](https://github.com/gskinner/regexr/pull/445) was never taken in account.

The goal of this image is to provide a local instance of [RegExr](https://regexr.com/) to create regex against sensitive/private content.

## 📦 Build

Use the following set of command to build the docker image of the toolbox:

```bash
git clone https://github.com/righettod/toolbox-regex.git
cd toolbox-regex
docker build . -t righettod/toolbox-regex
```

💡 The image is build every week and pushed to the GitHub image repository. You can retrieve it with the following command:

`docker pull ghcr.io/righettod/toolbox-regex:main`

## 👨‍💻 Usage

You can use the following PowerShell code snippet:

```powershell
$toolUrl = "http://localhost:3000"
docker run -d -p 3000:3000 ghcr.io/righettod/toolbox-regex:main
$status = 0
while ($status -ne 200) {
	Write-Host "[+] Wait 15 seconds that the container starts..." -ForegroundColor Yellow
	Start-Sleep 15
	$status = (Invoke-WebRequest -Uri $toolUrl -UseBasicParsing).StatusCode
}
Write-Host "[i] URL to use is $toolUrl" -ForegroundColor Cyan
Firefox.exe $toolUrl
```

## 🤝 Sources & credits

* [RegExr author](https://github.com/gskinner/regexr).
