# Users Management Application

This is a simple Ruby on Rails application for managing users. It allows you to add new users, list all users, and filter users by campaign names.

## Features

- Add new users with name, email, and campaigns list (in JSON format).
- List all users in a table with options to delete users.
- Filter users by campaign names.

## Prerequisites

- Ruby (version 2.7.2 or later)
- Rails (version 6.0 or later)
- MySQL

## Setup Instructions

### 1. Clone the Repository

`git clone https://github.com/raghav8126/campaign-user-api`
`cd campaign-user-api`

### 2. Install Dependencies

`bundle install`

### 3. Configure the Database

- Open config/database.yml and modify the development and test sections with your MySQL username and password.
- Create the database and run the migrations:

`rails db:create`
`rails db:migrate`

### 4. Start the Rails Server

```sh
rails server

