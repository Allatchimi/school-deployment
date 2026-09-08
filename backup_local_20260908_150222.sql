--
-- PostgreSQL database cluster dump
--

\restrict Myf3WGCqaKaSsIzTWxefYeTKb6LBiw62QTtTOEa1lyyLINaU1LLZcQStTGeSPiA

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:I45dn9CIhXtCDAzldsDgNA==$ihtX9Lg2II3Qt6ujA1AxrzR2aKxUzYd+3VH/sAa+iyA=:g2UCkGfutD3QW1+T9EzqmuG1TASgoUxrAyzy2s2FbR4=';

--
-- User Configurations
--








\unrestrict Myf3WGCqaKaSsIzTWxefYeTKb6LBiw62QTtTOEa1lyyLINaU1LLZcQStTGeSPiA

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

\restrict HiUKw3Add2GCweaPkacKrtXgFcdwFquvmIGsdZNXCfhjmykTkWO8V58tfNttirX

-- Dumped from database version 17.11
-- Dumped by pg_dump version 17.11

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

--
-- PostgreSQL database dump complete
--

\unrestrict HiUKw3Add2GCweaPkacKrtXgFcdwFquvmIGsdZNXCfhjmykTkWO8V58tfNttirX

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

\restrict 726YYAdax8iYY0qZORqF5k5RJpfzPpKlJStZOFHgPS9X2SyThw6pJjUb5EAPYfG

-- Dumped from database version 17.11
-- Dumped by pg_dump version 17.11

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

--
-- PostgreSQL database dump complete
--

\unrestrict 726YYAdax8iYY0qZORqF5k5RJpfzPpKlJStZOFHgPS9X2SyThw6pJjUb5EAPYfG

--
-- Database "sBJRxa_YKW" dump
--

--
-- PostgreSQL database dump
--

\restrict JkIWo40hVCA2YeceEUBerbJ3Q4RY9EkGVeNdeOnEwBb0IbLaLqj2dviJq2HnXG3

-- Dumped from database version 17.11
-- Dumped by pg_dump version 17.11

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

--
-- Name: sBJRxa_YKW; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "sBJRxa_YKW" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE "sBJRxa_YKW" OWNER TO postgres;

\unrestrict JkIWo40hVCA2YeceEUBerbJ3Q4RY9EkGVeNdeOnEwBb0IbLaLqj2dviJq2HnXG3
\connect "sBJRxa_YKW"
\restrict JkIWo40hVCA2YeceEUBerbJ3Q4RY9EkGVeNdeOnEwBb0IbLaLqj2dviJq2HnXG3

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
-- Name: communications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.communications (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    role_id bigint,
    subject text,
    message text
);


ALTER TABLE public.communications OWNER TO postgres;

--
-- Name: communications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.communications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.communications_id_seq OWNER TO postgres;

--
-- Name: communications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.communications_id_seq OWNED BY public.communications.id;


--
-- Name: contacts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacts (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    subject text,
    email text,
    message text
);


ALTER TABLE public.contacts OWNER TO postgres;

--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contacts_id_seq OWNER TO postgres;

--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contacts_id_seq OWNED BY public.contacts.id;


--
-- Name: course_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course_comments (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    course_id bigint,
    user_id bigint,
    message text,
    rate bigint,
    is_deleted boolean
);


ALTER TABLE public.course_comments OWNER TO postgres;

--
-- Name: course_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.course_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.course_comments_id_seq OWNER TO postgres;

--
-- Name: course_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.course_comments_id_seq OWNED BY public.course_comments.id;


--
-- Name: course_documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course_documents (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    course_id bigint,
    title text,
    description text,
    url text
);


ALTER TABLE public.course_documents OWNER TO postgres;

--
-- Name: course_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.course_documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.course_documents_id_seq OWNER TO postgres;

--
-- Name: course_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.course_documents_id_seq OWNED BY public.course_documents.id;


--
-- Name: course_videos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course_videos (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    course_id bigint,
    title text,
    description text,
    url text
);


ALTER TABLE public.course_videos OWNER TO postgres;

--
-- Name: course_videos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.course_videos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.course_videos_id_seq OWNER TO postgres;

--
-- Name: course_videos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.course_videos_id_seq OWNED BY public.course_videos.id;


--
-- Name: courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courses (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    year_id bigint,
    class_subject_id bigint,
    unit_id bigint,
    title text,
    description text,
    content text
);


ALTER TABLE public.courses OWNER TO postgres;

--
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.courses_id_seq OWNER TO postgres;

--
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;


--
-- Name: directors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directors (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    user_id bigint,
    uid text
);


ALTER TABLE public.directors OWNER TO postgres;

--
-- Name: directors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directors_id_seq OWNER TO postgres;

--
-- Name: directors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directors_id_seq OWNED BY public.directors.id;


--
-- Name: exam_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exam_types (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    name text,
    description text
);


ALTER TABLE public.exam_types OWNER TO postgres;

--
-- Name: exam_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exam_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.exam_types_id_seq OWNER TO postgres;

--
-- Name: exam_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exam_types_id_seq OWNED BY public.exam_types.id;


--
-- Name: exams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exams (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    year_id bigint,
    class_subject_id bigint,
    sequence_id bigint,
    unit_id bigint,
    type_id bigint,
    status text,
    notation numeric,
    percentage bigint,
    description text,
    location_type text,
    location_details text,
    requirements text,
    allowed_items text,
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    is_retry boolean,
    retry_count bigint
);


ALTER TABLE public.exams OWNER TO postgres;

--
-- Name: exams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.exams_id_seq OWNER TO postgres;

--
-- Name: exams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exams_id_seq OWNED BY public.exams.id;


--
-- Name: highschool_class_subjects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.highschool_class_subjects (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    class_id bigint,
    subject_id bigint,
    coefficient bigint DEFAULT 1,
    program text,
    requirements text,
    is_valid boolean DEFAULT true,
    invalid_date timestamp with time zone
);


ALTER TABLE public.highschool_class_subjects OWNER TO postgres;

--
-- Name: highschool_class_subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.highschool_class_subjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.highschool_class_subjects_id_seq OWNER TO postgres;

--
-- Name: highschool_class_subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.highschool_class_subjects_id_seq OWNED BY public.highschool_class_subjects.id;


--
-- Name: highschool_classes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.highschool_classes (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    specialty_id bigint,
    name text,
    description text,
    fees bigint,
    program text,
    requirements text,
    is_valid boolean,
    invalid_date timestamp with time zone
);


ALTER TABLE public.highschool_classes OWNER TO postgres;

--
-- Name: highschool_classes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.highschool_classes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.highschool_classes_id_seq OWNER TO postgres;

--
-- Name: highschool_classes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.highschool_classes_id_seq OWNED BY public.highschool_classes.id;


--
-- Name: highschool_quarters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.highschool_quarters (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    name text,
    description text
);


ALTER TABLE public.highschool_quarters OWNER TO postgres;

--
-- Name: highschool_quarters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.highschool_quarters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.highschool_quarters_id_seq OWNER TO postgres;

--
-- Name: highschool_quarters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.highschool_quarters_id_seq OWNED BY public.highschool_quarters.id;


--
-- Name: highschool_sections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.highschool_sections (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    name text,
    description text
);


ALTER TABLE public.highschool_sections OWNER TO postgres;

--
-- Name: highschool_sections_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.highschool_sections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.highschool_sections_id_seq OWNER TO postgres;

--
-- Name: highschool_sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.highschool_sections_id_seq OWNED BY public.highschool_sections.id;


--
-- Name: highschool_sequences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.highschool_sequences (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    quarter_id bigint,
    name text,
    description text
);


ALTER TABLE public.highschool_sequences OWNER TO postgres;

--
-- Name: highschool_sequences_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.highschool_sequences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.highschool_sequences_id_seq OWNER TO postgres;

--
-- Name: highschool_sequences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.highschool_sequences_id_seq OWNED BY public.highschool_sequences.id;


--
-- Name: highschool_specialties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.highschool_specialties (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    section_id bigint,
    name text,
    description text
);


ALTER TABLE public.highschool_specialties OWNER TO postgres;

--
-- Name: highschool_specialties_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.highschool_specialties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.highschool_specialties_id_seq OWNER TO postgres;

--
-- Name: highschool_specialties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.highschool_specialties_id_seq OWNED BY public.highschool_specialties.id;


--
-- Name: highschool_subjects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.highschool_subjects (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    name text,
    description text
);


ALTER TABLE public.highschool_subjects OWNER TO postgres;

--
-- Name: highschool_subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.highschool_subjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.highschool_subjects_id_seq OWNER TO postgres;

--
-- Name: highschool_subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.highschool_subjects_id_seq OWNED BY public.highschool_subjects.id;


--
-- Name: managers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.managers (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    user_id bigint,
    uid text
);


ALTER TABLE public.managers OWNER TO postgres;

--
-- Name: managers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.managers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.managers_id_seq OWNER TO postgres;

--
-- Name: managers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.managers_id_seq OWNED BY public.managers.id;


--
-- Name: meeting_rooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.meeting_rooms (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    class_subject_id bigint,
    unit_id bigint,
    api_room_id text
);


ALTER TABLE public.meeting_rooms OWNER TO postgres;

--
-- Name: meeting_rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.meeting_rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.meeting_rooms_id_seq OWNER TO postgres;

--
-- Name: meeting_rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.meeting_rooms_id_seq OWNED BY public.meeting_rooms.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    user_id bigint,
    title text,
    message text,
    seen boolean,
    seen_at timestamp with time zone
);


ALTER TABLE public.notifications OWNER TO postgres;

--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notifications_id_seq OWNER TO postgres;

--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;


--
-- Name: parent_students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.parent_students (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    parent_id bigint,
    student_id bigint
);


ALTER TABLE public.parent_students OWNER TO postgres;

--
-- Name: parent_students_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.parent_students_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.parent_students_id_seq OWNER TO postgres;

--
-- Name: parent_students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.parent_students_id_seq OWNED BY public.parent_students.id;


--
-- Name: parents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.parents (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    user_id bigint
);


ALTER TABLE public.parents OWNER TO postgres;

