-- District Level Branch Table

CREATE TABLE district_level_branch
(
  d_branchid integer NOT NULL,
  branch_name character varying(30),
  address text,
  contact_details character(10),
  director_id integer,
  CONSTRAINT district_level_branch_pkey PRIMARY KEY (d_branchid),
  CONSTRAINT "DirectorID_FK" FOREIGN KEY (director_id)
      REFERENCES employee (employee_id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Employee Table 

CREATE TABLE employee
(
  employee_id integer NOT NULL,
  f_name character varying(20),
  l_name character varying(20),
  dob date,
  gender character(1),
  address text,
  contact_details character(10),
  branch_type character varying(20),
  salary real,
  CONSTRAINT employee_pkey PRIMARY KEY (employee_id)
);

-- manufacturing Details 

CREATE TABLE manufacturing_details
(
  man_date date,
  man_cost real,
  quantity integer,
  expiry_date date,
  batch_id integer,
  CONSTRAINT "BatchID_FK" FOREIGN KEY (batch_id)
      REFERENCES product (batch_id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- milk Table 

CREATE TABLE milk
(
  m_date date NOT NULL,
  fat numeric(3,2),
  milk_type character varying(15),
  quantity integer,
  milker_id integer,
  CONSTRAINT "Milk_typefk" FOREIGN KEY (milk_type)
      REFERENCES milk_price (milk_type) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- milk_price Table

CREATE TABLE milk_price
(
  milk_type character varying(15) NOT NULL,
  price_per_liter numeric(4,2),
  CONSTRAINT milk_type PRIMARY KEY (milk_type)
);

-- milker Table 

CREATE TABLE milker
(
  milker_id integer NOT NULL,
  milker_name character varying(50),
  contact_details character(10),
  address text,
  village_branch_id integer,
  gender character varying(8),
  CONSTRAINT milker_pkey PRIMARY KEY (milker_id),
  CONSTRAINT "V_BranchIDfk" FOREIGN KEY (village_branch_id)
      REFERENCES village_level_branch (v_branchid) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- pruduct Table 

CREATE TABLE product
(
  batch_id integer NOT NULL,
  product_name character varying(20),
  d_branchid integer,
  CONSTRAINT product_pkey PRIMARY KEY (batch_id),
  CONSTRAINT "D_BranchID_FK" FOREIGN KEY (d_branchid)
      REFERENCES district_level_branch (d_branchid) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Product_supply_details Table 

CREATE TABLE product_supply_details
(
  batch_id integer NOT NULL,
  supplier_id integer NOT NULL,
  sale_price real,
  quantity integer,
  supply_date date NOT NULL,
  CONSTRAINT product_supply_details_pkey PRIMARY KEY (batch_id, supplier_id, supply_date),
  CONSTRAINT "Batch_ID_Fk" FOREIGN KEY (batch_id)
      REFERENCES product (batch_id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT "s_ID_FK" FOREIGN KEY (supplier_id)
      REFERENCES supplier (supplier_id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- supplier Table 

CREATE TABLE supplier
(
  supplier_id integer NOT NULL,
  s_name character varying(20),
  city character varying(20),
  contact_details character(10),
  CONSTRAINT supplier_pkey PRIMARY KEY (supplier_id)
);

-- village_level_branch Table 



CREATE TABLE village_level_branch
(
  v_branchid integer NOT NULL,
  branch_name character varying(30),
  village_name character varying(30),
  contact_details character(10),
  manager_id integer,
  d_branchid integer,
  CONSTRAINT village_level_branch_pkey PRIMARY KEY (v_branchid),
  CONSTRAINT "D_BranchID_FK" FOREIGN KEY (d_branchid)
      REFERENCES district_level_branch (d_branchid) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT "Man_ID_FK" FOREIGN KEY (manager_id)
      REFERENCES employee (employee_id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
);



