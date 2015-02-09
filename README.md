# What's for Lunch?

This is a simple application that provides recommendations on where you should go to lunch today.

To install, `git clone` the application, `cd` into the application directory, and

```
$ bundle install; rake db:migrate
```

Start your server:
```
$ rails s
```

and you should be ready to go by navigating to `http://localhost:3000`.

You'll first create an account, then add restaurants. Once you've added at least one restaurant,
you can receive a recommendation on where to eat today.

To verify all tests pass, run:
```
$ bundle exec rspec
```