## Q1: Normalisation
Consider a relation with the schema R(A, B, C, D) and the set F of functional dependencies:
```
F = {
	AB -> C,
	C -> D,
	D -> A
}
```
### a. Find all the candidate keys of R.
(AB)+ = ABCD

The candidate key is AB.

### b. Indicate all BCNF violations for R and decompose the relations into collections of relations that are in BCNF. 
To be in BCNF, the left side of all FDs in R have to contain a key.
```
(AB)+ -> ABC
(C)+ -> CD
(D)+ -> AD
```

None of the FDs in R contain either B or AB. We can decompose R into BCNF relations with lossless join. 
```
S1(A, B, C) //Attributes in AB -> C
	- Only FD is AB -> C
	- AB is key for S1
	- Only FD has key on left side so S1 is in BCNF
S2(A, B, D) //All left side attributes + missing attributes
	- FDs: AB -> C, C -> D
	- Key: AB
	- Key isn't in all FDs so S2 not in BCNF
	- Decompose further
		S3(C, D) //C -> D
		- Only FD is C -> D
		- C is key for FD
		- Only FD has key on left side so S3 is in BCNF
		S4(C, A, B) //All left side attributes + missing attributes
		- Only FD is AB -> C
		- AB is key for FD
		- Only FD has key on left side so S4 is in BCNF
```

Final schema contains 2 relations:
```
S1(A, B, C)
S3(C, D)
```

### c. Indicate which dependencies, if any, are not preserved by the BCNF decomposition. 
The decomposition is not lossless because there is no common attribute in S1 and S3. We lose the following depencendy: D -> A.

## Q2. Functional dependencies
### a. Identify the four FDs described.
The schema R(NIN, contractNo, housePerWeek, eName, hotelNo, hotelLocation) with F, the set of FDs, such as:
```
F {
	NINcontractNo -> housePerWeek,
	NIN -> eName,
	hotelNo -> hotelLocation,
	contractNo -> hotelNo	
}
```

### b. List all candidate keys.
```
(NINcontractNo)+ -> NIN, contractNo, housePerWeek, eName, hotelNo, hotelLocation
(NIN)+ -> NIN, eName, contractNo, housePerWeek
(hotelNo)+ -> hotelNo, hotelLocation
(contractNo)+ -> hotelNo, hotelLocation
```

The candidate key is NINcontractNo.

### c. Normalize the relation to the third Normal Form and show the resulting relations.
There must be no transitive dependency such that if there exists 2 FDs A -> B and B -> C, the FD A -> C doesn't exist. 
```
NINcontractNo -> housePerWeek, NIN, contractNo
NIN -> eName
contractNo -> hotelNo
```

Thus, eName and hotelNo are transitively dependant on NINcontractNo. This violates the 3NF. To convert it in 3NF, we can decompose the relation R(NIN, contractNo, housePerWeek, eName, hotelNo, hotelLocation) as:
```
Staff(NIN, contractNo, housePerWeek, hotelLocation)
Signed(NIN_ID, eName, contractNo, hotelNo)
```

## Q3. Pure languages
Consider the following relational schemas:
```
Sailors(sid, sname, rating, age)
Reserves(sid, bid, day)
Boat(bid, bname, bcolor)
```
### a. (RA) List the colors of boats reserved by Albert. 
π bcolor [(σ sname = 'Albert' (Sailors)) ⋈ Reserves ⋈ Boat]

### b. (RA) List the id's of all sailors who have a rating of at least 8 or reserved boat 103.
π sid (σ rating >= 8 (Sailors)) ∪ π sid [σ bid = 103 (Reserves)]

### c. (TRC) List the names and ages of all sailors who have a rating lower than 3.
{X | S ∈ Sailors ∧ S.rating < 3 ∧ X.name = S.name ∧ X.age = S.age }

### d. (DRC) List the id's of all boats that were reserved on 2019-04-28.
{<B> | <S, B, D> ∈ Reserves ∧ D = '2019-04-28'}

### e. (DRC) List the colors of all boats reserved by Lubber.
{<C> | <I, N, C> ∈ Boats ∧ <S, I, D> ∈ Reserves ∧ <S, 'Lubber', R, A> ∈ Sailors}

## Q4. RAID
1 -> B
I can use a RAID level 0 technique because I'm not concerned with losing data. My main goal is to be able to read and write at high speed.

2 -> C
I can use a RAID level 1 technique because I only have two disks available which represent more than the double of the capacity that I need for my application and I'm concerned with being able to recover data if necessary.

3 -> E
I can use a RAID level 5 technique because fault tolerance is important for my application but I don't have much space available to spare. 

4 -> A
I can use a RAID level 6 technique because fault tolerance is important for my application and I need to protect my data even if two disks fail at the same time.

5 -> C
I prefer to use a parity-based approach instead of a mirrored approach because I have 6 disks available but I need the capacity of 5 of them which means that I can only spare the space corresponding to a single disk to ensure redundancy.

## Q5. B+ -tree
### a. Show the B+ -tree that results after inserting (in the given order) 56, 50, 75, 87, 48.
```
				[65]
			[24|50]	[75|88]
[2|10] [24|45|48] [50|56] [65|72] [88|93]
```

### b. Using the B+ -tree previously obtained in a, show the B+ -tree that results after deleting (in the given order) 50, 24, 65, 93, 75. 
```
		[48|72]
[2|10|45] [48|56] [72|87|88]
```

## Q6. Index Bitmap
### a. Construct a bitmap index for the attributes Brand and Color for this table.
Brand
|Opel|Peugeot|BMW|
|---|---|---|
|1|0|0|
|1|0|0|
|0|1|0|
|0|0|1|

Color
|Grey|Red|Black|
|---|---|---|
|1|0|0|
|0|1|0|
|0|0|1|
|0|0|1|

### b. Show how bitmap indices can be used to answer the queries:
i. Show the Brand of all cars that are not black.
We analyse the bitmap for Black: [0 0 1 1]. We take the tuples in the relation where the entries are 1. Thus, the 3rd and 4th tuples are taken. The final result is the corresponding tuples. 

ii. Give the total number of red Opel cars with a medium risk score.
We analyse the result of (bitmap for Opel) AND (bitmap for Red): [0 1 0 0]. We take the tuples in the relation where the entries are 1. We then check the tuples where Risk=medium. The tuples that satisfy this condition are counted. Thus, only the 2nd tuples is counted. The final result is 1. 

## Q7. Hashing
Consider the following hash function:
```
h(x) = x mod 4
```
### a. Use this function to build the hash index of the following search key values: 2, 4, 6, 12, 13, 16, 20, 24, 28, 40.
|000|001|010|011|100|101|110|111|
|---|---|---|---|---|---|---|---|
|4, 12, 16, 20 (overflow)|13|2, 6|/|/|/|/|/|

### b. Given the search key values, is this function a good hash function? Explain your answer.
No. There are too many search key values that have to go in the 000 bucket, despite having previously split the 0 and 00 buckets and rehashed their contents for the remaining values. It'd be better to use search key values that aren't multiples of 4. 
