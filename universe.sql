--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    distance_from_earth numeric(4,1) NOT NULL,
    age_in_million_of_years integer NOT NULL,
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
    name character varying(30),
    distance_from_earth numeric(4,1) NOT NULL,
    age_in_million_of_years integer NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    planet_id integer NOT NULL
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
-- Name: observation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.observation (
    observation_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    release_date date NOT NULL
);


ALTER TABLE public.observation OWNER TO freecodecamp;

--
-- Name: observation_observation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.observation_observation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.observation_observation_id_seq OWNER TO freecodecamp;

--
-- Name: observation_observation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.observation_observation_id_seq OWNED BY public.observation.observation_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    distance_from_earth numeric(4,1) NOT NULL,
    age_in_million_of_years integer NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    star_id integer
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
    name character varying(30),
    distance_from_earth numeric(4,1) NOT NULL,
    age_in_million_of_years integer,
    description text,
    galaxy_id integer
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: observation observation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observation ALTER COLUMN observation_id SET DEFAULT nextval('public.observation_observation_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 2.5, 2300, 'The closest spiral galaxy to the Milky Way.');
INSERT INTO public.galaxy VALUES (2, 'Whirlpool', 23.5, 300, 'A grand design spiral galaxy in the constellation Canes Venatici.');
INSERT INTO public.galaxy VALUES (3, 'Centaurus A', 13.7, 12000, 'A peculiar galaxy with a bright radio source at its center.');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 28.2, 900, 'A galaxy with a prominent dust lane resembling a sombrero.');
INSERT INTO public.galaxy VALUES (5, 'Pinwheel', 21.0, 460, 'A grand design spiral galaxy in the constellation Ursa Major.');
INSERT INTO public.galaxy VALUES (6, 'Tadpole', 420.0, 8000, 'A distorted galaxy undergoing tidal disruption by a neighboring galaxy.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon 1', 38.0, 4, 'Moon 1 is Earths natural satellite. It has a rocky surface covered in craters, mountains, and valleys. It is the fifth largest moon in the solar system.', false, true, 72);
INSERT INTO public.moon VALUES (2, 'Moon 2', 12.0, 4, 'Moon 2 is a small, irregularly shaped moon with a heavily cratered surface. It orbits its host planet every 4.5 days.', false, false, 73);
INSERT INTO public.moon VALUES (3, 'Moon 3', 19.0, 4, 'Moon 3 is a large, icy moon with a heavily cratered surface. It has a thin atmosphere and a subsurface ocean that may harbor life.', true, true, 74);
INSERT INTO public.moon VALUES (4, 'Moon 4', 38.0, 4, 'Moon 4 is a small, rocky moon with a heavily cratered surface. It has no atmosphere and no magnetic field.', false, true, 75);
INSERT INTO public.moon VALUES (5, 'Moon 5', 12.0, 4, 'Moon 5 is a small, rocky moon with a heavily cratered surface. It has no atmosphere and no magnetic field.', false, true, 76);
INSERT INTO public.moon VALUES (6, 'Moon 6', 23.0, 4, 'Moon 6 is a large, icy moon with a heavily cratered surface. It orbits its host planet every 16.7 days.', false, false, 77);
INSERT INTO public.moon VALUES (7, 'Moon 7', 12.0, 4, 'Moon 7 is a small, rocky moon with a heavily cratered surface. It has no atmosphere and no magnetic field.', false, true, 78);
INSERT INTO public.moon VALUES (8, 'Moon 8', 14.0, 4, 'Moon 8 is a medium-sized moon with a heavily cratered surface. It has a thin atmosphere and may have a subsurface ocean.', true, true, 79);
INSERT INTO public.moon VALUES (9, 'Moon 9', 20.0, 4, 'Moon 9 is a large, icy moon with a heavily cratered surface. It has a thick atmosphere of nitrogen and methane.', false, false, 80);
INSERT INTO public.moon VALUES (10, 'Moon 10', 38.0, 4, 'Moon 10 is a small, rocky moon with a heavily cratered surface. It has no atmosphere and no magnetic field.', false, true, 81);
INSERT INTO public.moon VALUES (11, 'Moon 11', 12.0, 4, 'Moon 11 is a small, rocky moon with a heavily cratered surface. It has no atmosphere and no magnetic field.', false, true, 82);
INSERT INTO public.moon VALUES (12, 'Moon 12', 18.0, 4, 'Moon 12 is a medium-sized moon with a heavily cratered surface. It has no atmosphere and no magnetic field.', false, true, 83);
INSERT INTO public.moon VALUES (13, 'Moon 13', 23.0, 4, 'Moon 13 is a small, rocky moon that orbits very close to its host planet. It has a heavily cratered surface.', false, true, 72);
INSERT INTO public.moon VALUES (14, 'Moon 14', 98.0, 4, 'Moon 14 is a large, icy moon with a heavily cratered surface. It has a tenuous atmosphere of carbon dioxide and nitrogen.', false, false, 73);
INSERT INTO public.moon VALUES (15, 'Moon 15', 17.0, 4, 'Moon 15 is a medium-sized moon with a heavily cratered surface. It has no atmosphere and no magnetic field.', false, true, 74);
INSERT INTO public.moon VALUES (16, 'Moon 16', 12.0, 4, 'Moon 16 is a small, rocky moon with a heavily cratered surface. It has no atmosphere and no magnetic field.', false, true, 75);
INSERT INTO public.moon VALUES (17, 'Moon 17', 14.0, 4, 'Moon 17 is a medium-sized moon with a heavily cratered surface. It has no atmosphere and no magnetic field.', false, true, 76);
INSERT INTO public.moon VALUES (18, 'Moon 18', 44.0, 4, 'Moon 18 is a large, icy moon with a heavily cratered surface. It has a tenuous atmosphere of nitrogen and methane.', false, false, 77);
INSERT INTO public.moon VALUES (19, 'Moon 19', 15.0, 4, 'Moon 19 is a medium-sized moon with a heavily cratered surface. It has no atmosphere and no magnetic field.', false, true, 78);
INSERT INTO public.moon VALUES (20, 'Moon 20', 12.0, 4, 'Moon 20 is a small, rocky moon with a heavily cratered surface. It has no atmosphere and no magnetic field.', false, true, 79);


