insert into changereason values (1,'세대분리');
insert into changereason values (2,'전입');
insert into changereason values (3,'출생등록');
insert into changereason values (4,'전입');

insert into birthreporteligibility values (1, '부');
insert into birthreporteligibility values (2, '모');
insert into birthreporteligibility values (3, '호주');
insert into birthreporteligibility values (4, '동거친족');
insert into birthreporteligibility values (5, '기타');


insert into deathreporteligibility values (1, '동거친족');
insert into deathreporteligibility values (2, '비동거친족');
insert into deathreporteligibility values (3, '동거자');
insert into deathreporteligibility values (4, '기타');


INSERT INTO DeathPlace values ( 1, '주택' );
INSERT INTO DeathPlace values ( 2, '의료기관' );
INSERT INTO DeathPlace values ( 3, '사회복지시설 (양로원, 고아원 등)' );
INSERT INTO DeathPlace values ( 4, '산업장' );
INSERT INTO DeathPlace values ( 5, '공공시설 (학교, 운동장 등)' );
INSERT INTO DeathPlace values ( 6, '상업/서비스시설(상점, 호텔 등)' );
INSERT INTO DeathPlace values ( 7, '농장(논밭, 축사, 양식장 등)' );
INSERT INTO DeathPlace values ( 8, '병원 이송 중 사망' );
INSERT INTO DeathPlace values ( 9, '기타' );

INSERT INTO householderrelation VALUES (1, '본인');
INSERT INTO householderrelation VALUES (2, '배우자');
INSERT INTO householderrelation VALUES (3, '자녀');
INSERT INTO householderrelation VALUES (4, '동거인');


INSERT INTO BirthPlace values (1, '자택');
INSERT INTO BirthPlace values (2, '병원');
INSERT INTO BirthPlace values (3, '기타');

INSERT INTO Person VALUES (1, '790510', '*******', '남기준', '남', null, null);
INSERT INTO Person VALUES (2, '540514', '*******', '남석환', '남', null, null);
INSERT INTO Person VALUES (3, '551022', '*******', '박한나', '여', null, null);
insert into person values (4, '820821', '*******', '이주은', '여', null, null);
INSERT INTO Person VALUES (5, '120315', '*******', '남기석', '남', null, null);
INSERT INTO Person VALUES (6, '851205', '*******', '이선미', '여', null, null);
INSERT INTO Person VALUES (7, '130914', '*******', '남길동', '남', null, null);

INSERT INTO address VALUES(1, '경기도 성남시 분당구 대왕판교로 645번길','2013-03-05',1);
INSERT INTO address VALUES(2, '경기도 성남시 분당구 불정로 90번길','2009-10-31' ,1);
INSERT INTO address VALUES(3, '서울시 동작구 상도로 940번길','2007-10-31',1);

alter table address add constraint address_fk foreign key(residented_id) references person(id);

INSERT INTO BirthReport VALUES (1, '2013-03-15 14:59:00', '경기도 성남시 분당구 대왕판교로645번길', 'nam@nhnad.co.kr', '010-1234-5678', 2, 1, 1,'2013-03-17');
insert into BirthReport values(2, '1979-05-10 14:33:33','경기도 성남시 분당구 대왕판교로645번길','nh@nhnab.co.kr','010-2828-2929',2,2,1,'1979-05-10');

INSERT INTO PersonRelationshipType (id, relation) VALUES
(1, '부'),     
(2, '모'),    
(3, '자녀'),     
(4, '배우자'),  
(5, '본인');

INSERT INTO PersonRelationShip (id, person_id_1, person_id_2, person_relationship_type_id) VALUES
                                                                                               (1, 1, 2, 3),
                                                                                               (2, 2, 1, 1),
                                                                                               (3, 1, 3, 3),
                                                                                               (4, 3, 1, 2),
                                                                                               (5, 1, 4, 4),
                                                                                               (6, 4, 1, 4),
                                                                                               (7, 1, 5, 1),
                                                                                               (8, 5, 1, 3),
                                                                                               (9, 2, 3, 4),
                                                                                               (10, 3, 2, 4),
                                                                                               (11, 4, 5, 2),
                                                                                               (12, 5, 4, 3);


insert into residence values (1, 1, '2009-10-02', 1,1, 1 );
insert into residence values (2, 4, '2010-02-15', 2,2, 1 );
insert into residence values (3, 5, '2012-03-17', 3,3, 1 );
insert into residence values (5, 1,'2009-10-31', 1,1, 2);
insert into residence values (4, 6, '2015-11-29', 4,2, 1 );
insert into residence values (6, 1,'2007-10-31', 1,1, 3);


