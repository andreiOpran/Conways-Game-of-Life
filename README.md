# Conway’s Game of Life


Conway’s Game of Life este un zero-player game bidimensional, inventat de matematicianul John
Horton Conway in anul 1970. Scopul acestui joc este de a observa evolutia unui sistem de celule,
pornind de la o configuratie initiala, introducand reguli referitoare la moartea, respectiv crearea unei
noi celule in sistem. Acest sistem evolutiv este Turing-complete.

Starea unui sistem este descrisa de starea cumulata a celulelor componente, iar pentru acestea
avem urmatoarele reguli:

1. Subpopulare
   
Fiecare celula (care este in viata in generatia curenta) cu mai putin de doi vecini in viata, moare in generatia urmatoare.

2. Continuitate celule vii
   
Fiecare celula (care este in viata in generatia curenta), cu doi sau trei vecini in viata, va exista si in generatia urmatoare.

3. Ultrapopulare
   
Fiecare celula (care este in viata in generatia curenta), care are mai mult de trei vecini in viata, moare in generatia urmatoare.

4. Creare
   
O celula moarta care are exact trei vecini in viata, va fi creata in generatia urmatoare.

5. Continuitate celule moarte
   
Orice alta celula moarta, care nu se incadreaza in regula de creare, ramane o celula moarta.

Vecinii unei celule se considera urmatorii 8, intr-o matrice bidimensionala:

```
00          01          02
10    celula curenta    12
20          21          22
```

Definim starea unui sistem la generatianca fiind o matrice Sn ∈ M m×n({0,1}) ( m - numarul de linii, respectiv n - numarul de coloane), unde elementul 0 reprezinta o celula moarta, respectiv 1 reprezinta o celula in viata (in generatia curenta). Definim ok-evolutie (k≥0) a sistemului o iteratieS 0 → S1 → ··· → Sk, unde fiecare S(i+1) se obtine din Si, aplicand cele cinci reguli enuntate mai sus. 

Observatie.
Pentru celulele aflate pe prima linie, prima coloana, ultima linie, respectiv ultima coloana, se considera extinderea la 8 vecini, prin considerarea celor care nu se afla in matrice ca fiind celule moarte. 

Exemplificare.
Fie urmatoarea configuratie initiala S0:

```
0 1 1 0
1 0 0 0
0 0 1 1
```

In primul rand, vom considera extinderea acestei matrice S0 de dimensiuni 3×4 intr-o matrice extinsa S0 de dimensiuni 5×6 , astfel:

```
0 0 0 0 0 0
0 0 1 1 0 0
0 1 0 0 0 0
0 0 0 1 1 0
0 0 0 0 0 0
```

In cele ce urmeaza, vom lucra doar in interiorul matricei principale, dar considerand extinderea pentru procesarea corecta a vecinilor. Vom parcurge fiecare element, si vom vedea ce regula evolutiva putem aplica. De exemplu, pentru elementul de pe pozitia (0,0) in matricea initiala, vom aplica regula de continuitate a celulelor moarte, deoarece este o celula moarta si nu are exact trei vecini in viata. 

Urmatoarea celula este in viata, si are exact doi vecini in viata, astfel ca se aplica regula continuitatii celulelor in viata. 

Pentru celula de pe pozitia (0,2) in S0, observam ca are un singur vecin, astfel ca se aplica regula de subpopulare - celula va muri in generatia urmatoare. 

Urmand acelasi rationament pentru toate celulele, configuratia sistemului intr-o iteratie (in S1) va fi:

```
0 0 0 0 0 0
0 0 1 0 0 0
0 0 0 0 1 0
0 0 0 0 0 0
0 0 0 0 0 0
```
