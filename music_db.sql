--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

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
-- Name: album; Type: TABLE; Schema: public; Owner: ning
--

CREATE TABLE album (
    id integer NOT NULL,
    name character varying,
    release_date date,
    artist_id integer
);


ALTER TABLE album OWNER TO ning;

--
-- Name: album_id_seq; Type: SEQUENCE; Schema: public; Owner: ning
--

CREATE SEQUENCE album_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE album_id_seq OWNER TO ning;

--
-- Name: album_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ning
--

ALTER SEQUENCE album_id_seq OWNED BY album.id;


--
-- Name: artist; Type: TABLE; Schema: public; Owner: ning
--

CREATE TABLE artist (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE artist OWNER TO ning;

--
-- Name: artist_id_seq; Type: SEQUENCE; Schema: public; Owner: ning
--

CREATE SEQUENCE artist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE artist_id_seq OWNER TO ning;

--
-- Name: artist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ning
--

ALTER SEQUENCE artist_id_seq OWNED BY artist.id;


--
-- Name: discography ; Type: TABLE; Schema: public; Owner: ning
--

CREATE TABLE "discography " (
    id integer NOT NULL,
    artist_id integer,
    "album_id " integer
);


ALTER TABLE "discography " OWNER TO ning;

--
-- Name: discography _id_seq; Type: SEQUENCE; Schema: public; Owner: ning
--

CREATE SEQUENCE "discography _id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "discography _id_seq" OWNER TO ning;

--
-- Name: discography _id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ning
--

ALTER SEQUENCE "discography _id_seq" OWNED BY "discography ".id;


--
-- Name: song; Type: TABLE; Schema: public; Owner: ning
--

CREATE TABLE song (
    id integer NOT NULL,
    name character varying,
    songwriter_id integer
);


ALTER TABLE song OWNER TO ning;

--
-- Name: song_id_seq; Type: SEQUENCE; Schema: public; Owner: ning
--

CREATE SEQUENCE song_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE song_id_seq OWNER TO ning;

--
-- Name: song_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ning
--

ALTER SEQUENCE song_id_seq OWNED BY song.id;


--
-- Name: songwriter; Type: TABLE; Schema: public; Owner: ning
--

CREATE TABLE songwriter (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE songwriter OWNER TO ning;

--
-- Name: songwriter_id_seq; Type: SEQUENCE; Schema: public; Owner: ning
--

CREATE SEQUENCE songwriter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE songwriter_id_seq OWNER TO ning;

--
-- Name: songwriter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ning
--

ALTER SEQUENCE songwriter_id_seq OWNED BY songwriter.id;


--
-- Name: track; Type: TABLE; Schema: public; Owner: ning
--

CREATE TABLE track (
    id integer NOT NULL,
    song_id integer,
    album_id integer,
    duration time without time zone
);


ALTER TABLE track OWNER TO ning;

--
-- Name: track_id_seq; Type: SEQUENCE; Schema: public; Owner: ning
--

CREATE SEQUENCE track_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE track_id_seq OWNER TO ning;

--
-- Name: track_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ning
--

ALTER SEQUENCE track_id_seq OWNED BY track.id;


--
-- Name: album id; Type: DEFAULT; Schema: public; Owner: ning
--

ALTER TABLE ONLY album ALTER COLUMN id SET DEFAULT nextval('album_id_seq'::regclass);


--
-- Name: artist id; Type: DEFAULT; Schema: public; Owner: ning
--

ALTER TABLE ONLY artist ALTER COLUMN id SET DEFAULT nextval('artist_id_seq'::regclass);


--
-- Name: discography  id; Type: DEFAULT; Schema: public; Owner: ning
--

ALTER TABLE ONLY "discography " ALTER COLUMN id SET DEFAULT nextval('"discography _id_seq"'::regclass);


--
-- Name: song id; Type: DEFAULT; Schema: public; Owner: ning
--

ALTER TABLE ONLY song ALTER COLUMN id SET DEFAULT nextval('song_id_seq'::regclass);


--
-- Name: songwriter id; Type: DEFAULT; Schema: public; Owner: ning
--

ALTER TABLE ONLY songwriter ALTER COLUMN id SET DEFAULT nextval('songwriter_id_seq'::regclass);


--
-- Name: track id; Type: DEFAULT; Schema: public; Owner: ning
--

ALTER TABLE ONLY track ALTER COLUMN id SET DEFAULT nextval('track_id_seq'::regclass);


--
-- Data for Name: album; Type: TABLE DATA; Schema: public; Owner: ning
--

COPY album (id, name, release_date, artist_id) FROM stdin;
6	Spice	1996-07-08	5
3	Jolene	1973-02-27	2
4	Thriller	1982-11-30	3
5	From Elvis in Memphis	1969-06-17	4
1	Whitney Houston	1985-02-14	1
2	The Bodyguard	1992-11-17	1
8	bad romance 	\N	6
\.


--
-- Name: album_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ning
--

SELECT pg_catalog.setval('album_id_seq', 8, true);


--
-- Data for Name: artist; Type: TABLE DATA; Schema: public; Owner: ning
--

COPY artist (id, name) FROM stdin;
4	Elvis Presley
5	Spice Girls
2	Dolly Parton
1	Whitney Houston
3	Michael Jackson
6	lady gaga 
\.


--
-- Name: artist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ning
--

SELECT pg_catalog.setval('artist_id_seq', 6, true);


--
-- Data for Name: discography ; Type: TABLE DATA; Schema: public; Owner: ning
--

COPY "discography " (id, artist_id, "album_id ") FROM stdin;
1	1	1
2	1	2
3	2	3
4	3	4
5	4	5
6	5	6
7	6	8
\.


--
-- Name: discography _id_seq; Type: SEQUENCE SET; Schema: public; Owner: ning
--

SELECT pg_catalog.setval('"discography _id_seq"', 8, true);


--
-- Data for Name: song; Type: TABLE DATA; Schema: public; Owner: ning
--

COPY song (id, name, songwriter_id) FROM stdin;
1	I will always love you 	2
2	thriller 	1
3	all shook up 	3
5	wannabe 	5
7	bad romance 	2
6	I just wanna dance with somebody 	2
4	I'm movin on	3
\.


--
-- Name: song_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ning
--

SELECT pg_catalog.setval('song_id_seq', 8, true);


--
-- Data for Name: songwriter; Type: TABLE DATA; Schema: public; Owner: ning
--

COPY songwriter (id, name) FROM stdin;
1	Rod Temperton 
2	Dolly Parton 
3	Otis Blackwell
4	Hank Snow 
5	Richard Stannard 
\.


--
-- Name: songwriter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ning
--

SELECT pg_catalog.setval('songwriter_id_seq', 5, true);


--
-- Data for Name: track; Type: TABLE DATA; Schema: public; Owner: ning
--

COPY track (id, song_id, album_id, duration) FROM stdin;
3	1	2	00:04:31
2	1	3	00:02:53
4	3	\N	00:01:57
5	4	5	00:02:43
6	5	6	00:02:52
7	6	1	00:03:05
1	2	4	00:05:57
\.


--
-- Name: track_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ning
--

SELECT pg_catalog.setval('track_id_seq', 7, true);


--
-- Name: album album_pkey; Type: CONSTRAINT; Schema: public; Owner: ning
--

ALTER TABLE ONLY album
    ADD CONSTRAINT album_pkey PRIMARY KEY (id);


--
-- Name: artist artist_pkey; Type: CONSTRAINT; Schema: public; Owner: ning
--

ALTER TABLE ONLY artist
    ADD CONSTRAINT artist_pkey PRIMARY KEY (id);


--
-- Name: discography  discography _pkey; Type: CONSTRAINT; Schema: public; Owner: ning
--

ALTER TABLE ONLY "discography "
    ADD CONSTRAINT "discography _pkey" PRIMARY KEY (id);


--
-- Name: song song_pkey; Type: CONSTRAINT; Schema: public; Owner: ning
--

ALTER TABLE ONLY song
    ADD CONSTRAINT song_pkey PRIMARY KEY (id);


--
-- Name: songwriter songwriter_pkey; Type: CONSTRAINT; Schema: public; Owner: ning
--

ALTER TABLE ONLY songwriter
    ADD CONSTRAINT songwriter_pkey PRIMARY KEY (id);


--
-- Name: track track_pkey; Type: CONSTRAINT; Schema: public; Owner: ning
--

ALTER TABLE ONLY track
    ADD CONSTRAINT track_pkey PRIMARY KEY (id);


--
-- Name: album album_artist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ning
--

ALTER TABLE ONLY album
    ADD CONSTRAINT album_artist_id_fkey FOREIGN KEY (artist_id) REFERENCES artist(id);


--
-- Name: discography  discography _album_id _fkey; Type: FK CONSTRAINT; Schema: public; Owner: ning
--

ALTER TABLE ONLY "discography "
    ADD CONSTRAINT "discography _album_id _fkey" FOREIGN KEY ("album_id ") REFERENCES album(id);


--
-- Name: discography  discography _artist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ning
--

ALTER TABLE ONLY "discography "
    ADD CONSTRAINT "discography _artist_id_fkey" FOREIGN KEY (artist_id) REFERENCES artist(id);


--
-- Name: song song_songwriter_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ning
--

ALTER TABLE ONLY song
    ADD CONSTRAINT song_songwriter_id_fkey FOREIGN KEY (songwriter_id) REFERENCES songwriter(id);


--
-- Name: track track_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ning
--

ALTER TABLE ONLY track
    ADD CONSTRAINT track_album_id_fkey FOREIGN KEY (album_id) REFERENCES album(id);


--
-- Name: track track_song_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ning
--

ALTER TABLE ONLY track
    ADD CONSTRAINT track_song_id_fkey FOREIGN KEY (song_id) REFERENCES song(id);


--
-- PostgreSQL database dump complete
--

