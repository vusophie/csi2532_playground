## Laboratoire 4
Soumission au laboratoire 4.

### Exercice 1
Les professeurs peuvent enseigner le même cours sur plusieurs semestres et seule la plus récente doit être enregistrée.
#### Schéma
```sh
professors(ssn INT NOT NULL, PRIMARY KEY (ssn), semesterid INT NOT NULL)
courses(courseid INT NOT NULL, PRIMARY KEY (courseid))
```
#### Diagramme de relation
[![Diagramme_relation_1](https://github.com/vusophie/csi2532_playground/blob/lab04/Diagramme_relation_1.png)](https://github.com/vusophie/csi2532_playground/tree/lab04)

### Exercice 2
Chaque professeur doit enseigner un cours.
#### Schéma
```sh
professors(ssn INT NOT NULL, PRIMARY KEY (ssn))
courses(courseid INT NOT NULL, PRIMARY KEY (courseid))
teaches(semesterid INT NOT NULL, ssn INT NOT NULL, courseid INT NOT NULL, PRIMARY KEY (ssn, courseid), FOREIGN KEY ssn REFERENCES professors, FOREIGN KEY courseid REFERENCES courses)
```
#### Diagramme de relation
[![Diagramme_relation_2](https://github.com/vusophie/csi2532_playground/blob/lab04/Diagramme_relation_2.png)](https://github.com/vusophie/csi2532_playground/tree/lab04)

### Exercice 3
Chaque professeur enseigne exactement un cours (ni plus, ni moins).
#### Schéma
```sh
professors(ssn INT NOT NULL, courseid INT NOT NULL, PRIMARY KEY (ssn), FOREIGN KEY courseid REFERENCES courses (courseid))
courses(courseid INT NOT NULL, PRIMARY KEY (courseid))
teaches(semesterid INT NOT NULL, ssn INT NOT NULL, courseid INT NOT NULL, PRIMARY KEY (ssn, courseid), FOREIGN KEY ssn REFERENCES professors, FOREIGN KEY courseid REFERENCES courseid)
```
#### Diagramme de relation
[![Diagramme_relation_3](https://github.com/vusophie/csi2532_playground/blob/lab04/Diagramme_relation_3.png)](https://github.com/vusophie/csi2532_playground/tree/lab04)

### Exercice 4
Chaque professeur enseigne exactement un cours (ni plus, ni moins), et chaque cours doit être enseigné par un professeur.
#### Schéma
```sh
professors(ssn INT NOT NULL, courseid INT NOT NULL, PRIMARY KEY (ssn), FOREIGN KEY courseid REFERENCES courses (courseid))
courses(courseid INT NOT NULL, ssn INT NOT NULL, PRIMARY KEY (courseid), FOREIGN KEY ssn REFERENCES professors (ssn))
teaches(semesterid INT NOT NULL, ssn INT NOT NULL, courseid INT NOT NULL, PRIMARY KEY (ssn, courseid), FOREIGN KEY ssn REFERENCES professors, FOREIGN KEY courseid REFERENCES courseid)
```
#### Diagramme de relation
[![Diagramme_relation_4](https://github.com/vusophie/csi2532_playground/blob/lab04/Diagramme_relation_4.png)](https://github.com/vusophie/csi2532_playground/tree/lab04)

### Exercice 5
Les professeurs peuvent enseigner le même cours sur plusieurs semestres et chaque doit être enregistrée.
#### Schéma
```sh
professors(ssn INT NOT NULL, PRIMARY KEY (ssn))
courses(courseid INT NOT NULL, PRIMARY KEY (courseid))
teaches(semesterid INT NOT NULL, ssn INT NOT NULL, courseid INT NOT NULL, PRIMARY KEY (semesterid), FOREIGN KEY ssn REFERENCES professors (smesterid), FOREIGN KEY courseid REFERENCES courses (courseid))
```
#### Diagramme de relation
[![Diagramme_relation_5](https://github.com/vusophie/csi2532_playground/blob/lab04/Diagramme_relation_5.png)](https://github.com/vusophie/csi2532_playground/tree/lab04)

### Exercice 6
Supposons maintenant que certains cours puissent être enseignés conjointement par une équipe de professeurs, mais il est possible qu'aucun professeur dans une équipe ne puisse enseigner le cours. Modélisez cette situation en introduisant des ensembles d'entités et des ensembles de relations supplémentaires si nécessaire.
#### Schéma
```sh
professors(ssn INT NOT NULL, PRIMARY KEY (ssn))
courses(courseid INT NOT NULL, PRIMARY KEY (courseid))
groups(groupid INT NOT NULL, PRIMARY KEY (groupid))
teaches(semesterid INT NOT NULL, ssn INT NOT NULL, courseid INT NOT NULL, PRIMARY KEY (ssn, courseid), FOREIGN KEY ssn REFERENCES professors (smesterid), FOREIGN KEY courseid REFERENCES courses (courseid))
member_of(groupid INT NOT NULL, ssn INT NOT NULL, PRIMARY KEY(groupid, ssn), FOREIGN KEY groupid REFERENCES groups, FOREIGN KEY ssn REFERENCES professors)
```
#### Diagramme de relation
[![Diagramme_relation_6](https://github.com/vusophie/csi2532_playground/blob/lab04/Diagramme_relation_6.png)](https://github.com/vusophie/csi2532_playground/tree/lab04)

## Information
* Nom: Sophie Vu
* Courriel: svu043@uottawa.ca
* ID: 300113938

