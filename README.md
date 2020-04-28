# Twitter-redesign

> This project is based on a redesign of Twitter. You can create a user, tweet about birds and follow people you like!

## Views

![Login Path](/public/signin.png)
![Signup Path](/public/signup.png)
![Home Path](/public/home.png)
![Profile Path](/public/profile.png)
![Edit Path](/public/edit.png)

## Features

- The user logs in to the app, only by typing the username
- The user is presented with the homepage
- The Left-side menu includes only links to Home and profile
- In the Homepage:
  - *Tweets* tab are in the center(sorted by most recent) with a simple form for creating a tweet, to publish must use the "enter"
  - All the tweets are sorted by most recent that display the tweet text and author details
  - Right-side section shows who to follow, users not followed by the logged user(sorted by most recent)
- In the profile page
  - In the the center there's only Cover picture and *Tweets* tab
  - Right-side section shows:
      - User photo.
      - Button to follow a user.
      - Stats: total number of tweets, number of followers and number of following users.
      - List of people who follow this user

## Built With

- Ruby v2.7.0
- Ruby on Rails v5.2.4

## Live Demo

[Live Demo Version](https://nameless-mesa-62075.herokuapp.com/)

### Prerequisites

Ruby: 2.6.3
Rails: 5.2.3
Postgres: >=9.5

### Setup

Install and update gems with:

```
bundle install
bundle update
```

Setup database with:

```
   rails db:create
   rails db:migrate
```

### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.

### Run tests

```
    rpsec --format documentation
```

> Tests will be added by Microverse students. There are no tests for initial features in order to make sure that students write all tests from scratch.

## Author

👤 **Brenda Yucra**

- Github: [@bren2102](https://github.com/bren2102) 
- Twitter: [@BrendaYucra2](https://twitter.com/BrendaYucra)
- Linkedin: [Brenda Yucra](https://www.linkedin.com/in/brenda-yucra-51980681/)

## Credits

Thanks to [Gregoire Vella](https://www.behance.net/gregoirevella) and other on Behance for her awesome design work. I based my work on [this design](https://www.behance.net/gallery/14286087/Twitter-Redesign-of-UI-details).

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!
