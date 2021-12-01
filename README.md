# AQI Monitor

## How to run

This is a ruby on rails project.  These are instructions for running this locally on MacOS.  In your terminal run:

```
bundle
yarn
rake db:migrate
rails s
```

In your browser open:

```
https://localhost:3000
```

## What's implemented

- Sign up / Sign in / Sign out
- User can add a city and a threshold for PM 2.5 which are fine particulates
- User can edit their city and threshold
- User can delete their city
- Edge cases
  - City doesn't have any data available
  - Threshold should be a positive number
- Very basic permissions on the server

## TODO

- Give a 403 instead of a 500 if user tries to get other people's warnings (use something like warden to make the code cleaner)
- Search for available cities instead of open input.
- Send SMS notification if levels are higher than threshold (check daily with a cron job)
- Deploy somewhere
- Tests
