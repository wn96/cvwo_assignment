# README

## Introduction

This to-do app is created with Ruby on Rails, and it's created for the CVWO 2018 holiday assignment.

### Name

Ang Wei Neng

### Matriculation Number

A0164178X

## Versions

* ruby 2.5.1
* rails 5.1.4
* boostrap-sass 3.7.7

## Deployment

This app is deployed on heroku, at <TO FILL IN>

## Running the app in local environment

Clone this repo:
```
$ git clone https://github.com/wn96/cvwo_assignment
```
Install all dependancies:
```
$ bundle install
```
Create database and run migration:
```
$ rake db:create db:migrate db:seed
```
Start the local server:
```
$ rails server
```
Now you can open this todo-list app in your browser at http://localhost:3000/.

## Authentication

### The username and password for a sample administrator account:

* User name: cvwo@cvwo.com
* Password: foobar

### The username and password for a sample user account:

* User name: example-{1-99}@cvwo.com
* Password: foobar
