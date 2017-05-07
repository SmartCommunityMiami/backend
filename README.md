# README

## Ruby version
 Ruby 2.3

# Smart Community
This is an application for the Miami-Dade area to be able to report, view, and vote on community issues within their county. It consists of an Android mobile app and a backend created with Ruby on Rails that includes an API and a MySQL database. This readme document details the backend and web part of the Smart Community application.

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites
#### What you need, and how to install it on a Mac.

* mysql:

	`brew install mysql`

* ruby on rails:

	[Click here to install rails](http://installrails.com)

### Installing
#### Installing the backend to run locally
* Set environmental variables for mysql database by setting:

	```
    export RDS_USERNAME=(must exist within application database)
    export RDS_PASSWORD=(must exist within application database)
    export RDS_HOSTNAME=localhost
	export RDS_PORT=3306
	```

* Install backend from SmartCommunityMiami’s GitHub in the desired directory:

		`git clone https://github.com/SmartCommunityMiami/backend.git`

* Enter the directory for the backend:

		`cd backend`

* Install any necessary gemfiles for the application:

		`bundle install`
	
* Create and seed the database:

		```
		rake db:create

		rake db:migrate

		rake db:seed
		```

* Run it with rails on localhost:

		`rails s`

#### Installing the backend to run on AWS
* Install backend from SmartCommunityMiami’s GitHub in the desired directory:

		`git clone https://github.com/SmartCommunityMiami/backend.git`

* From terminal, initialize the creation of the Elastic Beanstalk instance, and select these options during process:

		```
		eb init

		1: us-east-1

		smart-community

		y (to ruby)

		1: Ruby 2.3

		y (to enable ssh)

		1: aws-eb
		```

* Create the instance and select these options; this will fail initially until you create the RDS database:

		```
		eb create

		Environment name: smart-community-dev

		DNS-CNAME: smart-community-dev

		1: classic
		```

* At this point you can see the instance running in your EC2 instances on AWS

* Go to Elastic Beanstalk on AWS, select the red instance and follow these steps to create database (it will take approximately 30 minutes to create the database):

	* Click on instance (it should be red)
	* Choose configuration 
	* Scroll to bottom and select create new RDS database
	* Keep defaults, but set username to root and set password
    * Click submit
	* The health of your instance should turn green, as pictured above

* In terminal, set environmental variables:

		`eb setenv SECRET_KEY_BASE=rake secret`

* Deploy instance:

		`eb deploy`

* Seed the database:

		```
		eb ssh

		cd /var/app/current

		rake db:seed

		ctrl-d
		```

* Open the instance:

		```
		eb deploy

		eb open
		```

* You can now see the instance deployed

## Versioning
* Version 1.0

## Authors
* Amanda Hillegass
* Conor Murray
* Tami Lake
* Toni Boltz
	
## Contributors
* Blake Maune
* Rob Highbloom
* Stephen Psaradellis
* Sean Loftus
* Harper Chalat
	
## License
* This project is licensed under the Apache License 2.0 – See [LICENSE.txt](https://github.com/SmartCommunityMiami/backend/blob/master/LICENSE.txt) for more info.

