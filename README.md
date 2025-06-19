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

# Zadanie 5 - Z csv to sql i z powrotem
```bash
# Rozpakowanie katologu
unzip csv.zip

# Z csv do sql
awk -F";" 'NR==1 {h=$1", "$2", "$3} NR>1 {printf("INSERT INTO stepsData (%s) VALUES (%s, %s, %s);\n", h, $1, $2, $3)}' steps-2sql.csv > csv2sql.sql

# Z sql do csv
(echo "dateTime;steps;synced"; sed -r 's/^INSERT .* VALUES \(//;s/\);$//;s/, /;/g' test.sql | sed -r 's/^([0-9]{10})[0-9]{3}/\1/') > sql2csv.csv
```
