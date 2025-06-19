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