--
-- Name: parents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.parents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.parents_id_seq OWNER TO postgres;

--
-- Name: parents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.parents_id_seq OWNED BY public.parents.id;


--
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    student_enroll_id bigint,
    amount numeric,
    currency text,
    date timestamp with time zone,
    method text,
    status text,
    message text
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payments_id_seq OWNER TO postgres;

--
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;


--
-- Name: permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permissions (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    role_id bigint,
    table_name text,
    "create" boolean,
    read boolean,
    update boolean,
    delete boolean
);


ALTER TABLE public.permissions OWNER TO postgres;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.permissions_id_seq OWNER TO postgres;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- Name: quiz_answers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quiz_answers (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    student_id bigint,
    quiz_question_id bigint,
    quiz_question_option_id bigint
);


ALTER TABLE public.quiz_answers OWNER TO postgres;

--
-- Name: quiz_answers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.quiz_answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.quiz_answers_id_seq OWNER TO postgres;

--
-- Name: quiz_answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.quiz_answers_id_seq OWNED BY public.quiz_answers.id;


--
-- Name: quiz_question_options; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quiz_question_options (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    quiz_question_id bigint,
    title text,
    description text
);


ALTER TABLE public.quiz_question_options OWNER TO postgres;

--
-- Name: quiz_question_options_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.quiz_question_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.quiz_question_options_id_seq OWNER TO postgres;

--
-- Name: quiz_question_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.quiz_question_options_id_seq OWNED BY public.quiz_question_options.id;


--
-- Name: quiz_questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quiz_questions (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    quiz_id bigint,
    solution_id bigint,
    title text,
    description text
);


ALTER TABLE public.quiz_questions OWNER TO postgres;

--
-- Name: quiz_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.quiz_questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.quiz_questions_id_seq OWNER TO postgres;

--
-- Name: quiz_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.quiz_questions_id_seq OWNED BY public.quiz_questions.id;


--
-- Name: quizzes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quizzes (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    year_id bigint,
    class_subject_id bigint,
    unit_id bigint,
    title text,
    description text,
    status text
);


ALTER TABLE public.quizzes OWNER TO postgres;

--
-- Name: quizzes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.quizzes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.quizzes_id_seq OWNER TO postgres;

--
-- Name: quizzes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.quizzes_id_seq OWNED BY public.quizzes.id;


--
-- Name: report_averages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.report_averages (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    year_id bigint,
    class_id bigint,
    level_domain_id bigint,
    student_id bigint,
    period_type text,
    period_name text,
    score numeric,
    notation numeric,
    grade_name text,
    grade_description text,
    rank bigint,
    is_successful boolean,
    total_credit_coefficient bigint,
    validated_credit_coefficient bigint
);


ALTER TABLE public.report_averages OWNER TO postgres;

--
-- Name: report_averages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.report_averages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.report_averages_id_seq OWNER TO postgres;

--
-- Name: report_averages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.report_averages_id_seq OWNED BY public.report_averages.id;


--
-- Name: report_configs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.report_configs (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    report_grade_to_fail_id bigint,
    notation_average numeric,
    notation_report numeric,
    minimum_required_score_to_promote numeric,
    only_failed_exams boolean
);


ALTER TABLE public.report_configs OWNER TO postgres;

--
-- Name: report_configs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.report_configs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.report_configs_id_seq OWNER TO postgres;

--
-- Name: report_configs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.report_configs_id_seq OWNED BY public.report_configs.id;


--
-- Name: report_correspondences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.report_correspondences (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    minimum numeric,
    maximum numeric,
    include_minimum boolean,
    include_maximum boolean,
    new_score numeric
);


ALTER TABLE public.report_correspondences OWNER TO postgres;

--
-- Name: report_correspondences_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.report_correspondences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.report_correspondences_id_seq OWNER TO postgres;

--
-- Name: report_correspondences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.report_correspondences_id_seq OWNED BY public.report_correspondences.id;


--
-- Name: report_entries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.report_entries (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    year_id bigint,
    class_subject_id bigint,
    sequence_id bigint,
    unit_id bigint,
    student_id bigint,
    coefficient_credit bigint,
    score numeric,
    notation numeric,
    grade_name text,
    grade_description text,
    is_retry boolean,
    retry_count bigint,
    retry_details text
);


ALTER TABLE public.report_entries OWNER TO postgres;

--
-- Name: report_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.report_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.report_entries_id_seq OWNER TO postgres;

--
-- Name: report_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.report_entries_id_seq OWNED BY public.report_entries.id;


--
-- Name: report_grades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.report_grades (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    type text,
    name text,
    description text,
    minimum numeric,
    maximum numeric,
    include_minimum boolean,
    include_maximum boolean
);


ALTER TABLE public.report_grades OWNER TO postgres;

--
-- Name: report_grades_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.report_grades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.report_grades_id_seq OWNER TO postgres;

--
-- Name: report_grades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.report_grades_id_seq OWNED BY public.report_grades.id;


--
-- Name: report_tables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.report_tables (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    year_id bigint,
    class_id bigint,
    level_domain_id bigint,
    period_type text,
    period_name text,
    status text
);


ALTER TABLE public.report_tables OWNER TO postgres;

--
-- Name: report_tables_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.report_tables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.report_tables_id_seq OWNER TO postgres;

--
-- Name: report_tables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.report_tables_id_seq OWNED BY public.report_tables.id;


--
-- Name: requests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.requests (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    year_id bigint,
    class_subject_id bigint,
    sequence_id bigint,
    unit_id bigint,
    student_id bigint,
    status text,
    status_feedback text,
    audience text,
    title text,
    message text,
    document1 text,
    document2 text,
    document3 text,
    document4 text,
    document5 text
);


ALTER TABLE public.requests OWNER TO postgres;

--
-- Name: requests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.requests_id_seq OWNER TO postgres;

--
-- Name: requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.requests_id_seq OWNED BY public.requests.id;


--
-- Name: result_tables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.result_tables (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    exam_id bigint,
    status text
);


ALTER TABLE public.result_tables OWNER TO postgres;

--
-- Name: result_tables_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.result_tables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.result_tables_id_seq OWNER TO postgres;

--
-- Name: result_tables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.result_tables_id_seq OWNED BY public.result_tables.id;


--
-- Name: results; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.results (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    student_id bigint,
    exam_id bigint,
    score numeric
);


ALTER TABLE public.results OWNER TO postgres;

--
-- Name: results_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.results_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.results_id_seq OWNER TO postgres;

--
-- Name: results_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.results_id_seq OWNED BY public.results.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    feature text,
    name text NOT NULL,
    description text
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: schedules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schedules (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    year_id bigint,
    class_subject_id bigint,
    unit_id bigint,
    is_common boolean,
    type text,
    description text,
    day_of_the_week text,
    repeat_count bigint,
    repeat_type text,
    start_time text,
    end_time text,
    start_count_date timestamp with time zone,
    is_valid boolean,
    invalid_date timestamp with time zone
);


ALTER TABLE public.schedules OWNER TO postgres;

--
-- Name: schedules_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.schedules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.schedules_id_seq OWNER TO postgres;

--
-- Name: schedules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.schedules_id_seq OWNED BY public.schedules.id;


--
-- Name: school_configs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.school_configs (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    website_domain_name text,
    user_email_domain_name text,
    support_email text,
    google_workspace_credentials text,
    google_workspace_user_email_domain text,
    sms_user_id text,
    whatsapp_token text,
    whatsapp_phone_id text,
    telegram_bot_token text,
    website_title text,
    website_description text,
    color_primary text,
    color_primary_bg text,
    color_primary_bg_hover text
);


ALTER TABLE public.school_configs OWNER TO postgres;

--
-- Name: school_configs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.school_configs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.school_configs_id_seq OWNER TO postgres;

--
-- Name: school_configs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.school_configs_id_seq OWNED BY public.school_configs.id;


--
-- Name: school_infos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.school_infos (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    full_name text,
    description text,
    motto text,
    phone_number1 bigint,
    phone_number2 bigint,
    phone_number3 bigint,
    email1 text,
    email2 text,
    email3 text,
    founder text,
    founded_at timestamp with time zone,
    address text,
    po_box text,
    location_longitude text,
    location_latitude text,
    social_media_telegram text,
    social_media_whasapp text,
    social_media_youtube text,
    social_media_twitter text,
    social_media_facebook text,
    image1 text,
    image2 text,
    image3 text,
    image4 text,
    image5 text
);


ALTER TABLE public.school_infos OWNER TO postgres;

--
-- Name: school_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.school_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.school_infos_id_seq OWNER TO postgres;

--
-- Name: school_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.school_infos_id_seq OWNED BY public.school_infos.id;


--
-- Name: schools; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schools (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    config_id bigint,
    info_id bigint,
    name text,
    type text,
    status text,
    deployment_request text,
    deployment_status text,
    deployment_feedback text,
    deployment_extra text,
    deployment_count bigint,
    favicon text,
    logo text,
    logo_white text,
    currency text,
    payment_count bigint DEFAULT 1
);


ALTER TABLE public.schools OWNER TO postgres;

--
-- Name: schools_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.schools_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.schools_id_seq OWNER TO postgres;

--
-- Name: schools_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.schools_id_seq OWNED BY public.schools.id;


--
-- Name: student_enrolls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_enrolls (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    year_id bigint,
    class_id bigint,
    level_domain_id bigint,
    student_id bigint,
    origin text,
    origin_feedback text
);


ALTER TABLE public.student_enrolls OWNER TO postgres;

--
-- Name: student_enrolls_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_enrolls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.student_enrolls_id_seq OWNER TO postgres;

--
-- Name: student_enrolls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_enrolls_id_seq OWNED BY public.student_enrolls.id;


--
-- Name: student_pre_enrolls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_pre_enrolls (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    year_id bigint,
    class_id bigint,
    level_domain_id bigint,
    user_id bigint,
    status text,
    status_feedback text,
    message text,
    gender text,
    first_name text,
    last_name text,
    birthday timestamp with time zone,
    birth_location text,
    document1 text,
    document2 text,
    document3 text,
    document4 text,
    document5 text
);


ALTER TABLE public.student_pre_enrolls OWNER TO postgres;

