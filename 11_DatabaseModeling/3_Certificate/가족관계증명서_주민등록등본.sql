CREATE TABLE `CertificateType` (
	`id`	int	NOT NULL,
	`type`	varchar(50)	NOT NULL
);

CREATE TABLE `DeathReport` (
	`id`	int	NOT NULL,
	`death_date`	datetime	NOT NULL,
	`death_place_addr`	varchar(255)	NULL,
	`reporter_email`	varchar(50)	NULL,
	`reporter_phonenum`	varchar(50)	NULL,
	`death_place_id`	int	NOT NULL,
	`reporter_id`	int	NOT NULL,
	`report_eligibility_id`	int	NOT NULL,
	`report_date`	date	NOT NULL
);

CREATE TABLE `PersonRelationshipType` (
	`id`	int	NOT NULL,
	`relation`	varchar(10)	NOT NULL
);

CREATE TABLE `BirthReportEligibility` (
	`id`	int	NOT NULL,
	`eligibility`	varchar(50)	NOT NULL
);

CREATE TABLE `CertificateIssuance` (
	`code`	varchar(16)	NOT NULL,
	`certificate_date`	date	NOT NULL,
	`certificater_id`	int	NOT NULL,
	`certificate_type_id`	int	NOT NULL
);

CREATE TABLE `Residence` (
	`id`	int	NOT NULL,
	`persion_id`	int	NOT NULL,
	`register_date`	date	NOT NULL,
	`householder_relation_id`	int	NOT NULL,
	`change_reason_id`	int	NOT NULL,
	`address_id`	int	NOT NULL,
	`Field`	boolean	NOT NULL
);

CREATE TABLE `Person` (
	`id`	int	NOT NULL,
	`jumin_first`	varchar(6)	NOT NULL,
	`jumin_last`	varchar(7)	NOT NULL,
	`name`	varchar(50)	NOT NULL,
	`gender`	varchar(50)	NOT NULL,
	`death_report`	int	NULL,
	`birth_report`	int	NULL
);

CREATE TABLE `BirthPlace` (
	`id`	int	NOT NULL,
	`place`	varchar(50)	NOT NULL
);

CREATE TABLE `PersonRelationship` (
	`id`	int	NOT NULL,
	`person_id_1`	int	NOT NULL,
	`person_id_2`	int	NOT NULL,
	`person_relationship_type_id`	int	NOT NULL
);

CREATE TABLE `DeathPlace` (
	`id`	int	NOT NULL,
	`place`	varchar(50)	NOT NULL
);

CREATE TABLE `HouseholderRelation` (
	`id`	int	NOT NULL,
	`relation`	varchar(50)	NOT NULL
);

CREATE TABLE `DeathReportEligibility` (
	`id`	int	NOT NULL,
	`eligibility`	varchar(50)	NOT NULL
);

CREATE TABLE `BirthReport` (
	`id`	int	NOT NULL,
	`birth_date`	datetime	NOT NULL,
	`fam_origin`	varchar(255)	NULL,
	`reporter_email`	varchar(50)	NULL,
	`reporter_phonenum`	varchar(50)	NULL,
	`birth_place_id`	int	NOT NULL,
	`reporter_id`	int	NOT NULL,
	`report_eligibility_id`	int	NOT NULL,
	`report_date`	date	NOT NULL
);

CREATE TABLE `ChangeReason` (
	`id`	int	NOT NULL,
	`reason`	varchar(50)	NULL
);

CREATE TABLE `Address` (
	`id`	int	NOT NULL,
	`address`	varchar(255)	NOT NULL
);

ALTER TABLE `CertificateType` ADD CONSTRAINT `PK_CERTIFICATETYPE` PRIMARY KEY (
	`id`
);

ALTER TABLE `DeathReport` ADD CONSTRAINT `PK_DEATHREPORT` PRIMARY KEY (
	`id`
);

ALTER TABLE `PersonRelationshipType` ADD CONSTRAINT `PK_PERSONRELATIONSHIPTYPE` PRIMARY KEY (
	`id`
);

ALTER TABLE `BirthReportEligibility` ADD CONSTRAINT `PK_BIRTHREPORTELIGIBILITY` PRIMARY KEY (
	`id`
);

ALTER TABLE `CertificateIssuance` ADD CONSTRAINT `PK_CERTIFICATEISSUANCE` PRIMARY KEY (
	`code`
);

ALTER TABLE `Residence` ADD CONSTRAINT `PK_RESIDENCE` PRIMARY KEY (
	`id`
);

ALTER TABLE `Person` ADD CONSTRAINT `PK_PERSON` PRIMARY KEY (
	`id`
);

ALTER TABLE `BirthPlace` ADD CONSTRAINT `PK_BIRTHPLACE` PRIMARY KEY (
	`id`
);

ALTER TABLE `PersonRelationship` ADD CONSTRAINT `PK_PERSONRELATIONSHIP` PRIMARY KEY (
	`id`
);