#남기준 출생신고서 값 바꿈
UPDATE person SET birth_report = 1 WHERE id = 5;

##남길동 사망신고
INSERT INTO DeathReport VALUES (1, '2021-04-29 09:03:00', '강원도 고성군 금강산로 290번길', null, '010-2345-6789', 1, 2, 2, '2021-05-02');
UPDATE person SET death_report = 1 WHERE id = 7;


insert into certificatetype values (1, '가족관계증명서');
insert into certificatetype values (2, '주민등록등본');


INSERT INTO CertificateIssuance VALUES('1234567891011121','2021-10-25',1,1);
INSERT INTO CertificateIssuance VALUES('9876543210987654', '2021-10-25', 1, 2);





------------------------------------------- 출력 sql



##가족관계증명서 발급번호
SELECT code, certificate_date
FROM CertificateIssuance
WHERE certificater_id = 1 and certificate_type_id = 1;

##등록기준지
select br.fam_origin
from person p join birthreport br on p.id = br.id
where br.id = 2;

##가족관계증명서
SELECT P2.name, PRT.relation, p2.jumin_first, p2.jumin_last, p2.gender
FROM Person P
         join PersonRelationship PR on P.id = PR.person_id_2
         JOIN PersonRelationshipType PRT on PRT.id = PR.person_relationship_type_id
         JOIN Person P2 on P2.id = PR.person_id_1
WHERE p.id = 1
UNION
SELECT name, relation, jumin_first, jumin_last, gender
FROM Person JOIN PersonRelationshipType
WHERE Person.id = 1 AND PersonRelationshipType.id = 5;




##주민등록등본 발급일
SELECT certificate_date, code
FROM CertificateIssuance
WHERE certificater_id = 1 and certificate_type_id = 2;

#주민등록등본 본인 주소내역
select a.address, a.address_date
from person p join address a on p.id = a.residented_id
where p.id = 1;

##같은 세대에 사는 사람들
select hr.relation, p.name, p.jumin_first, p.jumin_last, r.register_date, cr.reason
from person p join residence r on p.id = r.persion_id
              join householderrelation hr on r.householder_relation_id = hr.id
              join address a on r.address_id = a.id
              join changereason cr on r.change_reason_id = cr.id
where a.address = (
    select a.address
    from person p join residence r on p.id = r.persion_id
                  join householderrelation hr on r.householder_relation_id = hr.id
                  join address a on r.address_id = a.id
    where p.id = 1
    order by a.address asc
    limit 1
);





##출생신고서
#신고일
select report_date
from birthreport
where reporter_id = 1;

#출생자
select p.name, p.gender, b.birth_date, bp.place, b.fam_origin
from person p join birthreport b on p.birth_report = b.id
              join birthplace bp on b.birth_place_id = bp.id
where p.name = '남기석';

#부모
SELECT
    prt.relation,
    p.name,
    p.jumin_first,
    p.jumin_last
FROM person p
         JOIN personrelationship pr ON p.id = pr.person_id_1
         JOIN personrelationshiptype prt ON prt.id = pr.person_relationship_type_id
WHERE pr.person_id_2 = 5;



#신고인
select p.name, p.jumin_first, p.jumin_last, be.eligibility, br.reporter_email, br.reporter_phonenum
from person p join birthreport br on p.id = br.id
              join birthreporteligibility be on br.report_eligibility_id = be.id
where p.id in (
    select br.reporter_id
    from person p join birthreport br on p.birth_report = br.reporter_id
);





##사망신고서
##사망자
select report_date ,p.name, p.jumin_first, p.jumin_last, dr.death_date, dp.place, dr.death_place_addr
from person p join deathreport dr on p.death_report = dr.id
              join deathplace dp on dr.death_place_id = dp.id;

#신고인
select p.name, p.jumin_first, p.jumin_last, de.eligibility, dr.reporter_email, dr.reporter_phonenum
from person p join deathreport dr on p.id = dr.reporter_id
              join deathreporteligibility de on dr.report_eligibility_id = de.id
where p.id in (
    select dr.reporter_id
    from person p join deathreport dr on p.id = dr.reporter_id
);




SELECT register_date, CR.reason
FROM (SELECT address_id FROM Person p
     JOIN Residence R on p.id = R.persion_id WHERE  P.id = 4) as PR
    JOIN Residence R On PR.address_id = R.address_id
    JOIN HouseholderRelation HR on HR.id = R.householder_relation_id
    JOIN ChangeReason CR on CR.id = R.change_reason_id
WHERE relation = '본인';