--
-- Name: student_pre_enrolls_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_pre_enrolls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.student_pre_enrolls_id_seq OWNER TO postgres;

--
-- Name: student_pre_enrolls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_pre_enrolls_id_seq OWNED BY public.student_pre_enrolls.id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    user_id bigint,
    uid text
);


ALTER TABLE public.students OWNER TO postgres;

--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.students_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.students_id_seq OWNER TO postgres;

--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- Name: teacher_class_subject_units; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teacher_class_subject_units (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    year_id bigint,
    class_subject_id bigint,
    unit_id bigint,
    teacher_id bigint
);


ALTER TABLE public.teacher_class_subject_units OWNER TO postgres;

--
-- Name: teacher_class_subject_units_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teacher_class_subject_units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.teacher_class_subject_units_id_seq OWNER TO postgres;

--
-- Name: teacher_class_subject_units_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teacher_class_subject_units_id_seq OWNED BY public.teacher_class_subject_units.id;


--
-- Name: teachers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teachers (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    user_id bigint,
    uid text
);


ALTER TABLE public.teachers OWNER TO postgres;

--
-- Name: teachers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teachers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.teachers_id_seq OWNER TO postgres;

--
-- Name: teachers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teachers_id_seq OWNED BY public.teachers.id;


--
-- Name: university_departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.university_departments (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    faculty_id bigint,
    name text,
    description text
);


ALTER TABLE public.university_departments OWNER TO postgres;

--
-- Name: university_departments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.university_departments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.university_departments_id_seq OWNER TO postgres;

--
-- Name: university_departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.university_departments_id_seq OWNED BY public.university_departments.id;


--
-- Name: university_domains; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.university_domains (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    department_id bigint,
    name text,
    description text
);


ALTER TABLE public.university_domains OWNER TO postgres;

--
-- Name: university_domains_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.university_domains_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.university_domains_id_seq OWNER TO postgres;

--
-- Name: university_domains_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.university_domains_id_seq OWNED BY public.university_domains.id;


--
-- Name: university_faculties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.university_faculties (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    name text,
    description text
);


ALTER TABLE public.university_faculties OWNER TO postgres;

--
-- Name: university_faculties_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.university_faculties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.university_faculties_id_seq OWNER TO postgres;

--
-- Name: university_faculties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.university_faculties_id_seq OWNED BY public.university_faculties.id;


--
-- Name: university_level_domains; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.university_level_domains (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    level_id bigint,
    domain_id bigint,
    fees numeric,
    program text,
    requirements text,
    is_valid boolean DEFAULT true,
    invalid_date timestamp with time zone
);


ALTER TABLE public.university_level_domains OWNER TO postgres;

--
-- Name: university_level_domains_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.university_level_domains_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.university_level_domains_id_seq OWNER TO postgres;

--
-- Name: university_level_domains_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.university_level_domains_id_seq OWNED BY public.university_level_domains.id;


--
-- Name: university_levels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.university_levels (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    name text,
    description text
);


ALTER TABLE public.university_levels OWNER TO postgres;

--
-- Name: university_levels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.university_levels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.university_levels_id_seq OWNER TO postgres;

--
-- Name: university_levels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.university_levels_id_seq OWNED BY public.university_levels.id;


--
-- Name: university_semesters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.university_semesters (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    name text,
    description text
);


ALTER TABLE public.university_semesters OWNER TO postgres;

--
-- Name: university_semesters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.university_semesters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.university_semesters_id_seq OWNER TO postgres;

--
-- Name: university_semesters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.university_semesters_id_seq OWNED BY public.university_semesters.id;


--
-- Name: university_units; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.university_units (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    level_domain_id bigint,
    semester_id bigint,
    name text,
    description text,
    credit bigint,
    program text,
    requirements text,
    is_valid boolean DEFAULT true,
    invalid_date timestamp with time zone
);


ALTER TABLE public.university_units OWNER TO postgres;

--
-- Name: university_units_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.university_units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.university_units_id_seq OWNER TO postgres;

--
-- Name: university_units_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.university_units_id_seq OWNED BY public.university_units.id;


--
-- Name: user_configs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_configs (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    whatsapp_phone_number bigint,
    telegram_chat_id bigint,
    allow_notifications boolean DEFAULT true,
    mfa_email boolean DEFAULT false,
    mfa_authenticator boolean DEFAULT false,
    web_push_subscription_endpoint text,
    web_push_subscription_key_p256dh text,
    web_push_subscription_key_auth text
);


ALTER TABLE public.user_configs OWNER TO postgres;

--
-- Name: user_configs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_configs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_configs_id_seq OWNER TO postgres;

--
-- Name: user_configs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_configs_id_seq OWNED BY public.user_configs.id;


--
-- Name: user_infos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_infos (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    gender text,
    username text,
    first_name text,
    last_name text,
    birthday timestamp with time zone,
    birth_location text,
    address text,
    language text DEFAULT 'en'::text,
    image text
);


ALTER TABLE public.user_infos OWNER TO postgres;

--
-- Name: user_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_infos_id_seq OWNER TO postgres;

--
-- Name: user_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_infos_id_seq OWNED BY public.user_infos.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    role_id bigint,
    info_id bigint,
    config_id bigint,
    email text,
    phone_number bigint,
    password text,
    status text,
    login_method text,
    provider text,
    provider_user_id text,
    is_activated boolean DEFAULT false,
    activated_at timestamp with time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: years; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.years (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    school_id bigint,
    name text,
    start_date timestamp with time zone,
    end_date timestamp with time zone
);


ALTER TABLE public.years OWNER TO postgres;

--
-- Name: years_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.years_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.years_id_seq OWNER TO postgres;

--
-- Name: years_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.years_id_seq OWNED BY public.years.id;


--
-- Name: communications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.communications ALTER COLUMN id SET DEFAULT nextval('public.communications_id_seq'::regclass);


--
-- Name: contacts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts ALTER COLUMN id SET DEFAULT nextval('public.contacts_id_seq'::regclass);


--
-- Name: course_comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_comments ALTER COLUMN id SET DEFAULT nextval('public.course_comments_id_seq'::regclass);


--
-- Name: course_documents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_documents ALTER COLUMN id SET DEFAULT nextval('public.course_documents_id_seq'::regclass);


--
-- Name: course_videos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_videos ALTER COLUMN id SET DEFAULT nextval('public.course_videos_id_seq'::regclass);


--
-- Name: courses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);


--
-- Name: directors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors ALTER COLUMN id SET DEFAULT nextval('public.directors_id_seq'::regclass);


--
-- Name: exam_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exam_types ALTER COLUMN id SET DEFAULT nextval('public.exam_types_id_seq'::regclass);


--
-- Name: exams id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exams ALTER COLUMN id SET DEFAULT nextval('public.exams_id_seq'::regclass);


--
-- Name: highschool_class_subjects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.highschool_class_subjects ALTER COLUMN id SET DEFAULT nextval('public.highschool_class_subjects_id_seq'::regclass);


--
-- Name: highschool_classes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.highschool_classes ALTER COLUMN id SET DEFAULT nextval('public.highschool_classes_id_seq'::regclass);


--
-- Name: highschool_quarters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.highschool_quarters ALTER COLUMN id SET DEFAULT nextval('public.highschool_quarters_id_seq'::regclass);


--
-- Name: highschool_sections id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.highschool_sections ALTER COLUMN id SET DEFAULT nextval('public.highschool_sections_id_seq'::regclass);


--
-- Name: highschool_sequences id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.highschool_sequences ALTER COLUMN id SET DEFAULT nextval('public.highschool_sequences_id_seq'::regclass);


--
-- Name: highschool_specialties id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.highschool_specialties ALTER COLUMN id SET DEFAULT nextval('public.highschool_specialties_id_seq'::regclass);


--
-- Name: highschool_subjects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.highschool_subjects ALTER COLUMN id SET DEFAULT nextval('public.highschool_subjects_id_seq'::regclass);


--
-- Name: managers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.managers ALTER COLUMN id SET DEFAULT nextval('public.managers_id_seq'::regclass);


--
-- Name: meeting_rooms id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meeting_rooms ALTER COLUMN id SET DEFAULT nextval('public.meeting_rooms_id_seq'::regclass);


--
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- Name: parent_students id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parent_students ALTER COLUMN id SET DEFAULT nextval('public.parent_students_id_seq'::regclass);


--
-- Name: parents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parents ALTER COLUMN id SET DEFAULT nextval('public.parents_id_seq'::regclass);


--
-- Name: payments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- Name: quiz_answers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_answers ALTER COLUMN id SET DEFAULT nextval('public.quiz_answers_id_seq'::regclass);


--
-- Name: quiz_question_options id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_question_options ALTER COLUMN id SET DEFAULT nextval('public.quiz_question_options_id_seq'::regclass);


--
-- Name: quiz_questions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_questions ALTER COLUMN id SET DEFAULT nextval('public.quiz_questions_id_seq'::regclass);


--
-- Name: quizzes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quizzes ALTER COLUMN id SET DEFAULT nextval('public.quizzes_id_seq'::regclass);


--
-- Name: report_averages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_averages ALTER COLUMN id SET DEFAULT nextval('public.report_averages_id_seq'::regclass);


--
-- Name: report_configs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_configs ALTER COLUMN id SET DEFAULT nextval('public.report_configs_id_seq'::regclass);


--
-- Name: report_correspondences id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_correspondences ALTER COLUMN id SET DEFAULT nextval('public.report_correspondences_id_seq'::regclass);


--
-- Name: report_entries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_entries ALTER COLUMN id SET DEFAULT nextval('public.report_entries_id_seq'::regclass);


--
-- Name: report_grades id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_grades ALTER COLUMN id SET DEFAULT nextval('public.report_grades_id_seq'::regclass);


--
-- Name: report_tables id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_tables ALTER COLUMN id SET DEFAULT nextval('public.report_tables_id_seq'::regclass);


--
-- Name: requests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests ALTER COLUMN id SET DEFAULT nextval('public.requests_id_seq'::regclass);


--
-- Name: result_tables id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.result_tables ALTER COLUMN id SET DEFAULT nextval('public.result_tables_id_seq'::regclass);


