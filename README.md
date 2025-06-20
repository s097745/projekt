### Zadanie 3 - niesforne dane

```bash
# Rozpakowanie katalogu .zip
unzip dane.zip

# konwersja końca linii
dos2unix dane.txt
 
# Tworzenie pliku z nagłówkiem i podziałem na kolumny
echo -e "x\ty\tz" > dane3kol.txt && paste - - - < dane.txt >> dane3kol.txt 

# Powrotna kowersja końca linii
unix2dos 3kolumny.txt
```

### Zadanie 4 - dodawanie poprawek
```bash
# Rozpakowanie katalogu 
unzip lista.zip
 
# Konwersja końca lini
dos2unix lista.txt lista-pop.txt

# Stworzenie łatki do uaktalniena oryginalej listy
diff -u lista.txt lista-pop.txt > latka.patch

# Zastosowanie łatki do oryginalnej listy
patch lista.txt < latka.txt

# Sprawdzenie sumy kontrolnej
md5sum lista.txt
md5sum lista-pop.txt 
```

### Zadanie 5 - Z csv to sql i z powrotem
```bash
# Rozpakowanie katologu
unzip csv.zip

# Z csv do sql
awk -F";" 'NR==1 {h=$1", "$2", "$3} NR>1 {printf("INSERT INTO stepsData (%s) VALUES (%s, %s, %s);\n", h, $1, $2, $3)}' steps-2sql.csv > csv2sql.sql

# Z sql do csv
(echo "dateTime;steps;synced"; sed -r 's/^INSERT .* VALUES \(//;s/\);$//;s/, /;/g' test.sql | sed -r 's/^([0-9]{10})[0-9]{3}/\1/') > sql2csv.csv
```

### Zadanie 6
```bash
# Skopiowanie lini i zakomentowanie pierwszej z nich
sed -r 's/( ".*\,)/\/\/ \1\n \1/' en-7.2.json5 > pl-7.2.json5
```

### Zadanie 7 - Fotograf gamoń
```bash
# Rozpakowanie danych
# Rozpakowanane pliki będą znajdować sie w katalogu kopie

unzip kopie-1.zip -d kopie
unzip kopie-2.zip -d kopie

cd kopie

# Rozpakowanie wszystkich zdjęć do katalogu razpakowane (jeśli nie istnieje to zostanie utworzony) 
unzip '*.zip' -d ../rozpakowane 

cd ..

# Zmiana formatu z .png to .jpg
magick mogrify -format jpg rozpakowane/*.png

# Zmna rozdzielczośći i ustawienie wysokości
# UWAGA - pliki zostaną nadpisane
magick mogrify -resize x720 -density 96x96 rozpakowane/*.jpg 

# Utworzenie archiwum
zip archiwum2 rozpakowane/*.jpg
```

### Zadanie 8 - Wszędzie te PDF-y
```bash
# Wybranie 8 losowych zdjęc do portfolio
cd rozpakowane
ls | shuf | head -8 > ../portfolio

#Przygotowanie strony
magick montage -label %f portfolio/*.jpg -tile 2x4 -geometry 1235x870+5+5 -pointsize 20 portfolio.jpg

# Sformatowanie do a4
magick portfolio.jpg -density 300 -resize 2480x3508 -gravity center -extent 2480x3508 portfolio_a4.pdf
```

### Zadanie 9 - Porządki w kopiach zapasowych
```bash
# Uruchomić skrypt kopie.sh
./kopie.sh
```

### Zadanie 9 - galeria dla grafika
```bash
# uruchomienie skrypt
./galeria.sh

# wstawienie zdjęć do podanego szablonu
sed '/<!-- kolejne pliki galerii ... -->/r div.txt' galeria.html
```
