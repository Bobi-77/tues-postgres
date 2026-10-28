--
-- PostgreSQL database dump
--

\restrict cOZtILPfszrrfjkcs5lA5kyfKOWlMA0KGLQ42WwVsw4YYOnaTIbOKrg6JVliqmh

-- Dumped from database version 17.11 (Debian 17.11-1.pgdg13+2)
-- Dumped by pg_dump version 17.11

-- Started on 2026-10-27 23:11:45 UTC

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 218 (class 1259 OID 24578)
-- Name: artists; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.artists (
    artist_id integer NOT NULL,
    name character varying(100) NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 24577)
-- Name: artists_artist_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.artists_artist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3465 (class 0 OID 0)
-- Dependencies: 217
-- Name: artists_artist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.artists_artist_id_seq OWNED BY public.artists.artist_id;


--
-- TOC entry 223 (class 1259 OID 24607)
-- Name: playlist_songs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.playlist_songs (
    playlist_id integer NOT NULL,
    song_id integer NOT NULL,
    "position" integer NOT NULL,
    CONSTRAINT playlist_songs_position_check CHECK (("position" > 0))
);


--
-- TOC entry 222 (class 1259 OID 24601)
-- Name: playlists; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.playlists (
    playlist_id integer NOT NULL,
    name character varying(100) NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 24600)
-- Name: playlists_playlist_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.playlists_playlist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3466 (class 0 OID 0)
-- Dependencies: 221
-- Name: playlists_playlist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.playlists_playlist_id_seq OWNED BY public.playlists.playlist_id;


--
-- TOC entry 220 (class 1259 OID 24587)
-- Name: songs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.songs (
    song_id integer NOT NULL,
    title character varying(150) NOT NULL,
    artist_id integer NOT NULL,
    duration_seconds integer NOT NULL,
    CONSTRAINT songs_duration_seconds_check CHECK ((duration_seconds > 0))
);


--
-- TOC entry 219 (class 1259 OID 24586)
-- Name: songs_song_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.songs_song_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3467 (class 0 OID 0)
-- Dependencies: 219
-- Name: songs_song_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.songs_song_id_seq OWNED BY public.songs.song_id;


--
-- TOC entry 3288 (class 2604 OID 24581)
-- Name: artists artist_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artists ALTER COLUMN artist_id SET DEFAULT nextval('public.artists_artist_id_seq'::regclass);


--
-- TOC entry 3290 (class 2604 OID 24604)
-- Name: playlists playlist_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.playlists ALTER COLUMN playlist_id SET DEFAULT nextval('public.playlists_playlist_id_seq'::regclass);


--
-- TOC entry 3289 (class 2604 OID 24590)
-- Name: songs song_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.songs ALTER COLUMN song_id SET DEFAULT nextval('public.songs_song_id_seq'::regclass);


--
-- TOC entry 3454 (class 0 OID 24578)
-- Dependencies: 218
-- Data for Name: artists; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.artists (artist_id, name) FROM stdin;
1	Queen
2	Adele
3	The Weeknd
4	Coldplay
5	Lionel Richie
\.


--
-- TOC entry 3459 (class 0 OID 24607)
-- Dependencies: 223
-- Data for Name: playlist_songs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.playlist_songs (playlist_id, song_id, "position") FROM stdin;
1	8	3
1	6	1
1	5	5
1	2	2
1	1	4
2	10	4
2	9	1
2	8	3
2	4	2
\.


--
-- TOC entry 3458 (class 0 OID 24601)
-- Dependencies: 222
-- Data for Name: playlists; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.playlists (playlist_id, name) FROM stdin;
1	Road Trip
2	Chill Evening
\.


--
-- TOC entry 3456 (class 0 OID 24587)
-- Dependencies: 220
-- Data for Name: songs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.songs (song_id, title, artist_id, duration_seconds) FROM stdin;
1	Bohemian Rhapsody	1	354
2	Don't Stop Me Now	1	209
3	Another One Bites the Dust	1	215
4	Hello	2	295
5	Rolling in the Deep	2	228
6	Blinding Lights	3	200
7	Save Your Tears	3	215
8	Viva la Vida	4	242
9	Yellow	4	269
10	Hello	5	251
\.


--
-- TOC entry 3468 (class 0 OID 0)
-- Dependencies: 217
-- Name: artists_artist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.artists_artist_id_seq', 5, true);


--
-- TOC entry 3469 (class 0 OID 0)
-- Dependencies: 221
-- Name: playlists_playlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.playlists_playlist_id_seq', 2, true);


--
-- TOC entry 3470 (class 0 OID 0)
-- Dependencies: 219
-- Name: songs_song_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.songs_song_id_seq', 10, true);


--
-- TOC entry 3294 (class 2606 OID 24585)
-- Name: artists artists_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_name_key UNIQUE (name);


--
-- TOC entry 3296 (class 2606 OID 24583)
-- Name: artists artists_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (artist_id);


--
-- TOC entry 3302 (class 2606 OID 24612)
-- Name: playlist_songs playlist_songs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.playlist_songs
    ADD CONSTRAINT playlist_songs_pkey PRIMARY KEY (playlist_id, song_id);


--
-- TOC entry 3304 (class 2606 OID 24614)
-- Name: playlist_songs playlist_songs_playlist_id_position_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.playlist_songs
    ADD CONSTRAINT playlist_songs_playlist_id_position_key UNIQUE (playlist_id, "position");


--
-- TOC entry 3300 (class 2606 OID 24606)
-- Name: playlists playlists_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.playlists
    ADD CONSTRAINT playlists_pkey PRIMARY KEY (playlist_id);


--
-- TOC entry 3298 (class 2606 OID 24593)
-- Name: songs songs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_pkey PRIMARY KEY (song_id);


--
-- TOC entry 3306 (class 2606 OID 24615)
-- Name: playlist_songs playlist_songs_playlist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.playlist_songs
    ADD CONSTRAINT playlist_songs_playlist_id_fkey FOREIGN KEY (playlist_id) REFERENCES public.playlists(playlist_id);


--
-- TOC entry 3307 (class 2606 OID 24620)
-- Name: playlist_songs playlist_songs_song_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.playlist_songs
    ADD CONSTRAINT playlist_songs_song_id_fkey FOREIGN KEY (song_id) REFERENCES public.songs(song_id);


--
-- TOC entry 3305 (class 2606 OID 24594)
-- Name: songs songs_artist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_artist_id_fkey FOREIGN KEY (artist_id) REFERENCES public.artists(artist_id);


-- Completed on 2026-10-27 23:11:45 UTC

--
-- PostgreSQL database dump complete
--

\unrestrict cOZtILPfszrrfjkcs5lA5kyfKOWlMA0KGLQ42WwVsw4YYOnaTIbOKrg6JVliqmh