--
-- Name: results id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.results ALTER COLUMN id SET DEFAULT nextval('public.results_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: schedules id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedules ALTER COLUMN id SET DEFAULT nextval('public.schedules_id_seq'::regclass);


--
-- Name: school_configs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.school_configs ALTER COLUMN id SET DEFAULT nextval('public.school_configs_id_seq'::regclass);


--
-- Name: school_infos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.school_infos ALTER COLUMN id SET DEFAULT nextval('public.school_infos_id_seq'::regclass);


--
-- Name: schools id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schools ALTER COLUMN id SET DEFAULT nextval('public.schools_id_seq'::regclass);


--
-- Name: student_enrolls id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_enrolls ALTER COLUMN id SET DEFAULT nextval('public.student_enrolls_id_seq'::regclass);


--
-- Name: student_pre_enrolls id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_pre_enrolls ALTER COLUMN id SET DEFAULT nextval('public.student_pre_enrolls_id_seq'::regclass);


--
-- Name: students id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- Name: teacher_class_subject_units id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_class_subject_units ALTER COLUMN id SET DEFAULT nextval('public.teacher_class_subject_units_id_seq'::regclass);


--
-- Name: teachers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers ALTER COLUMN id SET DEFAULT nextval('public.teachers_id_seq'::regclass);


--
-- Name: university_departments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_departments ALTER COLUMN id SET DEFAULT nextval('public.university_departments_id_seq'::regclass);


--
-- Name: university_domains id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_domains ALTER COLUMN id SET DEFAULT nextval('public.university_domains_id_seq'::regclass);


--
-- Name: university_faculties id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_faculties ALTER COLUMN id SET DEFAULT nextval('public.university_faculties_id_seq'::regclass);


--
-- Name: university_level_domains id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_level_domains ALTER COLUMN id SET DEFAULT nextval('public.university_level_domains_id_seq'::regclass);


--
-- Name: university_levels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_levels ALTER COLUMN id SET DEFAULT nextval('public.university_levels_id_seq'::regclass);


--
-- Name: university_semesters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_semesters ALTER COLUMN id SET DEFAULT nextval('public.university_semesters_id_seq'::regclass);


--
-- Name: university_units id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_units ALTER COLUMN id SET DEFAULT nextval('public.university_units_id_seq'::regclass);


--
-- Name: user_configs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_configs ALTER COLUMN id SET DEFAULT nextval('public.user_configs_id_seq'::regclass);


--
-- Name: user_infos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_infos ALTER COLUMN id SET DEFAULT nextval('public.user_infos_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: years id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.years ALTER COLUMN id SET DEFAULT nextval('public.years_id_seq'::regclass);


--
-- Data for Name: communications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.communications (id, created_at, updated_at, school_id, role_id, subject, message) FROM stdin;
\.


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacts (id, created_at, updated_at, school_id, subject, email, message) FROM stdin;
\.


--
-- Data for Name: course_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course_comments (id, created_at, updated_at, course_id, user_id, message, rate, is_deleted) FROM stdin;
\.


--
-- Data for Name: course_documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course_documents (id, created_at, updated_at, course_id, title, description, url) FROM stdin;
\.


--
-- Data for Name: course_videos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course_videos (id, created_at, updated_at, course_id, title, description, url) FROM stdin;
\.


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.courses (id, created_at, updated_at, school_id, year_id, class_subject_id, unit_id, title, description, content) FROM stdin;
\.


--
-- Data for Name: directors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directors (id, created_at, updated_at, school_id, user_id, uid) FROM stdin;
1	2026-09-08 13:50:30.801971+00	2026-09-08 13:50:30.801971+00	1	2	2026D0145
\.


--
-- Data for Name: exam_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exam_types (id, created_at, updated_at, school_id, name, description) FROM stdin;
\.


--
-- Data for Name: exams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exams (id, created_at, updated_at, school_id, year_id, class_subject_id, sequence_id, unit_id, type_id, status, notation, percentage, description, location_type, location_details, requirements, allowed_items, start_date, end_date, is_retry, retry_count) FROM stdin;
\.


--
-- Data for Name: highschool_class_subjects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.highschool_class_subjects (id, created_at, updated_at, school_id, class_id, subject_id, coefficient, program, requirements, is_valid, invalid_date) FROM stdin;
1	2026-09-08 13:59:20.601904+00	2026-09-08 13:59:20.601904+00	1	1	1	1			t	\N
\.


--
-- Data for Name: highschool_classes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.highschool_classes (id, created_at, updated_at, school_id, specialty_id, name, description, fees, program, requirements, is_valid, invalid_date) FROM stdin;
1	2026-09-08 13:56:37.499763+00	2026-09-08 13:56:37.499763+00	1	1	cp2	\N	5000	\N	\N	t	\N
\.


--
-- Data for Name: highschool_quarters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.highschool_quarters (id, created_at, updated_at, school_id, name, description) FROM stdin;
1	2026-09-08 13:54:46.822739+00	2026-09-08 13:54:46.822739+00	1	Première 	\N
\.


--
-- Data for Name: highschool_sections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.highschool_sections (id, created_at, updated_at, school_id, name, description) FROM stdin;
1	2026-09-08 13:55:40.289985+00	2026-09-08 13:55:40.289985+00	1	cp2	\N
\.


--
-- Data for Name: highschool_sequences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.highschool_sequences (id, created_at, updated_at, school_id, quarter_id, name, description) FROM stdin;
1	2026-09-08 13:55:24.935601+00	2026-09-08 13:55:24.935601+00	1	1	nan	\N
\.


--
-- Data for Name: highschool_specialties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.highschool_specialties (id, created_at, updated_at, school_id, section_id, name, description) FROM stdin;
1	2026-09-08 13:55:56.508942+00	2026-09-08 13:55:56.508942+00	1	1	sciences	\N
\.


--
-- Data for Name: highschool_subjects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.highschool_subjects (id, created_at, updated_at, school_id, name, description) FROM stdin;
1	2026-09-08 13:56:08.089226+00	2026-09-08 13:56:08.089226+00	1	Physique 	\N
\.


--
-- Data for Name: managers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.managers (id, created_at, updated_at, school_id, user_id, uid) FROM stdin;
\.


--
-- Data for Name: meeting_rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.meeting_rooms (id, created_at, updated_at, school_id, class_subject_id, unit_id, api_room_id) FROM stdin;
1	2026-09-08 13:59:20.607195+00	2026-09-08 13:59:20.607195+00	1	1	\N	\N
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications (id, created_at, updated_at, user_id, title, message, seen, seen_at) FROM stdin;
1	2026-09-08 13:49:40.338472+00	2026-09-08 13:49:40.338472+00	1	Failed to deploy school centre B	\n\t\t\tThe deployment of school 'centre B' has failed due to technical issues. \n\t\t\tPlease check the system logs and try again, or contact support for assistance\n\t\t\t	\N	\N
\.


--
-- Data for Name: parent_students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.parent_students (id, created_at, updated_at, school_id, parent_id, student_id) FROM stdin;
\.


--
-- Data for Name: parents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.parents (id, created_at, updated_at, school_id, user_id) FROM stdin;
1	2026-09-08 13:52:42.1843+00	2026-09-08 13:52:42.1843+00	1	5
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (id, created_at, updated_at, school_id, student_enroll_id, amount, currency, date, method, status, message) FROM stdin;
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permissions (id, created_at, updated_at, role_id, table_name, "create", read, update, delete) FROM stdin;
1	2026-09-08 11:19:36.550337+00	2026-09-08 11:19:36.550337+00	1	*	t	t	t	t
\.


--
-- Data for Name: quiz_answers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.quiz_answers (id, created_at, updated_at, student_id, quiz_question_id, quiz_question_option_id) FROM stdin;
\.


--
-- Data for Name: quiz_question_options; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.quiz_question_options (id, created_at, updated_at, quiz_question_id, title, description) FROM stdin;
\.


--
-- Data for Name: quiz_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.quiz_questions (id, created_at, updated_at, quiz_id, solution_id, title, description) FROM stdin;
\.


--
-- Data for Name: quizzes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.quizzes (id, created_at, updated_at, school_id, year_id, class_subject_id, unit_id, title, description, status) FROM stdin;
\.


--
-- Data for Name: report_averages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.report_averages (id, created_at, updated_at, school_id, year_id, class_id, level_domain_id, student_id, period_type, period_name, score, notation, grade_name, grade_description, rank, is_successful, total_credit_coefficient, validated_credit_coefficient) FROM stdin;
\.


--
-- Data for Name: report_configs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.report_configs (id, created_at, updated_at, school_id, report_grade_to_fail_id, notation_average, notation_report, minimum_required_score_to_promote, only_failed_exams) FROM stdin;
\.


--
-- Data for Name: report_correspondences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.report_correspondences (id, created_at, updated_at, school_id, minimum, maximum, include_minimum, include_maximum, new_score) FROM stdin;
\.


--
-- Data for Name: report_entries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.report_entries (id, created_at, updated_at, school_id, year_id, class_subject_id, sequence_id, unit_id, student_id, coefficient_credit, score, notation, grade_name, grade_description, is_retry, retry_count, retry_details) FROM stdin;
\.


--
-- Data for Name: report_grades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.report_grades (id, created_at, updated_at, school_id, type, name, description, minimum, maximum, include_minimum, include_maximum) FROM stdin;
\.


--
-- Data for Name: report_tables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.report_tables (id, created_at, updated_at, school_id, year_id, class_id, level_domain_id, period_type, period_name, status) FROM stdin;
\.


--
-- Data for Name: requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.requests (id, created_at, updated_at, school_id, year_id, class_subject_id, sequence_id, unit_id, student_id, status, status_feedback, audience, title, message, document1, document2, document3, document4, document5) FROM stdin;
\.


--
-- Data for Name: result_tables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.result_tables (id, created_at, updated_at, school_id, exam_id, status) FROM stdin;
\.


--
-- Data for Name: results; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.results (id, created_at, updated_at, school_id, student_id, exam_id, score) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, created_at, updated_at, feature, name, description) FROM stdin;
1	2026-09-08 11:19:34.748545+00	2026-09-08 11:19:34.748545+00	dashboard_admin	admin	Administrator role
2	2026-09-08 11:19:34.749265+00	2026-09-08 11:19:34.749265+00	dashboard_default	default	Default role
3	2026-09-08 11:19:34.749556+00	2026-09-08 11:19:34.749556+00	dashboard_director	director	Director role
4	2026-09-08 11:19:34.749857+00	2026-09-08 11:19:34.749857+00	dashboard_teacher	teacher	Teacher role
5	2026-09-08 11:19:34.750126+00	2026-09-08 11:19:34.750126+00	dashboard_student	student	Student role
6	2026-09-08 11:19:34.750393+00	2026-09-08 11:19:34.750393+00	dashboard_parent	parent	Parent role
\.


--
-- Data for Name: schedules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schedules (id, created_at, updated_at, school_id, year_id, class_subject_id, unit_id, is_common, type, description, day_of_the_week, repeat_count, repeat_type, start_time, end_time, start_count_date, is_valid, invalid_date) FROM stdin;
\.


--
-- Data for Name: school_configs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.school_configs (id, created_at, updated_at, website_domain_name, user_email_domain_name, support_email, google_workspace_credentials, google_workspace_user_email_domain, sms_user_id, whatsapp_token, whatsapp_phone_id, telegram_bot_token, website_title, website_description, color_primary, color_primary_bg, color_primary_bg_hover) FROM stdin;
1	2026-09-08 13:49:33.030652+00	2026-09-08 13:49:33.030652+00	centre.td	centreb	\N	\N	\N	\N	\N	\N	\N	centreb	centre b école	#3c8971	#e9f0ed	#a3c6b9
\.


--
-- Data for Name: school_infos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.school_infos (id, created_at, updated_at, full_name, description, motto, phone_number1, phone_number2, phone_number3, email1, email2, email3, founder, founded_at, address, po_box, location_longitude, location_latitude, social_media_telegram, social_media_whasapp, social_media_youtube, social_media_twitter, social_media_facebook, image1, image2, image3, image4, image5) FROM stdin;
1	2026-09-08 13:49:33.028466+00	2026-09-08 13:49:33.028466+00	école primaire centre b	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: schools; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schools (id, created_at, updated_at, config_id, info_id, name, type, status, deployment_request, deployment_status, deployment_feedback, deployment_extra, deployment_count, favicon, logo, logo_white, currency, payment_count) FROM stdin;
1	2026-09-08 13:49:33.031894+00	2026-09-08 13:49:40.329629+00	1	1	centre B	highschool	enabled	create	failed	failed		1	\N	\N	\N	xaf	1
\.


--
-- Data for Name: student_enrolls; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student_enrolls (id, created_at, updated_at, school_id, year_id, class_id, level_domain_id, student_id, origin, origin_feedback) FROM stdin;
\.


--
-- Data for Name: student_pre_enrolls; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student_pre_enrolls (id, created_at, updated_at, school_id, year_id, class_id, level_domain_id, user_id, status, status_feedback, message, gender, first_name, last_name, birthday, birth_location, document1, document2, document3, document4, document5) FROM stdin;
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (id, created_at, updated_at, school_id, user_id, uid) FROM stdin;
1	2026-09-08 13:51:55.284711+00	2026-09-08 13:51:55.284711+00	1	4	2026N5586
\.


--
-- Data for Name: teacher_class_subject_units; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teacher_class_subject_units (id, created_at, updated_at, school_id, year_id, class_subject_id, unit_id, teacher_id) FROM stdin;
1	2026-09-08 13:59:38.219602+00	2026-09-08 13:59:38.219602+00	1	1	1	\N	1
\.


--
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teachers (id, created_at, updated_at, school_id, user_id, uid) FROM stdin;
1	2026-09-08 13:51:26.476497+00	2026-09-08 13:51:26.476497+00	1	3	2026T4457
\.


--
-- Data for Name: university_departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.university_departments (id, created_at, updated_at, school_id, faculty_id, name, description) FROM stdin;
\.


--
-- Data for Name: university_domains; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.university_domains (id, created_at, updated_at, school_id, department_id, name, description) FROM stdin;
\.


--
-- Data for Name: university_faculties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.university_faculties (id, created_at, updated_at, school_id, name, description) FROM stdin;
\.


--
-- Data for Name: university_level_domains; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.university_level_domains (id, created_at, updated_at, school_id, level_id, domain_id, fees, program, requirements, is_valid, invalid_date) FROM stdin;
\.


--
-- Data for Name: university_levels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.university_levels (id, created_at, updated_at, school_id, name, description) FROM stdin;
\.


--
-- Data for Name: university_semesters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.university_semesters (id, created_at, updated_at, school_id, name, description) FROM stdin;
\.


--
-- Data for Name: university_units; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.university_units (id, created_at, updated_at, school_id, level_domain_id, semester_id, name, description, credit, program, requirements, is_valid, invalid_date) FROM stdin;
\.


--
-- Data for Name: user_configs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_configs (id, created_at, updated_at, whatsapp_phone_number, telegram_chat_id, allow_notifications, mfa_email, mfa_authenticator, web_push_subscription_endpoint, web_push_subscription_key_p256dh, web_push_subscription_key_auth) FROM stdin;
1	2026-09-08 11:19:34.752785+00	2026-09-08 11:19:34.752785+00	\N	\N	t	f	f	\N	\N	\N
2	2026-09-08 13:50:29.377948+00	2026-09-08 13:50:29.377948+00	\N	\N	t	f	f	\N	\N	\N
3	2026-09-08 13:51:24.826851+00	2026-09-08 13:51:24.826851+00	\N	\N	t	f	f	\N	\N	\N
4	2026-09-08 13:51:53.745729+00	2026-09-08 13:51:53.745729+00	\N	\N	t	f	f	\N	\N	\N
5	2026-09-08 13:52:40.933735+00	2026-09-08 13:52:40.933735+00	\N	\N	t	f	f	\N	\N	\N
\.


--
-- Data for Name: user_infos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_infos (id, created_at, updated_at, gender, username, first_name, last_name, birthday, birth_location, address, language, image) FROM stdin;
1	2026-09-08 11:19:34.752262+00	2026-09-08 11:19:34.752262+00	\N	Admin	\N	\N	\N	\N	\N	en	\N
2	2026-09-08 13:50:29.373796+00	2026-09-08 13:50:29.373796+00	male	\N	youssouf 	tokou	\N	\N	\N	fr	\N
3	2026-09-08 13:51:24.814784+00	2026-09-08 13:51:24.814784+00	male	\N	ali 	ahmat	\N	\N	\N	fr	\N
4	2026-09-08 13:51:53.744472+00	2026-09-08 13:51:53.744472+00	male	\N	lamine 	Mahamat 	\N	\N	\N	fr	\N
5	2026-09-08 13:52:40.925884+00	2026-09-08 13:52:40.925884+00	male	\N	Mahamat 	ali	\N	\N	\N	en	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, created_at, updated_at, school_id, role_id, info_id, config_id, email, phone_number, password, status, login_method, provider, provider_user_id, is_activated, activated_at) FROM stdin;
1	2026-09-08 11:19:36.543306+00	2026-09-08 11:19:36.543306+00	\N	1	1	1	admin@digitcore.cm	\N	JGFyZ29uMmlkJHY9MTkkbT0xMzEwNzIsdD00LHA9OCQ2SEU1MFV1Z25Qc1Zyc0ZSL1phZmpnJDFWaGZQSlRpaEM2WWhtMTdPc1VEcFV4WktMSWlkTHB0Rk9PTCtHbGg4NEU=	enabled	default	\N	\N	t	2026-09-08 11:19:34.753269+00
2	2026-09-08 13:50:30.797996+00	2026-09-08 13:50:30.797996+00	1	3	2	2	youssouf.tokou@centreb	\N	JGFyZ29uMmlkJHY9MTkkbT0xMzEwNzIsdD00LHA9OCRSWmpZcGl3dWtUSEFSRlZ1bmNIVjhnJGZRakRmZW9Rb1BVU1MvV3V4djgxNUlUOVJHdmZmY2ViYlVLN2tqWHlFZTg=	enabled	default	\N	\N	t	2026-09-08 13:50:29.379089+00
3	2026-09-08 13:51:26.45136+00	2026-09-08 13:51:26.45136+00	1	4	3	3	ali.ahmat@centreb	\N	JGFyZ29uMmlkJHY9MTkkbT0xMzEwNzIsdD00LHA9OCRjNzlTVXZNMU1vYkU2T2s0TWFWcnpnJFNNa2JUR25yZFJ2Vk9aU1hSQm0rdGtHM3pqdHAya2pqaGw4aEF2ZFg3dE0=	enabled	default	\N	\N	t	2026-09-08 13:51:24.827505+00
4	2026-09-08 13:51:55.277694+00	2026-09-08 13:51:55.277694+00	1	5	4	4	lamine.mahamat@centreb	\N	JGFyZ29uMmlkJHY9MTkkbT0xMzEwNzIsdD00LHA9OCRUSFpsK0VZUHZieEx2U0xhb1Q4bzVRJDZ2UkdtbDl0QThKQmRFVC9SV2ZZVldodG0rZ0U3dmVEeEI2bTJsMlR6MjA=	enabled	default	\N	\N	t	2026-09-08 13:51:53.746177+00
5	2026-09-08 13:52:42.180955+00	2026-09-08 13:52:42.180955+00	1	6	5	5	kellanamine@gmail.com	\N	JGFyZ29uMmlkJHY9MTkkbT0xMzEwNzIsdD00LHA9OCRWa1hFdnpXMnI0cXVpbEFMY28vdTRBJExFTjJtRHlBelV5OENkN2xWaG5SZGdNZ3VPUVlTcWVXSVpiOUNpMG5aQk0=	enabled	default	\N	\N	t	2026-09-08 13:52:40.935402+00
\.


