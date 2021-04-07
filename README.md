# Jungle
A mini e-commerce application built for the purposes of learning Rails. Built with Rails 4.2, Bootstrap 3, PostgreSQL. 

Tested with Rspec, Capybara, phantomJS. 


## Features
* Add products to your cart, checkout with Stripe.
  * If enabled, receive a confirmation email.
* Create an account, and log in. 
* Administrative features like adding categories, adding and deleting products.
* Validations with alerts on creation of new:
  - users
  - sessions
  - products
  - categories

## Screenshots
Home page:

![home page](/README_ASSETS/homepage.png)

Product details page:

![product details page](/README_ASSETS/productpage.png)

Navbar:

![navbar categories](/README_ASSETS/nav_categories.png)
![navbar admin](/README_ASSETS/nav_admin.png)

Signup and Login:

![signup](/README_ASSETS/signup.png)
![signup alert](/README_ASSETS/signup_alert.png)
![login alert](/README_ASSETS/login_alert.png)

Cart and Stripe:

![cart](/README_ASSETS/cart.png)
![stripe](/README_ASSETS/stripe.png)

Order Confirmation:

![order confirmation](/README_ASSETS/order_confirmation.png)

Admin:
![admin products](/README_ASSETS/admin_products.png)
![admin new product](/README_ASSETS/admin_newproduct.png)
![admin new product alerts](/README_ASSETS/admin_newproduct_alert.png)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` from a copy of `config/database.example.yml`
3. Create `config/secrets.yml` from a copy of `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Setup To Actually Send Emails

1. Create `config/email.yml` from `config/email.example.yml`
  - make sure to update email credentials with the desired email
2. Uncomment lines 21/22 in `config/environments/development.rb`


## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
* See Gemfile for other minor dependencies
