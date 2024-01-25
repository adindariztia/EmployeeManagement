--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: department; Type: TABLE; Schema: public; Owner: udin
--

CREATE TABLE public.department (
    id integer NOT NULL,
    name character varying NOT NULL,
    description character varying NOT NULL
);


ALTER TABLE public.department OWNER TO udin;

--
-- Name: department_id_seq; Type: SEQUENCE; Schema: public; Owner: udin
--

CREATE SEQUENCE public.department_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.department_id_seq OWNER TO udin;

--
-- Name: department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: udin
--

ALTER SEQUENCE public.department_id_seq OWNED BY public.department.id;


--
-- Name: employee; Type: TABLE; Schema: public; Owner: udin
--

CREATE TABLE public.employee (
    id integer NOT NULL,
    name character varying NOT NULL,
    department_id integer NOT NULL,
    birthdate timestamp without time zone NOT NULL,
    address character varying NOT NULL,
    active boolean
);


ALTER TABLE public.employee OWNER TO udin;

--
-- Name: employee_id_seq; Type: SEQUENCE; Schema: public; Owner: udin
--

CREATE SEQUENCE public.employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_id_seq OWNER TO udin;

--
-- Name: employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: udin
--

ALTER SEQUENCE public.employee_id_seq OWNED BY public.employee.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: udin
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying NOT NULL,
    password character varying NOT NULL,
    email character varying NOT NULL
);


ALTER TABLE public."user" OWNER TO udin;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: udin
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO udin;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: udin
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: department id; Type: DEFAULT; Schema: public; Owner: udin
--

ALTER TABLE ONLY public.department ALTER COLUMN id SET DEFAULT nextval('public.department_id_seq'::regclass);


--
-- Name: employee id; Type: DEFAULT; Schema: public; Owner: udin
--

ALTER TABLE ONLY public.employee ALTER COLUMN id SET DEFAULT nextval('public.employee_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: udin
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: udin
--

COPY public.department (id, name, description) FROM stdin;
1	Tax and Accounting	Tax and Accounting department
\.


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: udin
--

COPY public.employee (id, name, department_id, birthdate, address, active) FROM stdin;
1	Adinda	1	1996-08-25 00:00:00	jalan keti peri	t
4	Cincan	1	2024-01-25 00:00:00	di rumah	t
6	Cincan Maniezzz	1	2024-01-25 00:00:00	di rumah	t
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: udin
--

COPY public."user" (id, username, password, email) FROM stdin;
1	udin	udin	udin@udin.com
\.


--
-- Name: department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: udin
--

SELECT pg_catalog.setval('public.department_id_seq', 1, true);


--
-- Name: employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: udin
--

SELECT pg_catalog.setval('public.employee_id_seq', 6, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: udin
--

SELECT pg_catalog.setval('public.user_id_seq', 1, true);


--
-- Name: department department_pkey; Type: CONSTRAINT; Schema: public; Owner: udin
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (id);


--
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: udin
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: udin
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: employee employee_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: udin
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.department(id);


--
-- PostgreSQL database dump complete
--

