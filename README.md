# User Management System (UMS)

UMS is a single page web application that provides the functionality to create, update and delete users. Users can be sorted by any attribute and can be filtered via search field. All users are being shown through pagination view. All the operations are being done asynchronously and page will never reload.


## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Installing


* Ruby version
 2.5.3

 ```
 rvm install 2.5.3
 ```
* Database
postgresql

```
brew install postgres
```


* Clone the repository


```
mkdir UMS

cd UMS

git clone https://github.com/usmanasif/ums.git

cd ums
```

* Install Gems
```
bundle install
```

* Node version
v11.4.0

* Install Node version using NVM
```
nvm install v11.4.0
nvm use v11.4.0
```

* Install packages
```
yarn install
```


* Database creation

```
  rails db:create
  rails db:migrate
```

* Populate Database with dummy data
```
  rails db:seed
```
* Copy .env.example file and add the values of ENV
```
cp .env.example .env
```

* Run app locally on 3000 port

```
rails server
```

it will run the app on this url. Visit it and you can play with it
http://localhost:3000/

* How to run the test suite

```
rails test
```

### Gems and plugins
- Used minitest along with shoulda matchers gem for test coverage
- Used bootstrap 4 plugins for designing and responsive website
- Used datatable plugins For the UI of data view with searching, sorting and ordsering and handle the backend manually to implement search, sort and pagination funtionality

### Workflow and functionality

- User can see the all the users on root page
- User can search by name, email, status, last_updated, title using search bar above the table
- User can switch to different pages using Page numbers buttons
- User can sort the users being shown in the table view by clicking on the header of each column i.e. Click on `Name` will sort it in ascending order and if you click again on it, it will be sorted in descending order

