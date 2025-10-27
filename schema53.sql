--
-- PostgreSQL database cluster dump
--

-- Started on 2025-10-27 19:06:28

\restrict usksnWgLqPhxrt7rtpd2I5FkvE6hhV62qg217UVYf8o0mzDo83iwQozwB6tv3C3

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:LF2kxbjCz5UrwAvOqEBX2g==$9xQtj9QJtLgiLeBQUpECVhuADau+XLXl5kIzQVL+XfQ=:Fcw+x8GMWxgD2lbyfaZPFGBnitACiL4cFffbio1svrA=';

--
-- User Configurations
--








\unrestrict usksnWgLqPhxrt7rtpd2I5FkvE6hhV62qg217UVYf8o0mzDo83iwQozwB6tv3C3

--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

\restrict eTqBXRLVzvZ4PEs1QWyXMGTUBn8k7PhMc3WVtA0v6DeaYDsQSEtcRLQd17qiWnQ

-- Dumped from database version 17.6 (Debian 17.6-2.pgdg13+1)
-- Dumped by pg_dump version 17.6

-- Started on 2025-10-27 19:06:28

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

-- Completed on 2025-10-27 19:06:34

--
-- PostgreSQL database dump complete
--

\unrestrict eTqBXRLVzvZ4PEs1QWyXMGTUBn8k7PhMc3WVtA0v6DeaYDsQSEtcRLQd17qiWnQ

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

\restrict Fg3yyU0apRhk446y8etprftk3wuFoH2JuytnrHijzY0nbiXKRFE4atWkixcYzVj

-- Dumped from database version 17.6 (Debian 17.6-2.pgdg13+1)
-- Dumped by pg_dump version 17.6

-- Started on 2025-10-27 19:06:34

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

-- Completed on 2025-10-27 19:06:41

--
-- PostgreSQL database dump complete
--

\unrestrict Fg3yyU0apRhk446y8etprftk3wuFoH2JuytnrHijzY0nbiXKRFE4atWkixcYzVj

--
-- Database "railway" dump
--

