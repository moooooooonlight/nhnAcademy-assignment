-- DDL

CREATE TABLE CustomerGrade (
   id INT AUTO_INCREMENT,
   grade_name VARCHAR(50) NOT NULL,
   grade_benefit VARCHAR(100),
   PRIMARY KEY (id)
);
CREATE TABLE RefundFare (
   id INT AUTO_INCREMENT,
   fare_id INT NOT NULL,
   PRIMARY KEY (id)
);
CREATE TABLE CorpCustEmployee (
   employee_id INT NOT NULL,
   corporate_customer_id INT NOT NULL,
   position VARCHAR(50),
   PRIMARY KEY (employee_id)
);
CREATE TABLE Airline (
   id INT AUTO_INCREMENT,
   name VARCHAR(100),
   PRIMARY KEY (id)
);
CREATE TABLE BundledProduct (
   product_id INT NOT NULL,
   bundle_id INT NOT NULL,
   discount_rate DECIMAL(5,2),
   PRIMARY KEY (product_id, bundle_id),
   UNIQUE (bundle_id)
);
CREATE TABLE BundledProductDetail (
   id INT AUTO_INCREMENT,
   bundle_id INT NOT NULL,
   product_id INT NOT NULL,
   PRIMARY KEY (id)
);
CREATE TABLE Airport (
   id INT AUTO_INCREMENT,
   code CHAR(4),
   name VARCHAR(100),
   PRIMARY KEY (id)
);
CREATE TABLE SSR (
   id INT AUTO_INCREMENT,
   request VARCHAR(100),
   pax_seg_id INT NOT NULL,
   PRIMARY KEY (id)
);
CREATE TABLE ArrivalDeparture (
   id INT AUTO_INCREMENT,
   departure_time DATETIME,
   arrival_time DATETIME,
   duration TIME,
   distance INT,
   mileage INT,
   departure_gate VARCHAR(10),
   arrival_gate VARCHAR(10),
   flight_route_id INT NOT NULL,
   departure_airport_id INT NOT NULL,
   arrival_airport_id INT NOT NULL,
   PRIMARY KEY (id)
);
CREATE TABLE GuestMember (
   customer_id INT NOT NULL,
   social_type_id INT NOT NULL,
   PRIMARY KEY (customer_id)
);
CREATE TABLE Product (
   id INT AUTO_INCREMENT,
   price DECIMAL(10,2) NOT NULL,
   name VARCHAR(100),
   description TEXT,
   created_at DATETIME,
   updated_at DATETIME,
   currency CHAR(3),
   status VARCHAR(20),
   stock INT,
   PRIMARY KEY (id)
);
CREATE TABLE AddiService (
   product_id INT NOT NULL,
   addi_service_id INT NOT NULL,
   description TEXT,
   PRIMARY KEY (product_id, addi_service_id)
);
CREATE TABLE AddiServiceDetails (
   id INT AUTO_INCREMENT,
   product_id INT NOT NULL,
   ticket_id INT NOT NULL,
   PRIMARY KEY (id)
);
CREATE TABLE Payment (
   payment_id INT AUTO_INCREMENT,
   ticket_id INT NOT NULL,
   fare_id INT NOT NULL,
   payment_method_id INT NOT NULL,
   payer_id INT NOT NULL,
   amount DECIMAL(10,2),
   payment_datetime DATETIME,
   PRIMARY KEY (payment_id)
);
CREATE TABLE Tax (
   id INT AUTO_INCREMENT,
   amount DECIMAL(10,2),
   payment_id INT NOT NULL,
   tax_type_id INT NOT NULL,
   PRIMARY KEY (id)
);
CREATE TABLE Crew (
   id INT AUTO_INCREMENT,
   name VARCHAR(50),
   gender CHAR(1),
   contact VARCHAR(20),
   crew_position_id INT NOT NULL,
   PRIMARY KEY (id)
);
CREATE TABLE CrewPosition (
   id INT AUTO_INCREMENT,
   position_name VARCHAR(50),
   PRIMARY KEY (id)
);
CREATE TABLE PAX (
   id INT AUTO_INCREMENT,
   name VARCHAR(50),
   age TINYINT,
   contact VARCHAR(20),
   passport VARCHAR(20),
   email VARCHAR(100),
   gender CHAR(1),
   birth_date DATE,
   PRIMARY KEY (id)
);
CREATE TABLE PNR (
   id INT AUTO_INCREMENT,
   reservation_code VARCHAR(10),
   reservation_datetime DATETIME,
   status VARCHAR(20),
   product_id INT NOT NULL,
   booker_id INT NOT NULL,
   PRIMARY KEY (id)
);
CREATE TABLE Ticket (
   id INT AUTO_INCREMENT,
   pax_id INT NOT NULL,
   ticket_number VARCHAR(20),
   issued_at DATETIME,
   PRIMARY KEY (id)
);
CREATE TABLE PersonalCustomer (
   customer_id INT NOT NULL,
   mileage INT,
   grade_id INT NOT NULL,
   PRIMARY KEY (customer_id)
);
CREATE TABLE CorpCustomer (
   customer_id INT NOT NULL,
   company_name VARCHAR(100),
   contact_info VARCHAR(20),
   business_license VARCHAR(50),
   discount_rate DECIMAL(5,2),
   PRIMARY KEY (customer_id)
);
CREATE TABLE Customer (
   id INT AUTO_INCREMENT,
   korean_last_name VARCHAR(20),
   korean_first_name VARCHAR(20),
   english_last_name VARCHAR(50),
   english_first_name VARCHAR(50),
   email VARCHAR(100),
   phone VARCHAR(20),
   join_date DATE,
   updated_date DATE,
   payment_method_id INT NOT NULL,
   PRIMARY KEY (id)
);
CREATE TABLE CustomerIdentity (
   id INT AUTO_INCREMENT,
   jumin CHAR(13),
   passport VARCHAR(20),
   customer_id INT NOT NULL,
   PRIMARY KEY (id)
);
CREATE TABLE RegularMember (
   customer_id INT NOT NULL,
   username VARCHAR(50),
   password VARCHAR(100),
   PRIMARY KEY (customer_id)
);
CREATE TABLE Accessory (
   product_id INT NOT NULL,
   accessory_id INT NOT NULL,
   brand VARCHAR(50),
   material VARCHAR(50),
   PRIMARY KEY (product_id, accessory_id)
);
CREATE TABLE SEG (
   id INT AUTO_INCREMENT,
   departure_airport_id INT,
   arrival_airport_id INT,
   departure_time DATETIME,
   arrival_time DATETIME,
   seat_class_id INT NOT NULL,
   PRIMARY KEY (id)
);
CREATE TABLE SeatClass (
   id INT AUTO_INCREMENT,
   class_name VARCHAR(50),
   PRIMARY KEY (id)
);
CREATE TABLE PAXSEG (
   pax_seg_id INT AUTO_INCREMENT,
   reservation_id INT NOT NULL,
   pax_id INT NOT NULL,
   segment_id INT NOT NULL,
   PRIMARY KEY (pax_seg_id)
);
CREATE TABLE Fare (
   id INT AUTO_INCREMENT,
   price DECIMAL(10,2),
   pax_seg_id INT NOT NULL,
   PRIMARY KEY (id)
);
CREATE TABLE Coupon (
   id INT AUTO_INCREMENT,
   ticket_id INT NOT NULL,
   seg_id INT NOT NULL,
   discount_type VARCHAR(50),
   discount_rate DECIMAL(5,2),
   payment_id INT,
   PRIMARY KEY (id)
);
CREATE TABLE FlightPlan (
   id INT AUTO_INCREMENT,
   available_date DATE,
   season_code VARCHAR(10),
   airline_id INT NOT NULL,
   flight_datetime DATETIME,
   PRIMARY KEY (id)
);
CREATE TABLE FlightRoute (
   id INT AUTO_INCREMENT,
   flight_plan_id INT NOT NULL,
   duration TIME,
   notes VARCHAR(255),
   time_slot VARCHAR(50),
   PRIMARY KEY (id)
);
CREATE TABLE ATCFlightRoute (
   id INT AUTO_INCREMENT,
   atc_id INT NOT NULL,
   flight_route_id INT NOT NULL,
   PRIMARY KEY (id)
);
CREATE TABLE ATCAdvisory (
   id INT AUTO_INCREMENT,
   airport_id INT NOT NULL,
   advisory_code VARCHAR(20),
   message VARCHAR(255),
   advisory_time DATETIME,
   notes VARCHAR(255),
   PRIMARY KEY (id)
);
CREATE TABLE PartneredProducts (
   product_id INT NOT NULL,
   partner_product_id INT NOT NULL,
   details VARCHAR(255),
   PRIMARY KEY (product_id, partner_product_id)
);
CREATE TABLE AirTicket (
   product_id INT NOT NULL,
   air_ticket_id INT NOT NULL,
   flight_plan_id INT NOT NULL,
   seat_class_id INT NOT NULL,
   flight_name VARCHAR(20),
   PRIMARY KEY (product_id, air_ticket_id)
);
CREATE TABLE PreCorpBenefit (
   id INT AUTO_INCREMENT,
   corp_customer_id INT NOT NULL,
   benefit_description VARCHAR(255),
   PRIMARY KEY (id)
);
CREATE TABLE RefundMethod (
   id INT AUTO_INCREMENT,
   method_name VARCHAR(50),
   PRIMARY KEY (id)
);
CREATE TABLE PaymentMethod (
   id INT AUTO_INCREMENT,
   method_name VARCHAR(50),
   PRIMARY KEY (id)
);
CREATE TABLE TaxType (
   id INT AUTO_INCREMENT,
   type_name VARCHAR(50),
   description VARCHAR(255),
   PRIMARY KEY (id)
);
CREATE TABLE SocialType (
   id INT AUTO_INCREMENT,
   name VARCHAR(50),
   PRIMARY KEY (id)
);
CREATE TABLE CrewOrganizationRole (
   id INT AUTO_INCREMENT,
   role_name VARCHAR(50),
   PRIMARY KEY (id)
);
CREATE TABLE CrewOrganization (
   id INT AUTO_INCREMENT,
   crew_id INT NOT NULL,
   flight_plan_id INT NOT NULL,
   role_id INT NOT NULL,
   PRIMARY KEY (id)
);
CREATE TABLE CrewFlightPlan (
   id INT AUTO_INCREMENT,
   flight_plan_id INT NOT NULL,
   duty_date DATE,
   notes VARCHAR(255),
   PRIMARY KEY (id)
);
CREATE TABLE PreferredFlightInfo (
   id INT AUTO_INCREMENT,
   customer_id INT NOT NULL,
   preferred_route VARCHAR(50),
   preferred_meal VARCHAR(50),
   other_preferences VARCHAR(255),
   PRIMARY KEY (id)
);
CREATE TABLE Refund (
   id INT AUTO_INCREMENT,
   payment_id INT NOT NULL,
   refund_method_id INT NOT NULL,
   refund_fare_id INT NOT NULL,
   amount DECIMAL(10,2),
   PRIMARY KEY (id)
);
CREATE TABLE RefundTax (
   id INT AUTO_INCREMENT,
   refund_id INT NOT NULL,
   PRIMARY KEY (id)
);
CREATE TABLE AddiServiceReservationContent (
   id INT AUTO_INCREMENT,
   pax_seg_id INT NOT NULL,
   product_id INT NOT NULL,
   PRIMARY KEY (id)
);

