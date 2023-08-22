SQL (Structured Query Language)

왜 데이터가 초기화 ?
- Ram은 빠르지만 장기적으로 데이터를 유지할 수 없다. (주기억장치라 빠르다) 
- HDD/ SSD는 느리지만 장기적으로 데이터를 유지할 수 있다. (보조기억장치)

 기본 코드 작성 -> HDD ,  앱을 실행하면 RAM -> 앱을 끄고 다시 시작
 HDD에 있던 저장 정보를 RAM 에 보조기억장치에다가 데이터를 구조화하여 저장할 수 있게 해주는게 SQL

* 중요 요소 
Table : 정보를 담는 구조 (정보 담는 단위)
Table 안에는 Column(각 속성) / Row (각 값) 존재

* 기본 문법 
1. Select : 데이터 선택하기 
기본 : SELECT {column} FROM {table}
Ex) SELECT id, name, gender FROM players

2. Update : 데이터 업데이트하기  
기본 : UPDATE {table} SET {column} WHERE {condition}
 ex) UPDATE players SET gender = ‘F’ WHERE name = ‘곽윤기’ 

3.  Delete : 데이터 삭제하기
 기본: DELETE FROM {table} WHERE {condition}
 ex) DELETE FROM players WHERE gender = ‘F’ 

4.  Insert : 새로운 데이터 추가하기  기본: INSERT INTO {table} {column1, column2 …} VALUEW {value1, value2…} ex) INSERT INTO players (id, name, gender) VALUES (11, ‘진선유’, ‘F’) 
종목을 추가하고 싶다면? 
종목별 정보도 추가 하고 싶다면? 

테이블간 연동 ====> Normalization (중복을 없애는 작업)

 5. Join : 여러 테이블 합치기   
기본 : SELECT {column} FROM {table} INNER JOIN {other_table} ON {condition}


