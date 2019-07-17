--
-- PostgreSQL database dump
--

-- Dumped from database version 10.9 (Ubuntu 10.9-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.9 (Ubuntu 10.9-0ubuntu0.18.04.1)

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

SET default_with_oids = false;

--
-- Name: entrada; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entrada (
    data date,
    produto_id integer,
    preco numeric(12,2),
    id integer NOT NULL,
    quantidade integer NOT NULL
);


ALTER TABLE public.entrada OWNER TO postgres;

--
-- Name: entrada_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.entrada_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.entrada_id_seq OWNER TO postgres;

--
-- Name: entrada_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.entrada_id_seq OWNED BY public.entrada.id;


--
-- Name: entrada_quantidade_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.entrada_quantidade_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.entrada_quantidade_seq OWNER TO postgres;

--
-- Name: entrada_quantidade_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.entrada_quantidade_seq OWNED BY public.entrada.quantidade;


--
-- Name: estoque; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estoque (
    id integer NOT NULL,
    produto_id integer,
    quantidade integer
);


ALTER TABLE public.estoque OWNER TO postgres;

--
-- Name: estoque_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estoque_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estoque_id_seq OWNER TO postgres;

--
-- Name: estoque_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estoque_id_seq OWNED BY public.estoque.id;


--
-- Name: produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produto (
    id integer NOT NULL,
    nome character varying(50),
    descricao character varying(50),
    status character varying(10)
);


ALTER TABLE public.produto OWNER TO postgres;

--
-- Name: produto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.produto_id_seq OWNER TO postgres;

--
-- Name: produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produto_id_seq OWNED BY public.produto.id;


--
-- Name: saida; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.saida (
    id integer NOT NULL,
    data date,
    produto_id integer,
    preco numeric(12,2),
    quantidade integer
);


ALTER TABLE public.saida OWNER TO postgres;

--
-- Name: saida_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.saida_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saida_id_seq OWNER TO postgres;

--
-- Name: saida_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
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
-- Name: entrada id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrada ALTER COLUMN id SET DEFAULT nextval('public.entrada_id_seq'::regclass);


--
-- Name: entrada quantidade; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrada ALTER COLUMN quantidade SET DEFAULT nextval('public.entrada_quantidade_seq'::regclass);


--
-- Name: estoque id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estoque ALTER COLUMN id SET DEFAULT nextval('public.estoque_id_seq'::regclass);


--
-- Name: produto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto ALTER COLUMN id SET DEFAULT nextval('public.produto_id_seq'::regclass);


--
-- Name: saida id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saida ALTER COLUMN id SET DEFAULT nextval('public.saida_id_seq'::regclass);


--
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq1'::regclass);


--
-- Data for Name: entrada; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entrada (data, produto_id, preco, id, quantidade) FROM stdin;
\.


--
-- Data for Name: estoque; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estoque (id, produto_id, quantidade) FROM stdin;
\.


--
-- Data for Name: produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produto (id, nome, descricao, status) FROM stdin;
\.


--
-- Data for Name: saida; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.saida (id, data, produto_id, preco, quantidade) FROM stdin;
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (id, nome, senha, email) FROM stdin;
1	Admin	1234	admin@gmail.com
\.


--
-- Name: entrada_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.entrada_id_seq', 1, true);


--
-- Name: entrada_quantidade_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.entrada_quantidade_seq', 1, false);


--
-- Name: estoque_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estoque_id_seq', 20, true);


--
-- Name: produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produto_id_seq', 20, true);


--
-- Name: saida_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.saida_id_seq', 1, false);


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
-- Name: estoque estoque_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estoque
    ADD CONSTRAINT estoque_pkey PRIMARY KEY (id);


--
-- Name: produto produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id);


--
-- Name: saida saida_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saida
    ADD CONSTRAINT saida_pkey PRIMARY KEY (id);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- Name: entrada entrada_produto_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrada
    ADD CONSTRAINT entrada_produto_id_fk FOREIGN KEY (produto_id) REFERENCES public.produto(id);


--
-- Name: estoque produto_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estoque
    ADD CONSTRAINT produto_id FOREIGN KEY (produto_id) REFERENCES public.produto(id);


--
-- Name: saida produto_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saida
    ADD CONSTRAINT produto_id FOREIGN KEY (produto_id) REFERENCES public.produto(id);


--
-- PostgreSQL database dump complete
--