ALTER TABLE RefundFare ADD CONSTRAINT fk_refundfare_fare FOREIGN KEY (fare_id) REFERENCES Fare(id);
ALTER TABLE CorpCustEmployee ADD CONSTRAINT fk_corpcustemployee_customer FOREIGN KEY (employee_id) REFERENCES Customer(id);
ALTER TABLE CorpCustEmployee ADD CONSTRAINT fk_corpcustemployee_corp FOREIGN KEY (corporate_customer_id) REFERENCES CorpCustomer(customer_id);
ALTER TABLE BundledProduct ADD CONSTRAINT fk_bundledproduct_product FOREIGN KEY (product_id) REFERENCES Product(id);
ALTER TABLE BundledProductDetail ADD CONSTRAINT fk_bundledproductdetail_bundle FOREIGN KEY (bundle_id) REFERENCES BundledProduct(bundle_id);
ALTER TABLE BundledProductDetail ADD CONSTRAINT fk_bundledproductdetail_product FOREIGN KEY (product_id) REFERENCES Product(id);
ALTER TABLE SSR ADD CONSTRAINT fk_ssr_paxseg FOREIGN KEY (pax_seg_id) REFERENCES PAXSEG(pax_seg_id);
ALTER TABLE ArrivalDeparture ADD CONSTRAINT fk_arrivaldep_flightroute FOREIGN KEY (flight_route_id) REFERENCES FlightRoute(id);
ALTER TABLE ArrivalDeparture ADD CONSTRAINT fk_arrivaldep_dep_airport FOREIGN KEY (departure_airport_id) REFERENCES Airport(id);
ALTER TABLE ArrivalDeparture ADD CONSTRAINT fk_arrivaldep_arr_airport FOREIGN KEY (arrival_airport_id) REFERENCES Airport(id);
ALTER TABLE GuestMember ADD CONSTRAINT fk_guestmember_customer FOREIGN KEY (customer_id) REFERENCES Customer(id);
ALTER TABLE GuestMember ADD CONSTRAINT fk_guestmember_social FOREIGN KEY (social_type_id) REFERENCES SocialType(id);
ALTER TABLE AddiService ADD CONSTRAINT fk_addiservice_product FOREIGN KEY (product_id) REFERENCES Product(id);
ALTER TABLE AddiServiceDetails ADD CONSTRAINT fk_addiservicedetails_product FOREIGN KEY (product_id) REFERENCES Product(id);
ALTER TABLE AddiServiceDetails ADD CONSTRAINT fk_addiservicedetails_ticket FOREIGN KEY (ticket_id) REFERENCES Ticket(id);
ALTER TABLE Payment ADD CONSTRAINT fk_payment_ticket FOREIGN KEY (ticket_id) REFERENCES Ticket(id);
ALTER TABLE Payment ADD CONSTRAINT fk_payment_fare FOREIGN KEY (fare_id) REFERENCES Fare(id);
ALTER TABLE Payment ADD CONSTRAINT fk_payment_method FOREIGN KEY (payment_method_id) REFERENCES PaymentMethod(id);
ALTER TABLE Payment ADD CONSTRAINT fk_payment_payer FOREIGN KEY (payer_id) REFERENCES Customer(id);
ALTER TABLE Tax ADD CONSTRAINT fk_tax_payment FOREIGN KEY (payment_id) REFERENCES Payment(payment_id);
ALTER TABLE Tax ADD CONSTRAINT fk_tax_type FOREIGN KEY (tax_type_id) REFERENCES TaxType(id);
ALTER TABLE Crew ADD CONSTRAINT fk_crew_position FOREIGN KEY (crew_position_id) REFERENCES CrewPosition(id);
ALTER TABLE PNR ADD CONSTRAINT fk_pnr_product FOREIGN KEY (product_id) REFERENCES Product(id);
ALTER TABLE PNR ADD CONSTRAINT fk_pnr_booker FOREIGN KEY (booker_id) REFERENCES Customer(id);
ALTER TABLE Ticket ADD CONSTRAINT fk_ticket_pax FOREIGN KEY (pax_id) REFERENCES PAX(id);
ALTER TABLE PersonalCustomer ADD CONSTRAINT fk_personalcust_customer FOREIGN KEY (customer_id) REFERENCES Customer(id);
ALTER TABLE PersonalCustomer ADD CONSTRAINT fk_personalcust_grade FOREIGN KEY (grade_id) REFERENCES CustomerGrade(id);
ALTER TABLE CorpCustomer ADD CONSTRAINT fk_corpcust_customer FOREIGN KEY (customer_id) REFERENCES Customer(id);
ALTER TABLE Customer ADD CONSTRAINT fk_customer_paymentmethod FOREIGN KEY (payment_method_id) REFERENCES PaymentMethod(id);
ALTER TABLE CustomerIdentity ADD CONSTRAINT fk_customeridentity_customer FOREIGN KEY (customer_id) REFERENCES Customer(id);
ALTER TABLE RegularMember ADD CONSTRAINT fk_regularmember_customer FOREIGN KEY (customer_id) REFERENCES Customer(id);
ALTER TABLE Accessory ADD CONSTRAINT fk_accessory_product FOREIGN KEY (product_id) REFERENCES Product(id);
ALTER TABLE SEG ADD CONSTRAINT fk_seg_seatclass FOREIGN KEY (seat_class_id) REFERENCES SeatClass(id);
ALTER TABLE SEG ADD CONSTRAINT fk_seg_dep_airport FOREIGN KEY (departure_airport_id) REFERENCES Airport(id);
ALTER TABLE SEG ADD CONSTRAINT fk_seg_arr_airport FOREIGN KEY (arrival_airport_id) REFERENCES Airport(id);
ALTER TABLE PAXSEG ADD CONSTRAINT fk_paxseg_pnr FOREIGN KEY (reservation_id) REFERENCES PNR(id);
ALTER TABLE PAXSEG ADD CONSTRAINT fk_paxseg_pax FOREIGN KEY (pax_id) REFERENCES PAX(id);
ALTER TABLE PAXSEG ADD CONSTRAINT fk_paxseg_seg FOREIGN KEY (segment_id) REFERENCES SEG(id);
ALTER TABLE Coupon ADD CONSTRAINT fk_coupon_ticket FOREIGN KEY (ticket_id) REFERENCES Ticket(id);
ALTER TABLE Coupon ADD CONSTRAINT fk_coupon_seg FOREIGN KEY (seg_id) REFERENCES SEG(id);
ALTER TABLE Coupon ADD CONSTRAINT fk_coupon_payment FOREIGN KEY (payment_id) REFERENCES Payment(payment_id);
ALTER TABLE FlightPlan ADD CONSTRAINT fk_flightplane_airline FOREIGN KEY (airline_id) REFERENCES Airline(id);
ALTER TABLE FlightRoute ADD CONSTRAINT fk_flightroute_flightplan FOREIGN KEY (flight_plan_id) REFERENCES FlightPlan(id);
ALTER TABLE ATCFlightRoute ADD CONSTRAINT fk_atcflightroute_flightroute FOREIGN KEY (flight_route_id) REFERENCES FlightRoute(id);
ALTER TABLE ATCAdvisory ADD CONSTRAINT fk_atcadvisory_airport FOREIGN KEY (airport_id) REFERENCES Airport(id);
ALTER TABLE PartneredProducts ADD CONSTRAINT fk_partneredprod_product FOREIGN KEY (product_id) REFERENCES Product(id);
ALTER TABLE PartneredProducts ADD CONSTRAINT fk_partneredprod_partner FOREIGN KEY (partner_product_id) REFERENCES Product(id);
ALTER TABLE AirTicket ADD CONSTRAINT fk_airticket_product FOREIGN KEY (product_id) REFERENCES Product(id);
ALTER TABLE AirTicket ADD CONSTRAINT fk_airticket_flightplan FOREIGN KEY (flight_plan_id) REFERENCES FlightPlan(id);
ALTER TABLE AirTicket ADD CONSTRAINT fk_airticket_seatclass FOREIGN KEY (seat_class_id) REFERENCES SeatClass(id);
ALTER TABLE PreCorpBenefit ADD CONSTRAINT fk_precorp_corp FOREIGN KEY (corp_customer_id) REFERENCES CorpCustomer(customer_id);
ALTER TABLE CrewOrganization ADD CONSTRAINT fk_creworg_crew FOREIGN KEY (crew_id) REFERENCES Crew(id);
ALTER TABLE CrewOrganization ADD CONSTRAINT fk_creworg_flightplan FOREIGN KEY (flight_plan_id) REFERENCES FlightPlan(id);
ALTER TABLE CrewOrganization ADD CONSTRAINT fk_creworg_role FOREIGN KEY (role_id) REFERENCES CrewOrganizationRole(id);
ALTER TABLE CrewFlightPlan ADD CONSTRAINT fk_crewflightplan_flightplan FOREIGN KEY (flight_plan_id) REFERENCES FlightPlan(id);
ALTER TABLE Refund ADD CONSTRAINT fk_refund_payment FOREIGN KEY (payment_id) REFERENCES Payment(payment_id);
ALTER TABLE Refund ADD CONSTRAINT fk_refund_method FOREIGN KEY (refund_method_id) REFERENCES RefundMethod(id);
ALTER TABLE Refund ADD CONSTRAINT fk_refund_fare FOREIGN KEY (refund_fare_id) REFERENCES RefundFare(id);
ALTER TABLE RefundTax ADD CONSTRAINT fk_refundtax_refund FOREIGN KEY (refund_id) REFERENCES Refund(id);
ALTER TABLE AddiServiceReservationContent ADD CONSTRAINT fk_addirescontent_paxseg FOREIGN KEY (pax_seg_id) REFERENCES PAXSEG(pax_seg_id);
ALTER TABLE AddiServiceReservationContent ADD CONSTRAINT fk_addirescontent_product FOREIGN KEY (product_id) REFERENCES Product(id);
ALTER TABLE Fare ADD CONSTRAINT fk_fare_paxseg FOREIGN KEY (pax_seg_id) REFERENCES PAXSEG(pax_seg_id);
ALTER TABLE PreferredFlightInfo ADD CONSTRAINT fk_prefflight_customer FOREIGN KEY (customer_id) REFERENCES Customer(id);






