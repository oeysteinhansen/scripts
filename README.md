# scripts
General public scripts

Start by executing the scripts:

Create development environment.
```
wget -O - https://raw.githubusercontent.com/oeysteinhansen/scripts/main/dev.sh | sudo bash
```

Download first, edit, then execute.
```
wget -O - https://raw.githubusercontent.com/oeysteinhansen/scripts/main/dev.sh
nano dev.sh
sudo bash dev.sh
```
Note Workaround for pipenv on Ubuntu 2204.
Set the environment variable. 
```
export SETUPTOOLS_USE_DISTUTILS=stdlib
``` 
when running pipenv.
