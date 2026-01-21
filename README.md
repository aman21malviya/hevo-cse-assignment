Welcome to Hevo CSE Technical Assessment – dbt Models

## Overview
This repository contains the solution for the Hevo Customer Success Engineer (CSE) Technical Assessment.
The objective of this assignment is to demonstrate a real-world data pipeline and analytics workflow using PostgreSQL, Hevo, Snowflake, and dbt, while clearly documenting:

-design decisions
-assumptions
-validation steps
-customer-focused trade-offs
---

## Architecture
PostgreSQL (Neon) → Hevo → Snowflake → dbt Cloud
-PostgreSQL acts as the source transactional database
-Hevo ingests and syncs data into Snowflake
-dbt Cloud is used for transformations, testing, and analytics modeling
---

## Source Database Choice (PostgreSQL)
Initially, PostgreSQL was set up locally using Docker. Since Hevo is a cloud-native platform, connecting to a local database required additional networking configurations such as public exposure, firewall rules, and IP whitelisting.
Multiple approaches were explored (DNS resolution, IPv4/IPv6 settings, port forwarding), but this added operational complexity without contributing to the core goals of the assessment.
To stay focused on data ingestion, modeling, and validation, a managed PostgreSQL service was used instead.

### Tools Evaluated
- **Local PostgreSQL (Docker)**: Required networking workarounds
- **Supabase**: Required credit card details to fully access connection info
- **Neon**: Chosen due to public accessibility, ease of setup, and
  compatibility with Hevo.
  Neon allowed quick table creation, data loading, and stable connectivity with Hevo for pipeline configuration.

## Hevo Pipeline Setup
- A Hevo pipeline was created using **Neon PostgreSQL** as the source
- Required tables were selected and historical data was ingested
- **Snowflake** was configured as the destination using Partner Connect
- After ingestion, data was validated by comparing:
  - Row counts
  - Sample records between PostgreSQL (source) and Snowflake (destination)
---

## dbt Project Setup
- A free **dbt Cloud** account was created
- Project name: **hevo-cse-analytics**
- GitHub repository was connected to dbt Cloud
- Development was done on a feature branch: `hevo-cse-assignment`

### Project Structure
models/
├── staging/
│   ├── sources.yml
│   ├── stg_customers.sql
│   ├── stg_orders.sql
│   └── stg_payments.sql
├── marts/
│   ├── dim_customers.sql
│   ├── dim_customers.yml
│   ├── fct_orders.sql
│   ├── fct_orders.yml
│   ├── fct_payments.sql
│   └── fct_payments.yml

**Challenges & Key Decisions**
- Connecting a local Docker-based PostgreSQL instance to Hevo required complex networking configurations
- To avoid infrastructure-heavy work unrelated to the assessment goals, a managed PostgreSQL service was used
- Logical Replication permissions and configuration were carefully validated during source setup
- Hevo “Models” were intentionally not used, as the requirement explicitly asked for dbt-based modeling

### Resources:
- Hevo documentation on connecting to local databases  
  https://docs.hevodata.com/sources/dbfs/databases/connecting-to-a-local-db/

- Hevo Data – End-to-End Data Pipeline Overview (YouTube)  
  https://youtu.be/c8vDsROHQKY

- dbt Fundamentals & Analytics Engineering Concepts (YouTube)  
  https://youtu.be/RkECNtyo7CM

- Learn more about dbt in the official docs  
  https://docs.getdbt.com/docs/introduction