-- DML

-- 승무원 직급 (id, 직급명)
INSERT INTO CrewPosition VALUES(1, '부기장');
INSERT INTO CrewPosition VALUES(2, '기장');
INSERT INTO CrewPosition VALUES(3, '객실승무원');




-- 승무원편조 역할 (id, 역할)
INSERT INTO CrewOrganizationRole VALUES(1, '조종');
INSERT INTO CrewOrganizationRole VALUES(2, '객실 서비스');
INSERT INTO CrewOrganizationRole VALUES(3, '승객 안전 관리');




-- 항공사 (id, 항공사명)
INSERT INTO Airline VALUES(1,'제주항공');




-- 승무원 (id, 이름, 성별 , 연락처, 승무원 직급)
INSERT INTO Crew VALUES(1, '김철수', '남', '010-1234-5678', 1);
INSERT INTO Crew VALUES(2, '이영희', '여', '010-2345-6789', 2);
INSERT INTO Crew VALUES(3, '박민수', '남', '010-3456-7890', 3);
INSERT INTO Crew VALUES(4, '최지은', '여', '010-4567-8901', 3);




-- 운항계획 (id, 항공편 판매 가능일자, 시즌 구분 코드, 항공사id, 비행일시)
INSERT INTO FlightPlan VALUES(1, '2025-03-15', 'W25', 1, '2025-03-20 08:00:00');
INSERT INTO FlightPlan VALUES(2, '2025-03-16', 'W25', 1, '2025-03-21 14:30:00');
INSERT INTO FlightPlan VALUES(3, '2025-03-17', 'W25', 1, '2025-03-22 20:45:00');
INSERT INTO FlightPlan VALUES(4, '2025-03-17', 'W25', 1, '2025-03-24 20:45:00');
insert into flightplan values(5, '2025-03-09', 'W25',1, '2025-03-24 16:00:00');




