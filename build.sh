#!/bin/bash

# Build the package
makepkg -f
# Clean up the building files
sudo rm -rf apagnan-calamares-settings pkg src
# Remove the previous versions of the package
rm "../apagnan-core-repo/x86_64/$(ls ../apagnan-core-repo/x86_64/ | grep apagnan-calamares-settings)"
# Move the builded package to the package repository
mv $(ls | grep .pkg) ../apagnan-core-repo/x86_64

# Go to the package repository
cd ../apagnan-core-repo/x86_64
# Regenerate the package database
touch apagnan-core-repo.db.tar.gz
repo-add -n apagnan-core-repo.db.tar.gz *.pkg.tar.zst
# Remove the generated symlinks and the old files
rm apagnan-core-repo.db apagnan-core-repo.files *.old
# Remove the tar.gz extention to the database archives
mv apagnan-core-repo.db.tar.gz apagnan-core-repo.db
mv apagnan-core-repo.files.tar.gz apagnan-core-repo.files

# Push everything to github
git add . && git commit -m "$*"
git pull --rebase # Little pull that never hurt anyone
git push

