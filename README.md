# README

## System Requirements
* Ruby version - 3.2.0
* Rails version - 6.1.7.2


##Setup

1. Clone this repo locally
2. Execute the following commands in your terminal. These are required to get set up.
`
rake db:seed
export NODE_OPTIONS=--openssl-legacy-provider
rm -rf node_modules
rails assets:clobber
yarn
rails assets:precompile
`


3. Execute the following command in your terminal to start the server `rails s`

Once complete, you should be able to access `localhost:3000` and see the standard rails welcome screen


## Interacting with the Models

Once the service is up, the cars should be accessible at `localhost:3000/cars` and the people should be available at `localhost:3000/people`. You should see information populated there from running `rake db:seed` in the setup.

If you click on to any of the existing models, you will see all the details of the model and the ownership history associated with that model. For people, it will show what cars they purchased, and for cars it will show which people have purchased it over time.