-- 승무원 편조 (id, 승무원id, 비행기 계획id, 승무원편조역할id)
INSERT INTO CrewOrganization VALUES(1, 1, 1, 1);
INSERT INTO CrewOrganization VALUES(2, 2, 1, 2);
INSERT INTO CrewOrganization VALUES(3, 3, 1, 3);




-- 공항 (id, 공항코드, 공항이름)
INSERT INTO Airport VALUES(1, 'ICN', '인천국제공항');
INSERT INTO Airport VALUES(2, 'GMP', '김포국제공항');
INSERT INTO Airport VALUES(3, 'CJU', '제주국제공항');
INSERT INTO Airport VALUES(4, 'PUS', '김해국제공항');




-- 운항경로 (id, 운항계획id, 소요시간, 특이사항, 시간대)
INSERT INTO FlightRoute VALUES(1, 1, '02:00:00', '기상 변화 가능성', '오전');
INSERT INTO FlightRoute VALUES(2, 5, '03:00:00', '탑승률 높음', '오후');
INSERT INTO FlightRoute VALUES(3, 3, '06:00:00', '야간 비행', '야간');




-- 출도착 (id, 출발시간, 도착시간, 소요시간, 비행거리, 마일리지, 출발게이트, 도착게이트, 운항경로id, 출발공항id, 도착공항id)
INSERT INTO ArrivalDeparture VALUES(1, '2025-03-20 08:00:00', '2025-03-20 10:00:00', '02:00:00', 200, 500, 'A12', 'B5', 1, 1, 3);
INSERT INTO ArrivalDeparture VALUES(2, '2025-03-21 14:30:00', '2025-03-21 17:00:00', '03:00:00', 3000, 400, 'C7', 'D2', 2, 2, 1);
INSERT INTO ArrivalDeparture VALUES(3, '2025-03-22 20:45:00', '2025-03-22 02:45:00', '06:00:00', 350, 800, 'E3', 'F8', 3, 3, 4);
INSERT INTO ArrivalDeparture VALUES(4, '2025-03-24 16:00:00', '2025-03-24 18:00:00', '02:00:00', 200, 500, 'B5', 'A13', 2, 3, 1);
INSERT INTO ArrivalDeparture VALUES(5, '2025-03-27 15:00:00', '2025-03-27 18:00:00', '03:00:00', 3000, 400, 'D2', 'C7', 2, 1, 2);
INSERT INTO ArrivalDeparture VALUES(6, '2025-03-28 22:30:00', '2025-03-28 04:30:00', '06:00:00', 350, 800, 'E3', 'F8', 3, 4, 3);




