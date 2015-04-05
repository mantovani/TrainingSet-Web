--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: messages; Type: TABLE; Schema: public; Owner: mantovani; Tablespace: 
--

CREATE TABLE messages (
    id character varying(100) NOT NULL,
    text character varying(250)
);


ALTER TABLE public.messages OWNER TO mantovani;

--
-- Name: role; Type: TABLE; Schema: public; Owner: mantovani; Tablespace: 
--

CREATE TABLE role (
    id integer NOT NULL,
    role text
);


ALTER TABLE public.role OWNER TO mantovani;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: mantovani
--

CREATE SEQUENCE role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_id_seq OWNER TO mantovani;

--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mantovani
--

ALTER SEQUENCE role_id_seq OWNED BY role.id;


--
-- Name: user_role; Type: TABLE; Schema: public; Owner: mantovani; Tablespace: 
--

CREATE TABLE user_role (
    user_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.user_role OWNER TO mantovani;

--
-- Name: users; Type: TABLE; Schema: public; Owner: mantovani; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    username text,
    password text
);


ALTER TABLE public.users OWNER TO mantovani;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: mantovani
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO mantovani;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mantovani
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: vote_types; Type: TABLE; Schema: public; Owner: mantovani; Tablespace: 
--

CREATE TABLE vote_types (
    id integer NOT NULL,
    text character varying(100)
);


ALTER TABLE public.vote_types OWNER TO mantovani;

--
-- Name: vote_types_id_seq; Type: SEQUENCE; Schema: public; Owner: mantovani
--

CREATE SEQUENCE vote_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vote_types_id_seq OWNER TO mantovani;

--
-- Name: vote_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mantovani
--

ALTER SEQUENCE vote_types_id_seq OWNED BY vote_types.id;


--
-- Name: votes; Type: TABLE; Schema: public; Owner: mantovani; Tablespace: 
--

CREATE TABLE votes (
    message_id character varying(100) NOT NULL,
    user_id integer NOT NULL,
    vote_type_id integer NOT NULL,
    vote_time timestamp without time zone DEFAULT now()
);


ALTER TABLE public.votes OWNER TO mantovani;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mantovani
--

ALTER TABLE ONLY role ALTER COLUMN id SET DEFAULT nextval('role_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mantovani
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: mantovani
--

ALTER TABLE ONLY vote_types ALTER COLUMN id SET DEFAULT nextval('vote_types_id_seq'::regclass);


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: mantovani
--

COPY messages (id, text) FROM stdin;
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: mantovani
--

COPY role (id, role) FROM stdin;
1	user
\.


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mantovani
--

SELECT pg_catalog.setval('role_id_seq', 1, true);


--
-- Data for Name: user_role; Type: TABLE DATA; Schema: public; Owner: mantovani
--

COPY user_role (user_id, role_id) FROM stdin;
1	1
2	1
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: mantovani
--

COPY users (id, username, password) FROM stdin;
1	grego	grego123456
2	troiano	treoiano123456
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mantovani
--

SELECT pg_catalog.setval('users_id_seq', 2, true);


--
-- Data for Name: vote_types; Type: TABLE DATA; Schema: public; Owner: mantovani
--

COPY vote_types (id, text) FROM stdin;
1	positive
2	neutral
3	negative
4	ignore
\.


--
-- Name: vote_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mantovani
--

SELECT pg_catalog.setval('vote_types_id_seq', 1, false);


--
-- Data for Name: votes; Type: TABLE DATA; Schema: public; Owner: mantovani
--

COPY votes (message_id, user_id, vote_type_id, vote_time) FROM stdin;
\.


--
-- Name: messages_pkey; Type: CONSTRAINT; Schema: public; Owner: mantovani; Tablespace: 
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: mantovani; Tablespace: 
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: mantovani; Tablespace: 
--

ALTER TABLE ONLY user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (user_id, role_id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: mantovani; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: vote_types_pkey; Type: CONSTRAINT; Schema: public; Owner: mantovani; Tablespace: 
--

ALTER TABLE ONLY vote_types
    ADD CONSTRAINT vote_types_pkey PRIMARY KEY (id);


--
-- Name: votes_pkey; Type: CONSTRAINT; Schema: public; Owner: mantovani; Tablespace: 
--

ALTER TABLE ONLY votes
    ADD CONSTRAINT votes_pkey PRIMARY KEY (message_id, user_id, vote_type_id);


--
-- Name: user_role_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mantovani
--

ALTER TABLE ONLY user_role
    ADD CONSTRAINT user_role_role_id_fkey FOREIGN KEY (role_id) REFERENCES role(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_role_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mantovani
--

ALTER TABLE ONLY user_role
    ADD CONSTRAINT user_role_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

