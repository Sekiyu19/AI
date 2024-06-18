# EX_06

## Task
Submit the answer of the exercise within one week.

Before starting, read the source codes carefully, and try to
understand.  Do not forget (MUST!) to write a report in the
file summary_XX.txt. You may use English or Japanese.

Many comments are included in the `func.c` program.

## Summary of today's exercise
The purpose is to implement frame based on Section 4.2.2 in p. 81 of
the textbook.

フレームを実装せよ。  
教科書p.81 4.2.2を参照せよ。  
ハンドアウトp.18を参照せよ。  

### `summary_06.txt`
Create the input data by yourself and append the input data into
`data_06.txt`.  The expected outputs for the input must be appended to
`answer_06.txt`.  And compare the actual outputs with the expected ones
after executing this program.  Then, write the following things into
the discussion part of `summary_06.txt`.

- What you have done.
- The results of `average`, `rank`, etc.
- The changes of `rank` of the students.


## data_06.txt
### Data format フォーマット
```
Meanings of symbols:
[S]: The number of students.
[C]: The number of courses.
[N]: Student name.
[G]: Student gender.
[P]: Score (point) of each course.
[O]: Any command (a string).
EOF: End of file.

Input set:
[S] [C]
[N_0] [G_0] [P_0_0] ... [P_0_C]
     .......
[N_S] [G_S] [P_S_0] ... [P_S_C]
[O_0]
 ...
 ...
 ...
EOF

Command format:
[C]: command signature.
[T]: target
[A]: argument of command.

[C] [T] [A_1] ... [A_N]

Available commands in this program:
ask [target] [slot name].
conf [target] [slot name] [value].
```


## `prog_06.c`
### main()
1. Substitue data into the frame. データフレームにデータを代入する。
2. Read the commands, and conduct inference. 各命令を読み込み、推論の実行をする。

## `func.h`
```c
struct student_info_frame {
    ScoreBoard score_board;             //!< This contains all score information of students in this frame.
    Student students[MAX_STUDENT_NUM];  //!< Student struct array.
    size_t student_num;                 //!< The number of students.
};
typedef struct student_info_frame StudentInfoFrame;
```


## `func.c`
### execute_command()
Execute a specified command. 指定されたコマンドを実行する関数。

### Command 
```c
enum command {
    COMMAND_ASK,
    COMMAND_CONF,
    COMMAND_UNKNOWN
};
typedef enum command Command;
```


### load_word()

```
Example:
input                            
command_str: "ask Yamada gender" 
cammand_name: not initialized              
->                              
output                           
command_str: "Yamada gender"     
command_name: "ask"              
```

### identify_command()
To interpret the meaning of the command from the input string.  
文字列からconfかaskかそれ以外か(unkonwn)を判定する。

### find_student()
- param: ``` StudentInfoFrame const* s_frame, char const* name```
- return: ```Student```

Main of this exercise:  
Find a student from the frame based on his/her name.  
今回の問題。フレームの中から、引数である学生のnameにマッチしたStudentを返す。  

 - TODO 1: Complete the "for statement" to iterate the loop for all students.

 - TODO 2: Fill in the second argument for "strcmp".
   This is used to find a student based on his/her name.

 - TODO 3: Put the found student to the target.  
   You may also see execute_command() to understand the meaning.

### command_ask()
ask command that returns an answer based on the question and the frame.  
質問とフレームをもとに、スロットの内容と比較し解答を返す。

### command_conf()
confirm command that return yes or no.

## Other files
- object.h / object.c
- human.h / human.c
- student.h /student.c
- score_board.h /score_bord.c

### frame

| Object    |      |
|-----------|------|
| attribute | name |


| Human     |        |
|-----------|--------|
| is-a      | Object |
| attribute | gender |
| attribute | job    |


| Student   |                             |
|-----------|-----------------------------|
| is-a      | Human                       |
| procedure | get_rank(score_bord)        |
| procedure | get_score(score_bord)       |
| procedure | get_scholarship(score_bord) |


| Scorebord |                                   |
|-----------|-----------------------------------|
| is-a      | object                            |
| attribute | cource_num                        |
| attribute | student_num                       |
| attribute | student_names                     |
| attribute | scores                            |
| attribute | ranks                             |
| procedure | get_student_average(student_name) |
| procedure | get_student_rank(stduent_name)    |


| Badboy    |                             |
|-----------|-----------------------------|
| is-a      | Student                     |
| name      | Badboy                      |
| gender    | MALE                        |
| job       | student                     |
| procedure | get_rank(score_bord)        |
| procedure | get_score(score_bord)       |
| procedure | get_scholarship(score_bord) |




