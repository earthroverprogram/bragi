# LaTeX Writing Repo

LaTeX writing repo with Jupyter notebooks.

For use in a Codespace or devcontainer.


# Instructions

## Download Docker Desktop:

https://www.docker.com/products/docker-desktop/

## Clone the repo

Navigate the folder you want to clone to. For example:

```
cd git-ERP
```

Then clone:

```
git clone git@github.com:earthroverprogram/bragi.git
```

## Build image from the Dockerfile

The Dockerfile is located in .devcontainer (this is hidden from the terminal but is viewable in VScode):

```
docker build -t bragi-image ./.devcontainer
```

This will then build the image (this may take a while... so put the kettle on!)

Once the build is complete, an image will appear in the Images tab of Docker Desktop.


## Install Dev Containers extension for VScode

In Visual Studio Code:

Go to Extensions (Cmd+Shift+X)
Install:
Dev Containers


## Restart VScode

Once VS Code sees .devcontainer, you should get a popup:

“Reopen in Container”

Click it ✅

If you DON’T see the popup:

Press:

```
Cmd + Shift + P
```

Then type:

```
Dev Containers: Reopen in Container
```

You should then see a pop up that says:

 "Reading Dev Container Config"

This may take some time... put the kettle on again! You can monitor the progress of the build by clicking:

 "show log".

VS Code will then:

 - Build the Docker image (using your .devcontainer/Dockerfile)
 - Start a container
 - Mount your repo automatically
 - Open a terminal inside the container




# Usage

What you should write in:

## ✅ Primary writing file:
content/md/dummy_report.md

That’s your main document. Instructions on writing are listed here. 

## 🧾 Supporting files

### Bibliography:

content/tex/dummy.bib

### Figures:

content/tex/figures/

### LaTeX template/output:

content/tex/dummy_report.tex


## Generate the PDF

Inside your dev container terminal:
```
pandoc content/md/dummy_report.md -o report.pdf
```

Then check:
```
ls
```

You should see:
```
report.pdf
```