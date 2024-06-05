--
-- PostgreSQL database dump
--

-- Dumped from database version 14.12 (Ubuntu 14.12-1.pgdg22.04+1)
-- Dumped by pg_dump version 16.3 (Ubuntu 16.3-1.pgdg22.04+1)

-- Started on 2024-06-05 13:45:19 -03

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

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 16973)
-- Name: movie; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.movie (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    director character varying(100) NOT NULL,
    year integer NOT NULL
);


ALTER TABLE public.movie OWNER TO myuser;

--
-- TOC entry 209 (class 1259 OID 16972)
-- Name: movie_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

CREATE SEQUENCE public.movie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.movie_id_seq OWNER TO myuser;

--
-- TOC entry 3357 (class 0 OID 0)
-- Dependencies: 209
-- Name: movie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myuser
--

ALTER SEQUENCE public.movie_id_seq OWNED BY public.movie.id;


--
-- TOC entry 3207 (class 2604 OID 16976)
-- Name: movie id; Type: DEFAULT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.movie ALTER COLUMN id SET DEFAULT nextval('public.movie_id_seq'::regclass);


--
-- TOC entry 3350 (class 0 OID 16973)
-- Dependencies: 210
-- Data for Name: movie; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.movie (id, title, director, year) FROM stdin;
1	Inception	Christopher Nolan	2010
2	The Matrix	Lana Wachowski, Lilly Wachowski	1999
3	Interstellar	Christopher Nolan	2014
4	Parasite	Bong Joon Ho	2019
5	The Shawshank Redemption	Frank Darabont	1994
6	Pulp Fiction	Quentin Tarantino	1994
7	The Godfather	Francis Ford Coppola	1972
8	The Dark Knight	Christopher Nolan	2008
9	Schindler's List	Steven Spielberg	1993
10	Fight Club	David Fincher	1999
\.


--
-- TOC entry 3358 (class 0 OID 0)
-- Dependencies: 209
-- Name: movie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.movie_id_seq', 10, true);


--
-- TOC entry 3209 (class 2606 OID 16978)
-- Name: movie movie_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.movie
    ADD CONSTRAINT movie_pkey PRIMARY KEY (id);


--
-- TOC entry 3356 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2024-06-05 13:45:19 -03

--
-- PostgreSQL database dump complete
--