-- 결제수단(id, 결제수단명)
insert into paymentmethod values ('1', '일반');
insert into paymentmethod values ('2', '포인트');
insert into paymentmethod values ('3', '기프티켓');




-- 고객
insert into customer values (1,'김', '태희', 'kim', 'taehee', 'taehee@google.com', '010-1234-5678', '2024-03-09', null, 1);




-- 정회원
insert into regularmember values (1, 'taehee', '1234');




-- 고객식별
insert into customeridentity values (1, '8003212345678', 'M123K1234', 1);








-- 좌석등급
insert into seatclass values (1, 'economy');
insert into seatclass values (2, 'business');
insert into seatclass values (3, 'first-class');




-- 상품
insert into product values (1, 100000, '좌석+수하물', '좌석+수하물 세트 선택', '2025-03-09', null, 'won', 'ACTIVE', null);
insert into product values (2, 150000, '사전 수하물', '사전 수하물 추가', '2025-03-09', null, 'won', 'ACTIVE', null);
insert into product values (3, 100000, '사전 좌석', '사전 좌석 선택', '2025-03-09', null, 'won', 'ACTIVE', null);
insert into product values (4, 100000, '사전 기내식 주문', '사전 기내식 주문 가능', '2025-03-09', null, 'won', 'ACTIVE', null);
insert into product values (5, 800000, '항공권', null, '2025-03-01', null, 'won', 'ACTIVE', 10);
insert into product values (6, 1800000, '항공권', null, '2025-03-01', null, 'won', 'ACTIVE', 10);
insert into product values (7, 2500000, '항공권', null, '2025-03-01', null, 'won', 'ACTIVE', 10);
insert into product values (8, 5000000, '항공권', null, '2025-03-01', null, 'won', 'ACTIVE', 10);
insert into product values (9, 700000, '항공권', null, '2025-03-01', null, 'won', 'ACTIVE', 8);




