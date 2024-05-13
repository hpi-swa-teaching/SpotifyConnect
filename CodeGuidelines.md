# SPOC Code Guidelines
- Leerzeile nach Methodenname
- Kaskaden nutzen, wenn möglich
- Punkt am Ende einer Methode weglassen (dort nicht mehr nötig), ebenso innerhalb Klammern
- bei return: `^ var` (statt `^var`)
- ```
  (condition) 
  	ifTrue: [method1. 
  		 method2]
  ```
- bei Koordinaten `x @ y` (statt `x@y`)
- Leerzeichen um Rechenoperationen, z. B. `a + b` (statt `a+b`)
- Syntax bei Methodenvariablen `| var |` (statt `|var|`)
- Methodenvariablen vermeiden, wenn unnötig
- Einordnung in Kategorien nach Squeak-Standards, ansonsten eindeutige Benennung neuer Kategorien
- alles auf die Klassenseite schieben, was möglich/sinnvoll ist
