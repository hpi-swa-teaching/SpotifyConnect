# Code Guidelines
- Leerzeile nach Methodenname
- Kaskaden nutzen, wenn möglich
- Punkt am Ende einer Methode weglassen, ebenso innerhalb Klammern
- bei return: `^ var` (statt `^var`) und Leerzeile davor
- Leerzeichen um Rechenoperationen, z. B. `a + b` (statt `a+b`)
- Syntax bei Methodenvariablen `| var |` (statt `|var|`)
- Methodenvariablen vermeiden, wenn unnötig
- Leerzeile nach `super initialize`
- Einordnung in Kategorien nach Squeak-Standards, ansonsten eindeutige Benennung neuer Kategorien
- alles auf die Klassenseite schieben, was möglich/sinnvoll ist (vor allem Konstanten)

## Beispielmethoden
```
initialize

  super initialize.

  self initializeInstanceVariables;
      initializeObjects
```
```
newCoordinateWithSumOf: aNumber and: anotherNumber

  | sum |
  sum := aNumber + anotherNumber.
  sum > 0
    ifTrue: [^ sum @ 0]
    ifFalse: [^ 0 @ sum]
```
