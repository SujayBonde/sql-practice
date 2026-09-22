-- Database creation and management
-- Target: ANSI SQL / MySQL / PostgreSQL

-- Create database
CREATE DATABASE company_db;

-- Conditional creation with encoding (MySQL)
CREATE DATABASE IF NOT EXISTS company_db
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

-- Conditional creation with encoding (PostgreSQL)
-- CREATE DATABASE company_db WITH ENCODING 'UTF8' LC_COLLATE = 'en_US.UTF-8';

-- Select active database
USE company_db;

-- List existing databases
-- MySQL: SHOW DATABASES;
-- PostgreSQL: \l

-- Drop database
-- DROP DATABASE IF EXISTS company_db;