-- 부가서비스
insert into AddiService values (1, 1, '좌석+수하물 세트 선택할 수 있습니다');
insert into AddiService values (2, 2, '사전 수하물을 추가할 수 있습니다');
insert into AddiService values (3, 3, '사전에 좌석을 지정할 수 있습니다.');
insert into AddiService values (4, 4, '사전에 기내식을 주문할 수 있습니다');




-- 항공권
insert into airticket values (5, 1, 1, 1, '7C213');
insert into airticket values (6, 2, 2, 1, '7C239');
insert into airticket values (7, 3, 3, 1, '7C291');
insert into airticket values (8, 4, 4, 1, '7C298');
insert into airticket values (9, 5, 5, 1, '7C298');




update product
set description = '기내수하물 10kg 제공 / 위탁수하물 1개x23kg 제공, 리프레시 포인트 3,455P 적립'
where id = 5 or id = 6 or id = 7 or id = 8 or id = 9;




-- 세금타입
INSERT INTO TaxType (type_name, description) VALUES ('VAT', '부가가치세');
INSERT INTO TaxType (type_name, description) VALUES ('FuelSurcharge', '유류할증료');
INSERT INTO TaxType (type_name, description) VALUES ('AirportTax', '공항세');





-- SQL
-- 항공권 조회
SELECT P.id, P.name, P.price, P.currency, AD.departure_time, AD.arrival_time, AD.duration,
       P.stock, SC.class_name, P.description, A.code as 출발공항, A2.code as 도착공항
