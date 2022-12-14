

CREATE TABLE PART (
        P_PARTKEY               SERIAL8,
        P_NAME                  VARCHAR(55),
        P_MFGR                  CHAR(25),
        P_BRAND                 CHAR(10),
        P_TYPE                  VARCHAR(25),
        P_SIZE                  INTEGER,
        P_CONTAINER             CHAR(10),
        P_RETAILPRICE   DECIMAL,
        P_COMMENT               VARCHAR(23)
) with (APPENDONLY=true,BLOCKSIZE=2097152,ORIENTATION=COLUMN,CHECKSUM=true,OIDS=false) DISTRIBUTED BY (p_partkey);




CREATE TABLE REGION (
        R_REGIONKEY     SERIAL8,
        R_NAME          CHAR(25),
        R_COMMENT       VARCHAR(152)
)  with (APPENDONLY=true,BLOCKSIZE=2097152,ORIENTATION=COLUMN,CHECKSUM=true,OIDS=false) DISTRIBUTED BY (r_regionkey);



CREATE TABLE NATION (
        N_NATIONKEY             SERIAL8,
        N_NAME                  CHAR(25),
        N_REGIONKEY             BIGINT NOT NULL,  -- references R_REGIONKEY
        N_COMMENT               VARCHAR(152)
)  with (APPENDONLY=true,BLOCKSIZE=2097152,ORIENTATION=COLUMN,CHECKSUM=true,OIDS=false) DISTRIBUTED BY (n_nationkey);



CREATE TABLE SUPPLIER (
        S_SUPPKEY               SERIAL8,
        S_NAME                  CHAR(25),
        S_ADDRESS               VARCHAR(40),
        S_NATIONKEY             BIGINT NOT NULL, -- references N_NATIONKEY
        S_PHONE                 CHAR(15),
        S_ACCTBAL               DECIMAL,
        S_COMMENT               VARCHAR(101)
)  with (APPENDONLY=true,BLOCKSIZE=2097152,ORIENTATION=COLUMN,CHECKSUM=true,OIDS=false) DISTRIBUTED BY (s_suppkey);


CREATE TABLE CUSTOMER (
        C_CUSTKEY               SERIAL8,
        C_NAME                  VARCHAR(25),
        C_ADDRESS               VARCHAR(40),
        C_NATIONKEY             BIGINT NOT NULL, -- references N_NATIONKEY
        C_PHONE                 CHAR(15),
        C_ACCTBAL               DECIMAL,
        C_MKTSEGMENT    CHAR(10),
        C_COMMENT               VARCHAR(117)
)  with (APPENDONLY=true,BLOCKSIZE=2097152,ORIENTATION=COLUMN,CHECKSUM=true,OIDS=false) DISTRIBUTED BY (c_custkey);



CREATE TABLE PARTSUPP (
        PS_PARTKEY              BIGINT NOT NULL, -- references P_PARTKEY
        PS_SUPPKEY              BIGINT NOT NULL, -- references S_SUPPKEY
        PS_AVAILQTY             INTEGER,
        PS_SUPPLYCOST   DECIMAL,
        PS_COMMENT              VARCHAR(199)
)  with (APPENDONLY=true,BLOCKSIZE=2097152,ORIENTATION=COLUMN,CHECKSUM=true,OIDS=false) DISTRIBUTED BY (ps_partkey,ps_suppkey);



CREATE TABLE ORDERS (
        O_ORDERKEY              SERIAL8,
        O_CUSTKEY               BIGINT NOT NULL, -- references C_CUSTKEY
        O_ORDERSTATUS   CHAR(1),
        O_TOTALPRICE    DECIMAL,
        O_ORDERDATE             DATE,
        O_ORDERPRIORITY CHAR(15),
        O_CLERK                 CHAR(15),
        O_SHIPPRIORITY  INTEGER,
        O_COMMENT               VARCHAR(79)
)  with (APPENDONLY=true,BLOCKSIZE=2097152,ORIENTATION=COLUMN,CHECKSUM=true,OIDS=false) DISTRIBUTED BY (o_orderkey);


CREATE TABLE LINEITEM (
        L_ORDERKEY              BIGINT NOT NULL, -- references O_ORDERKEY
        L_PARTKEY               BIGINT NOT NULL, -- references P_PARTKEY (compound fk to PARTSUPP)
        L_SUPPKEY               BIGINT NOT NULL, -- references S_SUPPKEY (compound fk to PARTSUPP)
        L_LINENUMBER    INTEGER,
        L_QUANTITY              DECIMAL,
        L_EXTENDEDPRICE DECIMAL,
        L_DISCOUNT              DECIMAL,
        L_TAX                   DECIMAL,
        L_RETURNFLAG    CHAR(1),
        L_LINESTATUS    CHAR(1),
        L_SHIPDATE              DATE,
        L_COMMITDATE    DATE,
        L_RECEIPTDATE   DATE,
        L_SHIPINSTRUCT  CHAR(25),
        L_SHIPMODE              CHAR(10),
        L_COMMENT               VARCHAR(44)
)  with (APPENDONLY=true,BLOCKSIZE=2097152,ORIENTATION=COLUMN,CHECKSUM=true,OIDS=false) DISTRIBUTED BY (l_orderkey, l_linenumber);


\COPY part FROM './benchmark-greenplum/JCC-H_dbgen/part.tbl' WITH csv DELIMITER '|';
\COPY region FROM './benchmark-greenplum/JCC-H_dbgen/region.tbl' WITH csv DELIMITER '|';
\COPY nation FROM './benchmark-greenplum/JCC-H_dbgen/nation.tbl' WITH csv DELIMITER '|';
\COPY supplier FROM './benchmark-greenplum/JCC-H_dbgen/supplier.tbl' WITH csv DELIMITER '|';
\COPY customer FROM './benchmark-greenplum/JCC-H_dbgen/customer.tbl' WITH csv DELIMITER '|';
\COPY partsupp FROM './benchmark-greenplum/JCC-H_dbgen/partsupp.tbl' WITH csv DELIMITER '|';
\COPY orders FROM './benchmark-greenplum/JCC-H_dbgen/orders.tbl' WITH csv DELIMITER '|';
\COPY lineitem FROM './benchmark-greenplum/JCC-H_dbgen/lineitem.tbl' WITH csv DELIMITER '|';