--
-- Data for Name: years; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.years (id, created_at, updated_at, school_id, name, start_date, end_date) FROM stdin;
1	2026-09-08 13:58:04.755114+00	2026-09-08 13:58:04.755114+00	1	2026-2027	2026-09-08 13:57:09.1+00	2027-09-07 23:00:00+00
\.


--
-- Name: communications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.communications_id_seq', 1, false);


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contacts_id_seq', 1, false);


--
-- Name: course_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.course_comments_id_seq', 1, false);


--
-- Name: course_documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.course_documents_id_seq', 1, false);


--
-- Name: course_videos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.course_videos_id_seq', 1, false);


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.courses_id_seq', 1, false);


--
-- Name: directors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directors_id_seq', 1, true);


--
-- Name: exam_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exam_types_id_seq', 1, false);


--
-- Name: exams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exams_id_seq', 1, false);


--
-- Name: highschool_class_subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.highschool_class_subjects_id_seq', 1, true);


--
-- Name: highschool_classes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.highschool_classes_id_seq', 1, true);


--
-- Name: highschool_quarters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.highschool_quarters_id_seq', 1, true);


--
-- Name: highschool_sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.highschool_sections_id_seq', 1, true);


--
-- Name: highschool_sequences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.highschool_sequences_id_seq', 1, true);


