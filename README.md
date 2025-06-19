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
