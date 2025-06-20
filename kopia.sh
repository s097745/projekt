#!/bin/bash

cd kopie

for plik in *.zip
do

# Wyciągniamy rok z nazwy 
rok=$(echo $plik | cut -d'-' -f1)

#Wyciagamy miesiac z nazy
miesiac=$(echo $plik | cut -d'-' -f2)

# utworzenie folderow
mkdir -p ../kopie1/$rok/$miesiac

#skopiowanie do odpowiedniego folderu

cp $plik ../kopie1/$rok/$miesiac
done
