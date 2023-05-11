--drop table DS.FT_BALANCE_F;
create table DS.FT_BALANCE_F (
	ON_DATE  			DATE not null,
	ACCOUNT_RK			NUMERIC not null,
	CURRENCY_RK			NUMERIC,
	BALANCE_OUT			FLOAT,
	constraint ft_balance_f_pk PRIMARY KEY (ON_DATE, ACCOUNT_RK)
);

--drop table DS.FT_POSTING_F;
create table DS.FT_POSTING_F (
	POSTING_ID			INT not null,
	OPER_DATE			DATE not null,
	CREDIT_ACCOUNT_RK	NUMERIC not null,
	DEBET_ACCOUNT_RK	NUMERIC not null,
	CREDIT_AMOUNT		FLOAT,
	DEBET_AMOUNT		FLOAT
);

--drop table DS.MD_ACCOUNT_D;
create table DS.MD_ACCOUNT_D (
	DATA_ACTUAL_DATE		DATE not null,
	DATA_ACTUAL_END_DATE	DATE not null,
	ACCOUNT_RK 				NUMERIC not null,
	ACCOUNT_NUMBER			VARCHAR(20) not null,
	CHAR_TYPE				VARCHAR(1) not null,
	CURRENCY_RK				NUMERIC not null,
	CURRENCY_CODE			VARCHAR(3) not null,
	constraint md_account_d_pk PRIMARY KEY (DATA_ACTUAL_DATE, ACCOUNT_RK)
);

--drop table DS.MD_CURRENCY_D;
create table DS.MD_CURRENCY_D (
	CURRENCY_RK				NUMERIC not null,
	DATA_ACTUAL_DATE		DATE not null,
	DATA_ACTUAL_END_DATE	DATE,
	CURRENCY_CODE			VARCHAR(3),
	CODE_ISO_CHAR			VARCHAR(3),
	constraint md_currency_d_pk PRIMARY KEY (CURRENCY_RK, DATA_ACTUAL_DATE)
);

--drop table DS.MD_EXCHANGE_RATE_D;
create table DS.MD_EXCHANGE_RATE_D (
	DATA_ACTUAL_DATE		DATE not null,
	DATA_ACTUAL_END_DATE	DATE,
	CURRENCY_RK				NUMERIC not null,
	REDUCED_COURCE			FLOAT,
	CODE_ISO_NUM			VARCHAR(3),
	constraint md_exchange_rate_d_pk PRIMARY KEY (DATA_ACTUAL_DATE, CURRENCY_RK)
);

--drop table DS.MD_LEDGER_ACCOUNT_S;
create table DS.MD_LEDGER_ACCOUNT_S (
	CHAPTER							CHAR(1),
	CHAPTER_NAME					VARCHAR(16),
	SECTION_NUMBER					INT,
	SECTION_NAME					VARCHAR(22),
	SUBSECTION_NAME					VARCHAR(21),
	LEDGER1_ACCOUNT					INT,
	LEDGER1_ACCOUNT_NAME			VARCHAR(47),
	LEDGER_ACCOUNT					INT not null,
	LEDGER_ACCOUNT_NAME				VARCHAR(153),
	CHARACTERISTIC					CHAR(1),
	IS_RESIDENT						INT,
	IS_RESERVE						INT,
	IS_RESERVED						INT,
	IS_LOAN							INT,
	IS_RESERVED_ASSETS				INT,
	IS_OVERDUE						INT,
	IS_INTEREST						INT,
	PAIR_ACCOUNT					VARCHAR(5),
	START_DATE						DATE not null,
	END_DATE						DATE,
	IS_RUB_ONLY						INT,
	MIN_TERM						VARCHAR(1),
	MIN_TERM_MEASURE				VARCHAR(1),
	MAX_TERM						VARCHAR(1),
	MAX_TERM_MEASURE				VARCHAR(1),
	LEDGER_ACC_FULL_NAME_TRANSLIT	VARCHAR(1),
	IS_REVALUATION					VARCHAR(1),
	IS_CORRECT						VARCHAR(1),
	constraint md_ledger_account_s_pk PRIMARY KEY (LEDGER_ACCOUNT, START_DATE)
);

--drop table LOGS.LOAD_LOGS;
create table LOGS.LOAD_LOGS(
	action_id 		INT not null GENERATED ALWAYS AS IDENTITY,
	source			VARCHAR(50) not null,
	action_date		TIMESTAMP not null,
	action 			VARCHAR(50) not null,
	constraint load_logs_action_id_pk PRIMARY KEY (action_id)
);

--drop table LOGS.LOGS_ERROR;
create table LOGS.LOGS_ERROR (
	error_id 	INT not null GENERATED ALWAYS AS IDENTITY,
	moment 		TIMESTAMP,
	message		TEXT,
	project		TEXT,
	job			TEXT,
	context		TEXT,
	priority	INT,
	type		TEXT,
	origin		TEXT,
	code		INT,
	constraint logs_error_id_pk PRIMARY KEY (error_id)
);

--drop table LOGS.STAT_LOG;
create table LOGS.STAT_LOG (
	process_id		INT not null GENERATED ALWAYS AS IDENTITY,
	process_date	TIMESTAMP,
	message_type	TEXT,
	message			TEXT,
	duration		INT,
	job				TEXT,
	constraint stat_log_process_id_pk PRIMARY KEY (process_id)
);
-----------------------------------------
--truncate table DS.FT_BALANCE_F;
select * from DS.FT_BALANCE_F order by ACCOUNT_RK asc;
---------
--truncate table LOGS.LOAD_LOGS;
select * from LOGS.LOAD_LOGS;
---------
--truncate table LOGS.LOGS_ERROR;
select * from LOGS.LOGS_ERROR;
---------
--truncate table LOGS.STAT_LOG;
select * from LOGS.STAT_LOG;