FROM Product P
         JOIN AirTicket AT on P.id = AT.product_id
         JOIN SeatClass SC on At.seat_class_id = SC.id
         JOIN FlightPlan FP on AT.flight_plan_id = FP.id
         JOIN FlightRoute FR on AT.flight_plan_id = FR.flight_plan_id
         JOIN ArrivalDeparture AD on FR.id = AD.flight_route_id
         JOIN Airport A on AD.departure_airport_id = A.id
         JOIN Airport A2 on AD.arrival_airport_id = A2.id
WHERE AD.departure_time >= '2025-03-01 00:00:00'
    AND AD.arrival_time <= '2025-03-31 23:59:59'
    AND (departure_airport_id = 1 AND arrival_airport_id = 3) OR (departure_airport_id = 3 AND arrival_airport_id = 1);


start transaction;
INSERT INTO PNR (reservation_code, reservation_datetime, status, product_id, booker_id) VALUES ('J25030901', '2025-03-10 00:06:57', 'BOOKED', 5, 1);
INSERT INTO PNR (reservation_code, reservation_datetime, status, product_id, booker_id) VALUES ('J25030902', '2025-03-10 00:06:57', 'BOOKED', 9, 1);


INSERT INTO PAX (name, age, contact, passport, email, gender, birth_date) VALUES ('김태희', 46, '010-1234-5678', 'M123K1234', 'taehee@google.com', 'F', '1980-03-21');
INSERT INTO PAX (name, age, contact, passport, email, gender, birth_date) VALUES ('정지훈', 44, '010-1234-5679', 'M456K4567', 'rain@google.com', 'M', '1982-06-25');

