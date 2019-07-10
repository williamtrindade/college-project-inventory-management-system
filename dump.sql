--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.12
-- Dumped by pg_dump version 11.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: entrada; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entrada (
    id integer NOT NULL,
    data date,
    produto_id integer,
    preco numeric(12,2)
);


ALTER TABLE public.entrada OWNER TO postgres;

--
-- Name: estoque; Type: TABLE; Schema: public; Owner: pdp
--

CREATE TABLE public.estoque (
    id integer NOT NULL,
    produto_id integer,
    quantidade integer
);


ALTER TABLE public.estoque OWNER TO pdp;

--
-- Name: estoque_id_seq; Type: SEQUENCE; Schema: public; Owner: pdp
--

CREATE SEQUENCE public.estoque_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estoque_id_seq OWNER TO pdp;

--
-- Name: estoque_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pdp
--

ALTER SEQUENCE public.estoque_id_seq OWNED BY public.estoque.id;


--
-- Name: produto; Type: TABLE; Schema: public; Owner: pdp
--

CREATE TABLE public.produto (
    id integer NOT NULL,
    nome character varying(50),
    descricao character varying(50)
);


ALTER TABLE public.produto OWNER TO pdp;

--
-- Name: produto_id_seq; Type: SEQUENCE; Schema: public; Owner: pdp
--

CREATE SEQUENCE public.produto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.produto_id_seq OWNER TO pdp;

--
-- Name: produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pdp
--

ALTER SEQUENCE public.produto_id_seq OWNED BY public.produto.id;


--
-- Name: saida; Type: TABLE; Schema: public; Owner: pdp
--

CREATE TABLE public.saida (
    id integer NOT NULL,
    data date,
    produto_id integer,
    preco numeric(12,2)
);


ALTER TABLE public.saida OWNER TO pdp;

--
-- Name: saida_id_seq; Type: SEQUENCE; Schema: public; Owner: pdp
--

CREATE SEQUENCE public.saida_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saida_id_seq OWNER TO pdp;

--
-- Name: saida_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pdp
--

ALTER SEQUENCE public.saida_id_seq OWNED BY public.saida.id;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id integer NOT NULL,
    nome character varying(50),
    senha character varying(50),
    email character varying(60)
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: pdp
--

CREATE SEQUENCE public.usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_id_seq OWNER TO pdp;

--
-- Name: usuario_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_id_seq1 OWNER TO postgres;

--
-- Name: usuario_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_seq1 OWNED BY public.usuario.id;


--
-- Name: estoque id; Type: DEFAULT; Schema: public; Owner: pdp
--

ALTER TABLE ONLY public.estoque ALTER COLUMN id SET DEFAULT nextval('public.estoque_id_seq'::regclass);


--
-- Name: produto id; Type: DEFAULT; Schema: public; Owner: pdp
--

ALTER TABLE ONLY public.produto ALTER COLUMN id SET DEFAULT nextval('public.produto_id_seq'::regclass);


--
-- Name: saida id; Type: DEFAULT; Schema: public; Owner: pdp
--

ALTER TABLE ONLY public.saida ALTER COLUMN id SET DEFAULT nextval('public.saida_id_seq'::regclass);


--
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq1'::regclass);


--
-- Data for Name: entrada; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: estoque; Type: TABLE DATA; Schema: public; Owner: pdp
--

INSERT INTO public.estoque VALUES (1, 1, 123);
INSERT INTO public.estoque VALUES (5, 8, 0);
INSERT INTO public.estoque VALUES (6, 9, 0);


--
-- Data for Name: produto; Type: TABLE DATA; Schema: public; Owner: pdp
--

INSERT INTO public.produto VALUES (1, 'martelo', 'cor: prata');
INSERT INTO public.produto VALUES (2, 'prego', 'com 50 un');
INSERT INTO public.produto VALUES (3, 'abc', 'descrição teste');
INSERT INTO public.produto VALUES (4, 'sw', 'sw');
INSERT INTO public.produto VALUES (5, 'ds', 'ds');
INSERT INTO public.produto VALUES (6, 'dsss', 'dssdss');
INSERT INTO public.produto VALUES (7, 'dsdsdd', 'dss');
INSERT INTO public.produto VALUES (8, 'fr', 'fr');
INSERT INTO public.produto VALUES (9, 'fr', 'frffffffffffffffffffffffffffffffffffff');


--
-- Data for Name: saida; Type: TABLE DATA; Schema: public; Owner: pdp
--



--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuario VALUES (1, 'Admin', '1234', 'admin@gmail.com');


--
-- Name: estoque_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pdp
--

SELECT pg_catalog.setval('public.estoque_id_seq', 6, true);


--
-- Name: produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pdp
--

SELECT pg_catalog.setval('public.produto_id_seq', 9, true);


--
-- Name: saida_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pdp
--

SELECT pg_catalog.setval('public.saida_id_seq', 1, false);


--
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pdp
--

SELECT pg_catalog.setval('public.usuario_id_seq', 1, false);


--
-- Name: usuario_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_seq1', 1, true);


--
-- Name: entrada entrada_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrada
    ADD CONSTRAINT entrada_pk PRIMARY KEY (id);


--
-- Name: estoque estoque_pkey; Type: CONSTRAINT; Schema: public; Owner: pdp
--

ALTER TABLE ONLY public.estoque
    ADD CONSTRAINT estoque_pkey PRIMARY KEY (id);


--
-- Name: produto produto_pkey; Type: CONSTRAINT; Schema: public; Owner: pdp
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id);


--
-- Name: saida saida_pkey; Type: CONSTRAINT; Schema: public; Owner: pdp
--

ALTER TABLE ONLY public.saida
    ADD CONSTRAINT saida_pkey PRIMARY KEY (id);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- Name: estoque produto_id; Type: FK CONSTRAINT; Schema: public; Owner: pdp
--

ALTER TABLE ONLY public.estoque
    ADD CONSTRAINT produto_id FOREIGN KEY (produto_id) REFERENCES public.produto(id);


--
-- Name: saida produto_id; Type: FK CONSTRAINT; Schema: public; Owner: pdp
--

ALTER TABLE ONLY public.saida
    ADD CONSTRAINT produto_id FOREIGN KEY (produto_id) REFERENCES public.produto(id);


--
-- PostgreSQL database dump complete
--

