Jaffle Shop Analytics DBT project

### This Project was built off the training on DBT Fundamentals.

In this dbt project, data transformations were done against a **Snowflake Data Warehouse** to Transform RAW DATA in a Database into an Analytical Warehouse.
 - Various models (staging models) and (core models) were built.
 - Tests were done against business logics to ensure data integrity.
  - Generic tests across models and one Singular test on the stg_payments model to ensure that;
   - primary keys were unique & not null.
   - relationships were properly established between models which would be materialized into tables.
 - Final (Gold models- Facts & Dimensions) were materialized as tables .
 - staging models were materialized as views.

### Development & Deployment
  - Transformations during development were done in a seperate branch while DBT Jobs were used to ship the code to **production (main)** branch. This aids for **CI/CD** purposes and collaboration in **analytics engineering**.

  - Transformations during **testing/development** were done against a different schema while final deployment/production after validations on tests were passed, were done against the dbt_prod schema.

### Documentation
 - The documentation in dbt cloud is domicile in the **.yml** files 
 - some yml files reference some .md files within the same folder for extensive formating.
 - documentation is included for models, tables and even columns

### Dependencies
 - Dependencies were enforced between models using the **ref {{}}}** function.
 - Dependencies transcend from sources to staging models to final data artifacts all inplemented in SQL.

### Job Runs and Notification
 - In the Production Environment, DBT was configured to send email notification after a job runs whethere it was a failure or success.
 - Jobs were scheduled to run on demand.
 - DBT also provides logging information to see the details of each peice within the job run.


### Resources:
- Learn more about dbt [in the official docs](https://docs.getdbt.com/docs/introduction)