INSERT INTO SEG (departure_airport_id, arrival_airport_id, departure_time, arrival_time, seat_class_id) VALUES (1, 3, '2025-03-20 08:00:00', '2025-03-20 10:00:00', 1);
INSERT INTO SEG (departure_airport_id, arrival_airport_id, departure_time, arrival_time, seat_class_id) VALUES (1, 3, '2025-03-20 08:00:00', '2025-03-20 10:00:00', 1);
INSERT INTO SEG (departure_airport_id, arrival_airport_id, departure_time, arrival_time, seat_class_id) VALUES (3, 1, '2025-03-24 16:00:00', '2025-03-24 18:00:00', 1);
INSERT INTO SEG (departure_airport_id, arrival_airport_id, departure_time, arrival_time, seat_class_id) VALUES (3, 1, '2025-03-24 16:00:00', '2025-03-24 18:00:00', 1);

INSERT INTO PAXSEG (reservation_id, pax_id, segment_id) VALUES (1, 1, 1);
INSERT INTO PAXSEG (reservation_id, pax_id, segment_id) VALUES (1, 2, 2);
INSERT INTO PAXSEG (reservation_id, pax_id, segment_id) VALUES (2, 1, 3);
INSERT INTO PAXSEG (reservation_id, pax_id, segment_id) VALUES (2, 2, 4);

commit;


start transaction;

INSERT INTO Fare (price, pax_seg_id) VALUES (80000.00, 1);
INSERT INTO Fare (price, pax_seg_id) VALUES (80000.00, 2);
INSERT INTO Fare (price, pax_seg_id) VALUES (70000.00, 3);
INSERT INTO Fare (price, pax_seg_id) VALUES (70000.00, 4);

INSERT INTO Ticket (pax_id, ticket_number, issued_at) VALUES (1, '25T001S001', '2025-03-10 00:16:59');
INSERT INTO Ticket (pax_id, ticket_number, issued_at) VALUES (2, '25T002S001', '2025-03-10 00:16:59');
INSERT INTO Ticket (pax_id, ticket_number, issued_at) VALUES (1, '25T003S002', '2025-03-10 00:16:59');
INSERT INTO Ticket (pax_id, ticket_number, issued_at) VALUES (2, '25T004S002', '2025-03-10 00:16:59');

INSERT INTO Payment (ticket_id, fare_id, payment_method_id, payer_id, amount, payment_datetime) VALUES (1, 1, 1, 1, 95000.00, '2025-03-10 00:16:59');
INSERT INTO Payment (ticket_id, fare_id, payment_method_id, payer_id, amount, payment_datetime) VALUES (2, 2, 1, 1, 95000.00, '2025-03-10 00:16:59');
INSERT INTO Payment (ticket_id, fare_id, payment_method_id, payer_id, amount, payment_datetime) VALUES (3, 3, 1, 1, 82000.00, '2025-03-10 00:16:59');
INSERT INTO Payment (ticket_id, fare_id, payment_method_id, payer_id, amount, payment_datetime) VALUES (4, 4, 1, 1, 82000.00, '2025-03-10 00:16:59');

INSERT INTO Tax (amount, payment_id, tax_type_id) VALUES (5000.00, 1, 1);
INSERT INTO Tax (amount, payment_id, tax_type_id) VALUES (5000.00, 1, 2);
INSERT INTO Tax (amount, payment_id, tax_type_id) VALUES (5000.00, 1, 3);
INSERT INTO Tax (amount, payment_id, tax_type_id) VALUES (5000.00, 2, 1);
INSERT INTO Tax (amount, payment_id, tax_type_id) VALUES (5000.00, 2, 2);
INSERT INTO Tax (amount, payment_id, tax_type_id) VALUES (5000.00, 2, 3);
INSERT INTO Tax (amount, payment_id, tax_type_id) VALUES (4000.00, 3, 1);
INSERT INTO Tax (amount, payment_id, tax_type_id) VALUES (4000.00, 3, 2);
INSERT INTO Tax (amount, payment_id, tax_type_id) VALUES (4000.00, 3, 3);
INSERT INTO Tax (amount, payment_id, tax_type_id) VALUES (4000.00, 4, 1);

commit;

-- 예약티켓조회
SELECT p.name, p.gender, T.ticket_number, A.name as 출발지, A2.name as 도착지, S.departure_time, S.arrival_time
FROM PAX P
         JOIN Ticket T on P.id = T.pax_id
         JOIN Payment P2 on T.id = P2.ticket_id
         JOIN Fare F on P2.fare_id = F.id
         JOIN PAXSEG P3 on F.pax_seg_id = P3.pax_seg_id
         JOIN SEG S on F.pax_seg_id = s.id
         JOIN Airport A on S.departure_airport_id = A.id
         JOIN Airport A2 on S.arrival_airport_id = A2.id
WHERE P.name = '김태희';

