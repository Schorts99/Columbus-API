# README

## Requirements

- Ruby 3.0.1
- PostgreSQL 13.2

## TODO:

### Address

- Update action
- Destroy action

## Card

Save card token to avoid re enter card every time.

We are going to assume that the payment was processed with Stripe Checkout and we only receive confirmation that everything is fine and we do not store any data related to the card at the moment. 

## Before To Start

### Initial Setup

Install the project gems using Bundler.

```
bundle i
```

Setup database and add seeds

```
rails db:setup
```

## Running

Server will start running on port 3001

```
rails s -p 3001
```

## Testing

```
bundle exec spec
```
