# README

## Setup

- Install the ruby version defined in the `.ruby-version` file
- Make sure you have bundler installed `gem install bundler`
- Install PostgreSQL: either with `brew install postgresql` or download the [Postgres.app](http://postgresapp.com/)
- Clone the project: `git clone https://github.com/Alliants/hoozzi.git`
- `cd` into the project directory: `cd hoozzi`
- Setup the project: `bin/setup`

## Running the application

`$ rails s`

The default admin user's credentials are:

```
email: admin@alliants.com
password: 12345678
```

This user is added when you run `bin/setup`.

## Running the tests

`$ bundle exec bin/test`

The CI runs `bin/test` which does use the standard test frameworks CLI runners.
Consequently running `$ cucumber` locally will run slightly different to the CI.

In order to run individual parts of the suite:
```
$ bundle exec bin/test rubocop
$ bundle exec bin/test rspec
$ bundle exec bin/test cucumber
```

## Component Styleguide

The [`livingstyleguide`](https://livingstyleguide.org/) gem is used to generate a component styleguide from the `.lsg` files in `/assets/stylesheets/`. To view the styleguide, run `rake styleguide:compile`, ensure the rails server is running and visit http://localhost:3000/styleguide.html

### Live compilation

When writing and documenting SCSS styles, you can use `guard` to watch for changes and automatically compile the styleguide.

`bundle exec guard`

Guard watches `.scss` and `.lsg` files, and triggers when new files are created, files are deleted and existing files are modified. When it triggers, the styleguide will be compiled and SCSS will be validated (using `guard sass`).

To stop guard type `exit`.