ALTER TABLE `DeathPlace` ADD CONSTRAINT `PK_DEATHPLACE` PRIMARY KEY (
	`id`
);

ALTER TABLE `HouseholderRelation` ADD CONSTRAINT `PK_HOUSEHOLDERRELATION` PRIMARY KEY (
	`id`
);

ALTER TABLE `DeathReportEligibility` ADD CONSTRAINT `PK_DEATHREPORTELIGIBILITY` PRIMARY KEY (
	`id`
);

ALTER TABLE `BirthReport` ADD CONSTRAINT `PK_BIRTHREPORT` PRIMARY KEY (
	`id`
);

ALTER TABLE `ChangeReason` ADD CONSTRAINT `PK_CHANGEREASON` PRIMARY KEY (
	`id`
);

ALTER TABLE `Address` ADD CONSTRAINT `PK_ADDRESS` PRIMARY KEY (
	`id`
);

ALTER TABLE `DeathReport` ADD CONSTRAINT `FK_DeathPlace_TO_DeathReport_1` FOREIGN KEY (
	`death_place_id`
)
REFERENCES `DeathPlace` (
	`id`
);

ALTER TABLE `DeathReport` ADD CONSTRAINT `FK_Person_TO_DeathReport_1` FOREIGN KEY (
	`reporter_id`
)
REFERENCES `Person` (
	`id`
);

ALTER TABLE `DeathReport` ADD CONSTRAINT `FK_DeathReportEligibility_TO_DeathReport_1` FOREIGN KEY (
	`report_eligibility_id`
)
REFERENCES `DeathReportEligibility` (
	`id`
);

ALTER TABLE `CertificateIssuance` ADD CONSTRAINT `FK_Person_TO_CertificateIssuance_1` FOREIGN KEY (
	`certificater_id`
)
REFERENCES `Person` (
	`id`
);

ALTER TABLE `CertificateIssuance` ADD CONSTRAINT `FK_CertificateType_TO_CertificateIssuance_1` FOREIGN KEY (
	`certificate_type_id`
)
REFERENCES `CertificateType` (
	`id`
);

ALTER TABLE `Residence` ADD CONSTRAINT `FK_Person_TO_Residence_1` FOREIGN KEY (
	`persion_id`
)
REFERENCES `Person` (
	`id`
);

ALTER TABLE `Residence` ADD CONSTRAINT `FK_HouseholderRelation_TO_Residence_1` FOREIGN KEY (
	`householder_relation_id`
)
REFERENCES `HouseholderRelation` (
	`id`
);

ALTER TABLE `Residence` ADD CONSTRAINT `FK_ChangeReason_TO_Residence_1` FOREIGN KEY (
	`change_reason_id`
)
REFERENCES `ChangeReason` (
	`id`
);

ALTER TABLE `Residence` ADD CONSTRAINT `FK_Address_TO_Residence_1` FOREIGN KEY (
	`address_id`
)
REFERENCES `Address` (
	`id`
);

ALTER TABLE `Person` ADD CONSTRAINT `FK_DeathReport_TO_Person_1` FOREIGN KEY (
	`death_report`
)
REFERENCES `DeathReport` (
	`id`
);

ALTER TABLE `Person` ADD CONSTRAINT `FK_BirthReport_TO_Person_1` FOREIGN KEY (
	`birth_report`
)
REFERENCES `BirthReport` (
	`id`
);

ALTER TABLE `PersonRelationship` ADD CONSTRAINT `FK_Person_TO_PersonRelationship_1` FOREIGN KEY (
	`person_id_1`
)
REFERENCES `Person` (
	`id`
);

ALTER TABLE `PersonRelationship` ADD CONSTRAINT `FK_Person_TO_PersonRelationship_2` FOREIGN KEY (
	`person_id_2`
)
REFERENCES `Person` (
	`id`
);

ALTER TABLE `PersonRelationship` ADD CONSTRAINT `FK_PersonRelationshipType_TO_PersonRelationship_1` FOREIGN KEY (
	`person_relationship_type_id`
)
REFERENCES `PersonRelationshipType` (
	`id`
);

ALTER TABLE `BirthReport` ADD CONSTRAINT `FK_BirthPlace_TO_BirthReport_1` FOREIGN KEY (
	`birth_place_id`
)
REFERENCES `BirthPlace` (
	`id`
);

ALTER TABLE `BirthReport` ADD CONSTRAINT `FK_Person_TO_BirthReport_1` FOREIGN KEY (
	`reporter_id`
)
REFERENCES `Person` (
	`id`
);

ALTER TABLE `BirthReport` ADD CONSTRAINT `FK_BirthReportEligibility_TO_BirthReport_1` FOREIGN KEY (
	`report_eligibility_id`
)
REFERENCES `BirthReportEligibility` (
	`id`
);

