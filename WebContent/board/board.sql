
/* Drop Tables */

DROP TABLE tb_board CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE seq_board;




/* Create Sequences */

CREATE SEQUENCE seq_board;



/* Create Tables */

CREATE TABLE tb_board
(
	no number NOT NULL,
	name varchar2(20) NOT NULL,
	title varchar2(100) NOT NULL,
	content varchar2(4000) NOT NULL,
	pwd varchar2(128) NOT NULL,
	regdate date DEFAULT sysdate NOT NULL,
	viewcount number DEFAULT 0 NOT NULL,
	PRIMARY KEY (no)
);

 	select * from tb_board;
 	
 	select no, name, title, regdate, viewcount
 	from tb_board
 	order by no desc;
 	
 	select no, name, title, content, regdate, viewcount
 	from tb_board
 	where name = 샘;
 	
 	
 	select name, title, content, regdate, viewcount
 	from tb_board
 	where no = 
 	
 	
 	
 	
 	
 	
select B.*
from(select rownum AS rnum, A.*
from(select  no , title, name, regdate, viewcount
from tb_board
order by no desc) A)B
where rnum between 11 and 20;
 	
 	
select count(*) from tb_board;
 	
 	
 	
 	
 	
 	