--
-- Name: highschool_specialties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.highschool_specialties_id_seq', 1, true);


--
-- Name: highschool_subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.highschool_subjects_id_seq', 1, true);


--
-- Name: managers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.managers_id_seq', 1, false);


--
-- Name: meeting_rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.meeting_rooms_id_seq', 1, true);


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notifications_id_seq', 1, true);


--
-- Name: parent_students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.parent_students_id_seq', 1, false);


--
-- Name: parents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.parents_id_seq', 1, true);


--
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_id_seq', 1, false);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permissions_id_seq', 1, true);


--
-- Name: quiz_answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.quiz_answers_id_seq', 1, false);


--
-- Name: quiz_question_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.quiz_question_options_id_seq', 1, false);


--
-- Name: quiz_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.quiz_questions_id_seq', 1, false);


--
-- Name: quizzes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.quizzes_id_seq', 1, false);


--
-- Name: report_averages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.report_averages_id_seq', 1, false);


--
-- Name: report_configs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.report_configs_id_seq', 1, false);


--
-- Name: report_correspondences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.report_correspondences_id_seq', 1, false);


--
-- Name: report_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.report_entries_id_seq', 1, false);


--
-- Name: report_grades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.report_grades_id_seq', 1, false);


--
-- Name: report_tables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.report_tables_id_seq', 1, false);


--
-- Name: requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.requests_id_seq', 1, false);


--
-- Name: result_tables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.result_tables_id_seq', 1, false);


--
-- Name: results_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.results_id_seq', 1, false);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 6, true);


--
-- Name: schedules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.schedules_id_seq', 1, false);


--
-- Name: school_configs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.school_configs_id_seq', 1, true);


--
-- Name: school_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.school_infos_id_seq', 1, true);


--
-- Name: schools_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.schools_id_seq', 1, true);


--
-- Name: student_enrolls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_enrolls_id_seq', 1, false);


--
-- Name: student_pre_enrolls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_pre_enrolls_id_seq', 1, false);


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_id_seq', 1, true);


--
-- Name: teacher_class_subject_units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teacher_class_subject_units_id_seq', 1, true);


--
-- Name: teachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teachers_id_seq', 1, true);


--
-- Name: university_departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.university_departments_id_seq', 1, false);


--
-- Name: university_domains_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.university_domains_id_seq', 1, false);


--
-- Name: university_faculties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.university_faculties_id_seq', 1, false);


--
-- Name: university_level_domains_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.university_level_domains_id_seq', 1, false);


--
-- Name: university_levels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.university_levels_id_seq', 1, false);


--
-- Name: university_semesters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.university_semesters_id_seq', 1, false);


--
-- Name: university_units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.university_units_id_seq', 1, false);


--
-- Name: user_configs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_configs_id_seq', 5, true);


--
-- Name: user_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_infos_id_seq', 5, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: years_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.years_id_seq', 1, true);


--
-- Name: communications communications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.communications
    ADD CONSTRAINT communications_pkey PRIMARY KEY (id);


--
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: course_comments course_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_comments
    ADD CONSTRAINT course_comments_pkey PRIMARY KEY (id);


--
-- Name: course_documents course_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_documents
    ADD CONSTRAINT course_documents_pkey PRIMARY KEY (id);


--
-- Name: course_videos course_videos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_videos
    ADD CONSTRAINT course_videos_pkey PRIMARY KEY (id);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: directors directors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_pkey PRIMARY KEY (id);


--
-- Name: exam_types exam_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exam_types
    ADD CONSTRAINT exam_types_pkey PRIMARY KEY (id);


--
-- Name: exams exams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exams
    ADD CONSTRAINT exams_pkey PRIMARY KEY (id);


--
-- Name: highschool_class_subjects highschool_class_subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.highschool_class_subjects
    ADD CONSTRAINT highschool_class_subjects_pkey PRIMARY KEY (id);


--
-- Name: highschool_classes highschool_classes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.highschool_classes
    ADD CONSTRAINT highschool_classes_pkey PRIMARY KEY (id);


--
-- Name: highschool_quarters highschool_quarters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.highschool_quarters
    ADD CONSTRAINT highschool_quarters_pkey PRIMARY KEY (id);


--
-- Name: highschool_sections highschool_sections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.highschool_sections
    ADD CONSTRAINT highschool_sections_pkey PRIMARY KEY (id);


--
-- Name: highschool_sequences highschool_sequences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.highschool_sequences
    ADD CONSTRAINT highschool_sequences_pkey PRIMARY KEY (id);


--
-- Name: highschool_specialties highschool_specialties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.highschool_specialties
    ADD CONSTRAINT highschool_specialties_pkey PRIMARY KEY (id);


--
-- Name: highschool_subjects highschool_subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.highschool_subjects
    ADD CONSTRAINT highschool_subjects_pkey PRIMARY KEY (id);


--
-- Name: managers managers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.managers
    ADD CONSTRAINT managers_pkey PRIMARY KEY (id);


