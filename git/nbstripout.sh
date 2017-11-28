#! /bin/bash

sudo pip install nbconvert
sudo pip install --upgrade nbstripout

NBSTRIPOUT=$(which nbstripout)

git config --global filter.nbstripout.clean "${NBSTRIPOUT}"
git config --global filter.nbstripout.smudge cat
git config --global filter.nbstripout.required true

git config --global diff.ipynb.textconv "${NBSTRIPOUT} -t"

echo "*.ipynb filter=nbstripout" > $HOME/.gitattributes
echo "*.ipynb diff=ipynb" >> $HOME/.gitattributes

git config --global core.attributesfile $HOME/.gitattributes
