# Essex OCS

The beginnings of a very basic proof of concept / prototype for a digital assistant
to help older people in Essex who are due to leave hospital.

# Development

## Prerequisites

* PostgreSQL
* Ruby 2.5.1+

## Setup

### Clone the repo

```
git clone https://github.com/wearefuturegov/essex_ocs.git
```

### Install dependencies

```
npm install # This installs the GDS frontend styles / JS, though this look and feel will change (probably using the Essex fork of GDS frontend)
bundle install
```

### Setup database

```
bundle exec db:setup
```

### Run server

```
bundle exec rails s
```

The server is now running at http://localhost:3000

# Setup

This is a very rough and ready prototype done in a day or so. Not many tests, and very limited
in scope, but totally ready to build on.

At the moment, the questionnaire is populated from a YAML file in `config/questions.yml` which
specifies the possible answers for each question. All that happens so far is that users are
presented with what they've chosen. Next steps are to find and display relevant information based
on those inputs!
