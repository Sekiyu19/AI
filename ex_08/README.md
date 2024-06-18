# EX_08

## Task
Submit the answer of the exercise within one week. 

Before starting, read the source codes carefully, and try to
understand.  Do not forget (MUST!) to write a report in the
file summary_XX.txt. You may use English or Japanese.

## Summary of this homework 今回の問題の概要
1) Try the program in the slides and prove p(a,b).
2) Try the test example in the slides and see answers for several requests.   

1) ハンドアウト中のプログラムを作りp(a, b)が真であることを示せ。
2) ハンドアウト中のテストプログラムを使って、リクエストしてみてください。

## swipl (swi-prolog)
For a quick start, see the online document at the following URL:

http://www.swi-prolog.org/pldoc/man?section=quickstart


## About notations in prolog

### Facts 事実

| Statement                    | Prolog               |
|------------------------------|----------------------|
| sofu is the parent of otasan | parent(sofu, otosan) |
| otosan is the parent of taro | parent(otosan, taro) |


In Prolog, individuals, functions, and relations are named using lower case characters.

1. Individual constants: chieko, parent, makoto
2. Logic formula: 
    - Example: ```parent(otosan, taro).```
    - parent: Relation between two individuals
    - otosan, taro: Individuals
    - A period ’.’ is neede to terminate a formula. 


### Request 質問
Load a program containing facts, axioms and theorems, and then you can ask questions.

```prolog
$ [test].  % Read the program
| ?- parent(otosan, taro). % otosan is the parent of taro?
yes
| ?- parent(otosan, jim). % otasan is the parent of jim?
no
| ?- grandparent(otosan, taro).
! Existence error in user:grandparent/2         % undefined relation 
! procedure user:grandparent/2 does not exist
! goal:  user:grandparent(otosan,taro)
| ?- 
```
Prolog returns "yes" if the question is confirmed, "no" otherwise.

```prolog
| ?- parent(otosan, X).
X = taro ? y
yes
```


### AND and OR

AND is denoted by a comma ','
```prolog
| ?- parent(X,taro), parent(X,miho).
X = otosan ? y
yes
| ?-　parent(taro, X), parent(X, otosan).
no 
```
OR is denoted by a semi-column ';'
```prolog
| ?- parent(taro, X); parent(X, otosan).  
X = sofu ? y   % True if one of the two is true
yes
```

