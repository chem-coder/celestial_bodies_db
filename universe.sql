--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: discovery_method; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.discovery_method (
    discovery_method_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text
);


ALTER TABLE public.discovery_method OWNER TO freecodecamp;

--
-- Name: discovery_method_discovery_method_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.discovery_method_discovery_method_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discovery_method_discovery_method_id_seq OWNER TO freecodecamp;

--
-- Name: discovery_method_discovery_method_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.discovery_method_discovery_method_id_seq OWNED BY public.discovery_method.discovery_method_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    star_count numeric,
    distance_ly integer,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    planet_id integer,
    has_atmosphere boolean,
    atmosphere_type text,
    orbital_period_days numeric,
    discovery_year integer,
    radius_km integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    star_id integer,
    galaxy_id integer,
    has_moons boolean,
    moon_count integer,
    mass_earth_units numeric(6,3),
    discovery_method_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    galaxy_id integer,
    has_planets boolean,
    planet_count integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: discovery_method discovery_method_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discovery_method ALTER COLUMN discovery_method_id SET DEFAULT nextval('public.discovery_method_discovery_method_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: discovery_method; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.discovery_method (discovery_method_id, name, description) FROM stdin;
1	Transit	Planet passes in front of its star, dimming the light
2	Radial Velocity	Star’s spectrum shifts due to planet’s gravitational pull
3	Direct Imaging	Planet is photographed directly
4	Microlensing	Gravity of a star+planet briefly magnifies a background star
5	Transit Timing Variations (TTV)	Irregular timing in transits reveals other planets
\.


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.galaxy (galaxy_id, name, star_count, distance_ly, description) FROM stdin;
1	Milky Way	100000000000	0	A barred spiral galaxy containing the Sun and hundreds of billions of stars
2	Andromeda (M31)	1000000000000	2540000	The nearest large spiral galaxy to the Milky Way and the dominant member of the Local Group
3	Triangulum (M33)	40000000000	2730000	A smaller spiral galaxy in the Local Group known for prominent star-forming regions
4	Large Magellanic Cloud (LMC)	30000000000	160000	A nearby irregular satellite galaxy of the Milky Way with active star formation
5	Small Magellanic Cloud (SMC)	3000000000	200000	A dwarf irregular satellite galaxy of the Milky Way located slightly farther away than the LMC
6	Whirlpool Galaxy (M51)	100000000000	31000000	A well-known spiral galaxy interacting with a smaller companion, noted for its clearly defined spiral arms and active star-forming regions
\.


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.moon (moon_id, name, planet_id, has_atmosphere, atmosphere_type, orbital_period_days, discovery_year, radius_km) FROM stdin;
1	The Moon	3	f	\N	27.32	-15000	1737
2	Phobos	4	f	\N	0.319	1877	11
3	Deimos	4	f	\N	1.263	1877	6
4	Io	5	t	very thin SO₂	1.769	1610	1821
5	Europa	5	f	\N	3.551	1610	1560
6	Ganymede	5	t	very thin O₂	7.155	1610	2634
7	Callisto	5	t	very thin CO₂	16.689	1610	2410
8	Titan	6	t	\N	15.95	1655	2575
9	Enceladus	6	t	water vapor plume	1.37	1789	252
10	Mimas	6	f	\N	0.942	1789	198
11	Rhea	6	t	very thin O₂/CO₂	4.52	1672	764
12	Tethys	6	f	\N	1.89	1684	531
13	Dione	6	f	\N	2.74	1684	562
14	Titania	7	f	\N	8.71	1787	788
15	Oberon	7	f	\N	13.46	1787	761
16	Umbriel	7	f	\N	4.14	1851	585
17	Ariel	7	f	\N	2.52	1851	579
18	Triton	8	t	thin N₂	5.877	1846	1353
19	Nereid	8	f	\N	360.14	1949	170
20	Proteus	8	f	\N	1.122	1989	210
\.


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.planet (planet_id, name, star_id, galaxy_id, has_moons, moon_count, mass_earth_units, discovery_method_id) FROM stdin;
1	Mercury	1	1	f	0	0.055	3
2	Venus	1	1	f	0	0.815	3
3	Earth	1	1	t	1	1.000	3
4	Mars	1	1	t	2	0.107	3
5	Jupiter	1	1	t	79	317.800	3
6	Saturn	1	1	t	82	95.160	3
7	Uranus	1	1	t	27	14.540	3
8	Neptune	1	1	t	14	17.150	3
9	Proxima Centauri b	4	1	f	0	1.070	2
10	Proxima Centauri c	4	1	f	0	7.000	2
12	51 Pegasi b	14	1	f	0	150.000	2
13	TRAPPIST-1e	15	1	f	0	0.692	1
14	TRAPPIST-1f	15	1	f	0	1.040	1
15	TRAPPIST-1g	15	1	f	0	1.340	1
16	WASP-12b	16	1	f	0	447.000	1
11	Kepler-22b	13	1	f	0	2.400	1
\.


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.star (star_id, name, galaxy_id, has_planets, planet_count) FROM stdin;
1	Sun	1	t	8
2	Alpha Centauri A	1	f	0
3	Alpha Centauri B	1	f	0
4	Proxima Centauri	1	t	2
5	M31-V1	2	f	0
6	M31-RV (red variable star)	2	f	0
7	M33-V19	3	f	0
8	M33-V0532	3	f	0
9	R136a1 (very massive star)	4	f	0
10	S Doradus	4	f	0
11	HD 5980	5	f	0
12	Sk 160	5	f	0
13	Kepler-22	1	t	1
14	51 Pegasi	1	t	1
15	TRAPPIST-1	1	t	7
16	WASP-12	1	t	1
\.


--
-- Name: discovery_method_discovery_method_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.discovery_method_discovery_method_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 32, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 16, true);


--
-- Name: discovery_method discovery_method_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discovery_method
    ADD CONSTRAINT discovery_method_name_key UNIQUE (name);


--
-- Name: discovery_method discovery_method_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discovery_method
    ADD CONSTRAINT discovery_method_pkey PRIMARY KEY (discovery_method_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_discovery_method_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_discovery_method_id_fkey FOREIGN KEY (discovery_method_id) REFERENCES public.discovery_method(discovery_method_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

