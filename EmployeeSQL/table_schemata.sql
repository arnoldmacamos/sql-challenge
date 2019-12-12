-- Table: public.employees

-- DROP TABLE public.employees;

CREATE TABLE public.employees
(
    emp_no integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 10001 MINVALUE 10001 MAXVALUE 2147483647 CACHE 1 ),
    birth_date date NOT NULL,
    first_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    gender character varying(1) COLLATE pg_catalog."default" NOT NULL,
    hire_date date NOT NULL,
    CONSTRAINT employees_pkey PRIMARY KEY (emp_no)
)

TABLESPACE pg_default;

ALTER TABLE public.employees
    OWNER to postgres;


-- Table: public.departments

-- DROP TABLE public.departments;

CREATE TABLE public.departments
(
    dept_no character varying(4) COLLATE pg_catalog."default" NOT NULL,
    dept_name character varying(30) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT departments_pkey PRIMARY KEY (dept_no)
)

TABLESPACE pg_default;

ALTER TABLE public.departments
    OWNER to postgres;
	
	
-- Table: public.titles

-- DROP TABLE public.titles;

CREATE TABLE public.titles
(
    emp_no integer NOT NULL,
    title character varying(50) COLLATE pg_catalog."default" NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    CONSTRAINT "FK_employees_emp_no" FOREIGN KEY (emp_no)
        REFERENCES public.employees (emp_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.titles
    OWNER to postgres;
	

-- Table: public.salaries

-- DROP TABLE public.salaries;

CREATE TABLE public.salaries
(
    emp_no integer NOT NULL,
    salary numeric(8,0) NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    CONSTRAINT "FK_employees_emp_no" FOREIGN KEY (emp_no)
        REFERENCES public.employees (emp_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.salaries
    OWNER to postgres;


-- Table: public.dept_emp

-- DROP TABLE public.dept_emp;

CREATE TABLE public.dept_emp
(
    emp_no integer NOT NULL,
    dept_no character varying(4) COLLATE pg_catalog."default" NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    CONSTRAINT "FK_departments_dept_no" FOREIGN KEY (dept_no)
        REFERENCES public.departments (dept_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK_employees_emp_no" FOREIGN KEY (emp_no)
        REFERENCES public.employees (emp_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.dept_emp
    OWNER to postgres;
	

-- Table: public.dept_manager

-- DROP TABLE public.dept_manager;

CREATE TABLE public.dept_manager
(
    dept_no character varying(4) COLLATE pg_catalog."default" NOT NULL,
    emp_no integer NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    CONSTRAINT "FK_deparments_dept_no" FOREIGN KEY (dept_no)
        REFERENCES public.departments (dept_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK_employees_emp_no" FOREIGN KEY (emp_no)
        REFERENCES public.employees (emp_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.dept_manager
    OWNER to postgres;