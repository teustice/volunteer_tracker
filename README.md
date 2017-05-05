# _Volunteer Tracker_

#### _Application for tracking what projects volunteers are working on, 5/5/2017_

#### By _**Tanner Eustice**_

## Description

_This app tracks a list of projects, and volunteers that the user creates. The user can associate a volunteer with a specific project_

## Setup/Installation Requirements
_run 'bundle' in the project directory to install gem dependencies_

_Connect to Postgres and run the following commands to generate the necessary database:_
* _create database volunteer_tracker;_
* _create table volunteers (volunteer_id uuid primary key, name varchar, project_id uuid);_
* _create table projects (project_id uuid primary key, name varchar);_
* _create table hours (id uuid primary key, project_id uuid, volunteer_id uuid, date_worked date, hours int);_
* _create database volunteer_tracker_test with template volunteer_tracker;_

## Known Bugs

_There is an issue where input including a ' character will cause an error._

## Support and contact details

_If you have any questions, contact me at teustice@msn.com_

## Technologies Used

_HTML_
_CSS_
_Ruby_
_Sinatra_
_Rspec_
_Capybara_
_Postgres_

### License

*MIT*

Copyright (c) 2017 **_Tanner Eustice_**
