## Laboratoire 4
Soumission au laboratoire 4.

### Exercice 1
Les professeurs peuvent enseigner le même cours sur plusieurs semestres et seule la plus récente doit être enregistrée.
```sh
professors(ssn INT NOT NULL, PRIMARY KEY (ssn))
courses(courseid INT NOT NULL, PRIMARY KEY (courseid))
```
### Exercice 2
Chaque professeur doit enseigner un cours.
```sh
professors(ssn INT NOT NULL, PRIMARY KEY (ssn))
courses(courseid INT NOT NULL, PRIMARY KEY (courseid))
teaches(semesterid INT NOT NULL, ssn INT NOT NULL, courseid INT NOT NULL, PRIMARY KEY (ssn, courseid), FOREIGN KEY ssn REFERENCES professors, FOREIGN KEY courseid REFERENCES courseid)
```

### Exercice 3
Chaque professeur enseigne exactement un cours (ni plus, ni moins).
```sh
professors(ssn INT NOT NULL, PRIMARY KEY (ssn))
courses(courseid INT NOT NULL, PRIMARY KEY (courseid), )
teaches(semesterid INT NOT NULL, ssn INT NOT NULL, courseid INT NOT NULL, PRIMARY KEY (ssn, courseid), FOREIGN KEY ssn REFERENCES professors, FOREIGN KEY courseid REFERENCES courseid)
```

### Exercice 4
Chaque professeur enseigne exactement un cours (ni plus, ni moins), et chaque cours doit être enseigné par un professeur.

### Exercice 5
Les professeurs peuvent enseigner le même cours sur plusieurs semestres et chaque doit être enregistrée.

### Exercice 6
Supposons maintenant que certains cours puissent être enseignés conjointement par une équipe de professeurs, mais il est possible qu'aucun professeur dans une équipe ne puisse enseigner le cours. Modélisez cette situation en introduisant des ensembles d'entités et des ensembles de relations supplémentaires si nécessaire.



## Information
* Nom: Sophie Vu
* Courriel: svu043@uottawa.ca
* ID: 300113938