--
-- Data for Name: observation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.observation VALUES (1, 'Crab Nebula', 'A supernova remnant located in the constellation Taurus.', '1952-06-01');
INSERT INTO public.observation VALUES (2, 'Orion Nebula', 'A diffuse nebula located in the constellation Orion.', '2010-03-12');
INSERT INTO public.observation VALUES (3, 'M31', 'The Andromeda Galaxy, a spiral galaxy located 2.5 million light-years away.', '1999-11-05');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (72, 'Planet 1', 10.0, 400, 'Planet 1 is a gas giant with a highly elliptical orbit. It has a complex ring system and dozens of moons.', false, true, 3);
INSERT INTO public.planet VALUES (73, 'Planet 2', 25.0, 1200, 'Planet 2 is a rocky, terrestrial planet with a thin atmosphere. It has a large, mountainous continent and a global ocean teeming with life.', true, true, 3);
INSERT INTO public.planet VALUES (74, 'Planet 3', 50.0, 3600, 'Planet 3 is a super-Earth with a thick, toxic atmosphere. It has a deep ocean of liquid metal and a highly active tectonic system.', false, true, 4);
INSERT INTO public.planet VALUES (75, 'Planet 4', 100.0, 7800, 'Planet 4 is a barren, airless world that was once a gas giant. It was stripped of its outer layers by a close encounter with a neighboring star.', false, true, 3);
INSERT INTO public.planet VALUES (76, 'Planet 5', 150.0, 12000, 'Planet 5 is an ice giant with a faint ring system. It has a large, moonless ocean that may harbor exotic forms of life.', true, true, 3);
INSERT INTO public.planet VALUES (77, 'Planet 6', 200.0, 25, 'Planet 6 is a young gas giant that is still in the process of formation. It has a massive protoplanetary disk and several newly-formed moons.', false, true, 4);
INSERT INTO public.planet VALUES (78, 'Planet 7', 300.0, 500, 'Planet 7 is a rocky, desert planet with a thin atmosphere. It has a vast network of deep canyons and towering mesas.', false, true, 5);
INSERT INTO public.planet VALUES (79, 'Planet 8', 400.0, 2000, 'Planet 8 is a habitable, Earth-like world with a lush, diverse biosphere. It has a single large moon and a prominent equatorial mountain range.', true, true, 5);
INSERT INTO public.planet VALUES (80, 'Planet 9', 500.0, 4500, 'Planet 9 is a gas giant with a complex system of moons and rings. It has a powerful magnetic field and a rapidly spinning core.', false, true, 6);
INSERT INTO public.planet VALUES (81, 'Planet 10', 600.0, 9000, 'Planet 10 is a super-Jupiter with a turbulent, stormy atmosphere. It has a large, rocky moon that may harbor primitive life.', true, true, 6);
INSERT INTO public.planet VALUES (82, 'Planet 11', 700.0, 15000, 'Planet 11 is a rocky, barren world that was once a gas giant. It was stripped of its outer layers by a cataclysmic collision with another planet.', false, true, 7);
INSERT INTO public.planet VALUES (83, 'Planet 12', 800.0, 3000, 'Planet 12 is a hot, molten world that orbits very close to its star.', false, true, 8);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (3, 'M31_V1', 2.5, 350, 'M31_V1 is a blue supergiant star in the Andromeda galaxy, located in the central bulge of the galaxy.', 1);
INSERT INTO public.star VALUES (4, 'NGC 5195 X-1', 23.0, 300, 'NGC 5195 X-1 is a bright X-ray source in the Whirlpool galaxy, likely a black hole with a mass around 10 times that of the Sun.', 2);
INSERT INTO public.star VALUES (5, 'AM 1316-241', 13.0, 12000, 'AM 1316-241 is a luminous X-ray source in the Centaurus A galaxy, believed to be a binary system consisting of a neutron star or black hole and a companion star.', 3);
INSERT INTO public.star VALUES (6, 'NGC 4594 ULX-1', 28.0, 900, 'NGC 4594 ULX-1 is an ultraluminous X-ray source in the Sombrero galaxy, believed to be a black hole with a mass around 20-30 times that of the Sun.', 4);
INSERT INTO public.star VALUES (7, 'M101_V1', 21.0, 200, 'M101_V1 is a blue supergiant star in the Pinwheel galaxy, located in the outer disk of the galaxy.', 5);
INSERT INTO public.star VALUES (8, 'UGC 10214 V1', 420.0, 8000, 'UGC 10214 V1 is a bright X-ray source in the Tadpole galaxy, likely a binary system consisting of a neutron star or black hole and a companion star.', 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: observation_observation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.observation_observation_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 83, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: observation name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observation
    ADD CONSTRAINT name_unique UNIQUE (name);


--
-- Name: observation observation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observation
    ADD CONSTRAINT observation_pkey PRIMARY KEY (observation_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy UNIQUE (galaxy_id);


--
-- Name: moon unique_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon UNIQUE (moon_id);


--
-- Name: planet unique_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet UNIQUE (planet_id);


--
-- Name: star unique_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