--
-- Name: meeting_rooms meeting_rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meeting_rooms
    ADD CONSTRAINT meeting_rooms_pkey PRIMARY KEY (id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: parent_students parent_students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parent_students
    ADD CONSTRAINT parent_students_pkey PRIMARY KEY (id);


--
-- Name: parents parents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parents
    ADD CONSTRAINT parents_pkey PRIMARY KEY (id);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: quiz_answers quiz_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_answers
    ADD CONSTRAINT quiz_answers_pkey PRIMARY KEY (id);


--
-- Name: quiz_question_options quiz_question_options_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_question_options
    ADD CONSTRAINT quiz_question_options_pkey PRIMARY KEY (id);


--
-- Name: quiz_questions quiz_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_questions
    ADD CONSTRAINT quiz_questions_pkey PRIMARY KEY (id);


--
-- Name: quizzes quizzes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quizzes
    ADD CONSTRAINT quizzes_pkey PRIMARY KEY (id);


--
-- Name: report_averages report_averages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_averages
    ADD CONSTRAINT report_averages_pkey PRIMARY KEY (id);


--
-- Name: report_configs report_configs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_configs
    ADD CONSTRAINT report_configs_pkey PRIMARY KEY (id);


--
-- Name: report_correspondences report_correspondences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_correspondences
    ADD CONSTRAINT report_correspondences_pkey PRIMARY KEY (id);


--
-- Name: report_entries report_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_entries
    ADD CONSTRAINT report_entries_pkey PRIMARY KEY (id);


--
-- Name: report_grades report_grades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_grades
    ADD CONSTRAINT report_grades_pkey PRIMARY KEY (id);


--
-- Name: report_tables report_tables_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_tables
    ADD CONSTRAINT report_tables_pkey PRIMARY KEY (id);


--
-- Name: requests requests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_pkey PRIMARY KEY (id);


--
-- Name: result_tables result_tables_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.result_tables
    ADD CONSTRAINT result_tables_pkey PRIMARY KEY (id);


--
-- Name: results results_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.results
    ADD CONSTRAINT results_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: schedules schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT schedules_pkey PRIMARY KEY (id);


--
-- Name: school_configs school_configs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.school_configs
    ADD CONSTRAINT school_configs_pkey PRIMARY KEY (id);


--
-- Name: school_infos school_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.school_infos
    ADD CONSTRAINT school_infos_pkey PRIMARY KEY (id);


--
-- Name: schools schools_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schools
    ADD CONSTRAINT schools_pkey PRIMARY KEY (id);


--
-- Name: student_enrolls student_enrolls_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_enrolls
    ADD CONSTRAINT student_enrolls_pkey PRIMARY KEY (id);


--
-- Name: student_pre_enrolls student_pre_enrolls_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_pre_enrolls
    ADD CONSTRAINT student_pre_enrolls_pkey PRIMARY KEY (id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: teacher_class_subject_units teacher_class_subject_units_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_class_subject_units
    ADD CONSTRAINT teacher_class_subject_units_pkey PRIMARY KEY (id);


--
-- Name: teachers teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (id);


--
-- Name: roles uni_roles_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT uni_roles_name UNIQUE (name);


--
-- Name: schools uni_schools_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schools
    ADD CONSTRAINT uni_schools_name UNIQUE (name);


--
-- Name: university_departments university_departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_departments
    ADD CONSTRAINT university_departments_pkey PRIMARY KEY (id);


--
-- Name: university_domains university_domains_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_domains
    ADD CONSTRAINT university_domains_pkey PRIMARY KEY (id);


--
-- Name: university_faculties university_faculties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_faculties
    ADD CONSTRAINT university_faculties_pkey PRIMARY KEY (id);


--
-- Name: university_level_domains university_level_domains_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_level_domains
    ADD CONSTRAINT university_level_domains_pkey PRIMARY KEY (id);


--
-- Name: university_levels university_levels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_levels
    ADD CONSTRAINT university_levels_pkey PRIMARY KEY (id);


--
-- Name: university_semesters university_semesters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_semesters
    ADD CONSTRAINT university_semesters_pkey PRIMARY KEY (id);


--
-- Name: university_units university_units_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_units
    ADD CONSTRAINT university_units_pkey PRIMARY KEY (id);


--
-- Name: user_configs user_configs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_configs
    ADD CONSTRAINT user_configs_pkey PRIMARY KEY (id);


--
-- Name: user_infos user_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_infos
    ADD CONSTRAINT user_infos_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: years years_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.years
    ADD CONSTRAINT years_pkey PRIMARY KEY (id);


--
-- Name: idx_quiz_answers_quiz_question_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_quiz_answers_quiz_question_id ON public.quiz_answers USING btree (quiz_question_id);


--
-- Name: idx_quiz_answers_quiz_question_option_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_quiz_answers_quiz_question_option_id ON public.quiz_answers USING btree (quiz_question_option_id);


--
-- Name: idx_quiz_answers_student_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_quiz_answers_student_id ON public.quiz_answers USING btree (student_id);


--
-- Name: idx_quiz_question_options_quiz_question_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_quiz_question_options_quiz_question_id ON public.quiz_question_options USING btree (quiz_question_id);


--
-- Name: idx_quiz_questions_quiz_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_quiz_questions_quiz_id ON public.quiz_questions USING btree (quiz_id);


--
-- Name: idx_quiz_questions_solution_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_quiz_questions_solution_id ON public.quiz_questions USING btree (solution_id);


--
-- Name: idx_quizzes_class_subject_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_quizzes_class_subject_id ON public.quizzes USING btree (class_subject_id);


--
-- Name: idx_quizzes_school_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_quizzes_school_id ON public.quizzes USING btree (school_id);


--
-- Name: idx_quizzes_unit_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_quizzes_unit_id ON public.quizzes USING btree (unit_id);


--
-- Name: idx_quizzes_year_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_quizzes_year_id ON public.quizzes USING btree (year_id);


--
-- Name: communications fk_communications_role; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.communications
    ADD CONSTRAINT fk_communications_role FOREIGN KEY (role_id) REFERENCES public.roles(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: communications fk_communications_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.communications
    ADD CONSTRAINT fk_communications_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: contacts fk_contacts_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT fk_contacts_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: course_comments fk_course_comments_course; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_comments
    ADD CONSTRAINT fk_course_comments_course FOREIGN KEY (course_id) REFERENCES public.courses(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: course_comments fk_course_comments_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_comments
    ADD CONSTRAINT fk_course_comments_user FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: courses fk_courses_class_subject; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT fk_courses_class_subject FOREIGN KEY (class_subject_id) REFERENCES public.highschool_class_subjects(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: course_documents fk_courses_documents; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_documents
    ADD CONSTRAINT fk_courses_documents FOREIGN KEY (course_id) REFERENCES public.courses(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: courses fk_courses_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT fk_courses_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: courses fk_courses_unit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT fk_courses_unit FOREIGN KEY (unit_id) REFERENCES public.university_units(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: course_videos fk_courses_videos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_videos
    ADD CONSTRAINT fk_courses_videos FOREIGN KEY (course_id) REFERENCES public.courses(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: courses fk_courses_year; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT fk_courses_year FOREIGN KEY (year_id) REFERENCES public.years(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: directors fk_directors_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT fk_directors_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: directors fk_directors_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT fk_directors_user FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: exam_types fk_exam_types_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exam_types
    ADD CONSTRAINT fk_exam_types_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: exams fk_exams_class_subject; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exams
    ADD CONSTRAINT fk_exams_class_subject FOREIGN KEY (class_subject_id) REFERENCES public.highschool_class_subjects(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: exams fk_exams_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exams
    ADD CONSTRAINT fk_exams_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: exams fk_exams_sequence; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exams
    ADD CONSTRAINT fk_exams_sequence FOREIGN KEY (sequence_id) REFERENCES public.highschool_sequences(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: exams fk_exams_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exams
    ADD CONSTRAINT fk_exams_type FOREIGN KEY (type_id) REFERENCES public.exam_types(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: exams fk_exams_unit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exams
    ADD CONSTRAINT fk_exams_unit FOREIGN KEY (unit_id) REFERENCES public.university_units(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: exams fk_exams_year; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exams
    ADD CONSTRAINT fk_exams_year FOREIGN KEY (year_id) REFERENCES public.years(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: highschool_class_subjects fk_highschool_class_subjects_class; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.highschool_class_subjects
    ADD CONSTRAINT fk_highschool_class_subjects_class FOREIGN KEY (class_id) REFERENCES public.highschool_classes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: highschool_class_subjects fk_highschool_class_subjects_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.highschool_class_subjects
    ADD CONSTRAINT fk_highschool_class_subjects_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: highschool_class_subjects fk_highschool_class_subjects_subject; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.highschool_class_subjects
    ADD CONSTRAINT fk_highschool_class_subjects_subject FOREIGN KEY (subject_id) REFERENCES public.highschool_subjects(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: highschool_classes fk_highschool_classes_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.highschool_classes
    ADD CONSTRAINT fk_highschool_classes_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: highschool_classes fk_highschool_classes_specialty; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.highschool_classes
    ADD CONSTRAINT fk_highschool_classes_specialty FOREIGN KEY (specialty_id) REFERENCES public.highschool_specialties(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: highschool_quarters fk_highschool_quarters_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.highschool_quarters
    ADD CONSTRAINT fk_highschool_quarters_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: highschool_sections fk_highschool_sections_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.highschool_sections
    ADD CONSTRAINT fk_highschool_sections_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: highschool_sequences fk_highschool_sequences_quarter; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.highschool_sequences
    ADD CONSTRAINT fk_highschool_sequences_quarter FOREIGN KEY (quarter_id) REFERENCES public.highschool_quarters(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: highschool_sequences fk_highschool_sequences_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.highschool_sequences
    ADD CONSTRAINT fk_highschool_sequences_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: highschool_specialties fk_highschool_specialties_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.highschool_specialties
    ADD CONSTRAINT fk_highschool_specialties_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: highschool_specialties fk_highschool_specialties_section; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.highschool_specialties
    ADD CONSTRAINT fk_highschool_specialties_section FOREIGN KEY (section_id) REFERENCES public.highschool_sections(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: highschool_subjects fk_highschool_subjects_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.highschool_subjects
    ADD CONSTRAINT fk_highschool_subjects_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: managers fk_managers_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.managers
    ADD CONSTRAINT fk_managers_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: managers fk_managers_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.managers
    ADD CONSTRAINT fk_managers_user FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: meeting_rooms fk_meeting_rooms_class_subject; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meeting_rooms
    ADD CONSTRAINT fk_meeting_rooms_class_subject FOREIGN KEY (class_subject_id) REFERENCES public.highschool_class_subjects(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: meeting_rooms fk_meeting_rooms_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meeting_rooms
    ADD CONSTRAINT fk_meeting_rooms_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: meeting_rooms fk_meeting_rooms_unit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meeting_rooms
    ADD CONSTRAINT fk_meeting_rooms_unit FOREIGN KEY (unit_id) REFERENCES public.university_units(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: notifications fk_notifications_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT fk_notifications_user FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: parent_students fk_parent_students_parent; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parent_students
    ADD CONSTRAINT fk_parent_students_parent FOREIGN KEY (parent_id) REFERENCES public.parents(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: parent_students fk_parent_students_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parent_students
    ADD CONSTRAINT fk_parent_students_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: parent_students fk_parent_students_student; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parent_students
    ADD CONSTRAINT fk_parent_students_student FOREIGN KEY (student_id) REFERENCES public.students(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: parents fk_parents_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parents
    ADD CONSTRAINT fk_parents_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: parents fk_parents_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parents
    ADD CONSTRAINT fk_parents_user FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: payments fk_payments_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT fk_payments_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: payments fk_payments_student_enroll; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT fk_payments_student_enroll FOREIGN KEY (student_enroll_id) REFERENCES public.student_enrolls(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: permissions fk_permissions_role; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT fk_permissions_role FOREIGN KEY (role_id) REFERENCES public.roles(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: quiz_answers fk_quiz_answers_quiz_question; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_answers
    ADD CONSTRAINT fk_quiz_answers_quiz_question FOREIGN KEY (quiz_question_id) REFERENCES public.quiz_questions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: quiz_answers fk_quiz_answers_quiz_question_option; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_answers
    ADD CONSTRAINT fk_quiz_answers_quiz_question_option FOREIGN KEY (quiz_question_option_id) REFERENCES public.quiz_question_options(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: quiz_answers fk_quiz_answers_student; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_answers
    ADD CONSTRAINT fk_quiz_answers_student FOREIGN KEY (student_id) REFERENCES public.students(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: quiz_question_options fk_quiz_questions_options; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_question_options
    ADD CONSTRAINT fk_quiz_questions_options FOREIGN KEY (quiz_question_id) REFERENCES public.quiz_questions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: quiz_questions fk_quiz_questions_solution; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_questions
    ADD CONSTRAINT fk_quiz_questions_solution FOREIGN KEY (solution_id) REFERENCES public.quiz_question_options(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: quizzes fk_quizzes_class_subject; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quizzes
    ADD CONSTRAINT fk_quizzes_class_subject FOREIGN KEY (class_subject_id) REFERENCES public.highschool_class_subjects(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: quiz_questions fk_quizzes_questions; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_questions
    ADD CONSTRAINT fk_quizzes_questions FOREIGN KEY (quiz_id) REFERENCES public.quizzes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: quizzes fk_quizzes_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quizzes
    ADD CONSTRAINT fk_quizzes_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: quizzes fk_quizzes_unit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quizzes
    ADD CONSTRAINT fk_quizzes_unit FOREIGN KEY (unit_id) REFERENCES public.university_units(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: quizzes fk_quizzes_year; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quizzes
    ADD CONSTRAINT fk_quizzes_year FOREIGN KEY (year_id) REFERENCES public.years(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: report_averages fk_report_averages_class; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_averages
    ADD CONSTRAINT fk_report_averages_class FOREIGN KEY (class_id) REFERENCES public.highschool_classes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: report_averages fk_report_averages_level_domain; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_averages
    ADD CONSTRAINT fk_report_averages_level_domain FOREIGN KEY (level_domain_id) REFERENCES public.university_level_domains(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: report_averages fk_report_averages_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_averages
    ADD CONSTRAINT fk_report_averages_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: report_averages fk_report_averages_student; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_averages
    ADD CONSTRAINT fk_report_averages_student FOREIGN KEY (student_id) REFERENCES public.students(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: report_averages fk_report_averages_year; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_averages
    ADD CONSTRAINT fk_report_averages_year FOREIGN KEY (year_id) REFERENCES public.years(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: report_configs fk_report_configs_report_grade_to_fail; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_configs
    ADD CONSTRAINT fk_report_configs_report_grade_to_fail FOREIGN KEY (report_grade_to_fail_id) REFERENCES public.report_grades(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: report_configs fk_report_configs_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_configs
    ADD CONSTRAINT fk_report_configs_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: report_correspondences fk_report_correspondences_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_correspondences
    ADD CONSTRAINT fk_report_correspondences_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: report_entries fk_report_entries_class_subject; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_entries
    ADD CONSTRAINT fk_report_entries_class_subject FOREIGN KEY (class_subject_id) REFERENCES public.highschool_class_subjects(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: report_entries fk_report_entries_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_entries
    ADD CONSTRAINT fk_report_entries_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: report_entries fk_report_entries_sequence; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_entries
    ADD CONSTRAINT fk_report_entries_sequence FOREIGN KEY (sequence_id) REFERENCES public.highschool_sequences(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: report_entries fk_report_entries_student; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_entries
    ADD CONSTRAINT fk_report_entries_student FOREIGN KEY (student_id) REFERENCES public.students(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: report_entries fk_report_entries_unit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_entries
    ADD CONSTRAINT fk_report_entries_unit FOREIGN KEY (unit_id) REFERENCES public.university_units(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: report_entries fk_report_entries_year; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_entries
    ADD CONSTRAINT fk_report_entries_year FOREIGN KEY (year_id) REFERENCES public.years(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: report_grades fk_report_grades_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_grades
    ADD CONSTRAINT fk_report_grades_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: report_tables fk_report_tables_class; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_tables
    ADD CONSTRAINT fk_report_tables_class FOREIGN KEY (class_id) REFERENCES public.highschool_classes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: report_tables fk_report_tables_level_domain; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_tables
    ADD CONSTRAINT fk_report_tables_level_domain FOREIGN KEY (level_domain_id) REFERENCES public.university_level_domains(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: report_tables fk_report_tables_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_tables
    ADD CONSTRAINT fk_report_tables_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: report_tables fk_report_tables_year; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_tables
    ADD CONSTRAINT fk_report_tables_year FOREIGN KEY (year_id) REFERENCES public.years(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: requests fk_requests_class_subject; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT fk_requests_class_subject FOREIGN KEY (class_subject_id) REFERENCES public.highschool_class_subjects(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: requests fk_requests_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT fk_requests_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: requests fk_requests_sequence; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT fk_requests_sequence FOREIGN KEY (sequence_id) REFERENCES public.highschool_sequences(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: requests fk_requests_student; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT fk_requests_student FOREIGN KEY (student_id) REFERENCES public.students(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: requests fk_requests_unit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT fk_requests_unit FOREIGN KEY (unit_id) REFERENCES public.university_units(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: requests fk_requests_year; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT fk_requests_year FOREIGN KEY (year_id) REFERENCES public.years(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: result_tables fk_result_tables_exam; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.result_tables
    ADD CONSTRAINT fk_result_tables_exam FOREIGN KEY (exam_id) REFERENCES public.exams(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: result_tables fk_result_tables_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.result_tables
    ADD CONSTRAINT fk_result_tables_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: results fk_results_exam; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.results
    ADD CONSTRAINT fk_results_exam FOREIGN KEY (exam_id) REFERENCES public.exams(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: results fk_results_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.results
    ADD CONSTRAINT fk_results_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: results fk_results_student; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.results
    ADD CONSTRAINT fk_results_student FOREIGN KEY (student_id) REFERENCES public.students(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: schedules fk_schedules_class_subject; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT fk_schedules_class_subject FOREIGN KEY (class_subject_id) REFERENCES public.highschool_class_subjects(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: schedules fk_schedules_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT fk_schedules_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: schedules fk_schedules_unit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT fk_schedules_unit FOREIGN KEY (unit_id) REFERENCES public.university_units(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: schedules fk_schedules_year; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT fk_schedules_year FOREIGN KEY (year_id) REFERENCES public.years(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: schools fk_schools_config; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schools
    ADD CONSTRAINT fk_schools_config FOREIGN KEY (config_id) REFERENCES public.school_configs(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: schools fk_schools_info; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schools
    ADD CONSTRAINT fk_schools_info FOREIGN KEY (info_id) REFERENCES public.school_infos(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: student_enrolls fk_student_enrolls_class; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_enrolls
    ADD CONSTRAINT fk_student_enrolls_class FOREIGN KEY (class_id) REFERENCES public.highschool_classes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: student_enrolls fk_student_enrolls_level_domain; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_enrolls
    ADD CONSTRAINT fk_student_enrolls_level_domain FOREIGN KEY (level_domain_id) REFERENCES public.university_level_domains(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: student_enrolls fk_student_enrolls_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_enrolls
    ADD CONSTRAINT fk_student_enrolls_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: student_enrolls fk_student_enrolls_student; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_enrolls
    ADD CONSTRAINT fk_student_enrolls_student FOREIGN KEY (student_id) REFERENCES public.students(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: student_enrolls fk_student_enrolls_year; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_enrolls
    ADD CONSTRAINT fk_student_enrolls_year FOREIGN KEY (year_id) REFERENCES public.years(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: student_pre_enrolls fk_student_pre_enrolls_class; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_pre_enrolls
    ADD CONSTRAINT fk_student_pre_enrolls_class FOREIGN KEY (class_id) REFERENCES public.highschool_classes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: student_pre_enrolls fk_student_pre_enrolls_level_domain; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_pre_enrolls
    ADD CONSTRAINT fk_student_pre_enrolls_level_domain FOREIGN KEY (level_domain_id) REFERENCES public.university_level_domains(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: student_pre_enrolls fk_student_pre_enrolls_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_pre_enrolls
    ADD CONSTRAINT fk_student_pre_enrolls_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: student_pre_enrolls fk_student_pre_enrolls_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_pre_enrolls
    ADD CONSTRAINT fk_student_pre_enrolls_user FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: student_pre_enrolls fk_student_pre_enrolls_year; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_pre_enrolls
    ADD CONSTRAINT fk_student_pre_enrolls_year FOREIGN KEY (year_id) REFERENCES public.years(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: students fk_students_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT fk_students_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: students fk_students_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT fk_students_user FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: teacher_class_subject_units fk_teacher_class_subject_units_class_subject; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_class_subject_units
    ADD CONSTRAINT fk_teacher_class_subject_units_class_subject FOREIGN KEY (class_subject_id) REFERENCES public.highschool_class_subjects(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: teacher_class_subject_units fk_teacher_class_subject_units_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_class_subject_units
    ADD CONSTRAINT fk_teacher_class_subject_units_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: teacher_class_subject_units fk_teacher_class_subject_units_teacher; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_class_subject_units
    ADD CONSTRAINT fk_teacher_class_subject_units_teacher FOREIGN KEY (teacher_id) REFERENCES public.teachers(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: teacher_class_subject_units fk_teacher_class_subject_units_unit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_class_subject_units
    ADD CONSTRAINT fk_teacher_class_subject_units_unit FOREIGN KEY (unit_id) REFERENCES public.university_units(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: teacher_class_subject_units fk_teacher_class_subject_units_year; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_class_subject_units
    ADD CONSTRAINT fk_teacher_class_subject_units_year FOREIGN KEY (year_id) REFERENCES public.years(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: teachers fk_teachers_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT fk_teachers_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: teachers fk_teachers_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT fk_teachers_user FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: university_departments fk_university_departments_faculty; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_departments
    ADD CONSTRAINT fk_university_departments_faculty FOREIGN KEY (faculty_id) REFERENCES public.university_faculties(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: university_departments fk_university_departments_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_departments
    ADD CONSTRAINT fk_university_departments_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: university_domains fk_university_domains_department; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_domains
    ADD CONSTRAINT fk_university_domains_department FOREIGN KEY (department_id) REFERENCES public.university_departments(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: university_domains fk_university_domains_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_domains
    ADD CONSTRAINT fk_university_domains_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: university_faculties fk_university_faculties_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_faculties
    ADD CONSTRAINT fk_university_faculties_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: university_level_domains fk_university_level_domains_domain; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_level_domains
    ADD CONSTRAINT fk_university_level_domains_domain FOREIGN KEY (domain_id) REFERENCES public.university_domains(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: university_level_domains fk_university_level_domains_level; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_level_domains
    ADD CONSTRAINT fk_university_level_domains_level FOREIGN KEY (level_id) REFERENCES public.university_levels(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: university_level_domains fk_university_level_domains_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_level_domains
    ADD CONSTRAINT fk_university_level_domains_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: university_levels fk_university_levels_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_levels
    ADD CONSTRAINT fk_university_levels_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: university_semesters fk_university_semesters_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_semesters
    ADD CONSTRAINT fk_university_semesters_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: university_units fk_university_units_level_domain; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_units
    ADD CONSTRAINT fk_university_units_level_domain FOREIGN KEY (level_domain_id) REFERENCES public.university_level_domains(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: university_units fk_university_units_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_units
    ADD CONSTRAINT fk_university_units_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: university_units fk_university_units_semester; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_units
    ADD CONSTRAINT fk_university_units_semester FOREIGN KEY (semester_id) REFERENCES public.university_semesters(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: users fk_users_config; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_users_config FOREIGN KEY (config_id) REFERENCES public.user_configs(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: users fk_users_info; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_users_info FOREIGN KEY (info_id) REFERENCES public.user_infos(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: users fk_users_role; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_users_role FOREIGN KEY (role_id) REFERENCES public.roles(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: users fk_users_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_users_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: years fk_years_school; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.years
    ADD CONSTRAINT fk_years_school FOREIGN KEY (school_id) REFERENCES public.schools(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict JkIWo40hVCA2YeceEUBerbJ3Q4RY9EkGVeNdeOnEwBb0IbLaLqj2dviJq2HnXG3

--
-- PostgreSQL database cluster dump complete
--

