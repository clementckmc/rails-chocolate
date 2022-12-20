# 🍫 Choco Bittersweet

A web application storing users' favorite chocolate recipes and their ingredients. Users can also add ratings to recipes.

<img width="1440" alt="Screen Shot 2022-12-20 at 19 21 21" src="https://user-images.githubusercontent.com/46878585/208644304-23b23754-fc0f-4a41-9bfa-04eb0dcd5d2d.png">
App home: https://choco-bittersweet.herokuapp.com/
   
## Getting Started
### Setup

Install gems
```
bundle install
```
Install JS packages
```
yarn install
```

### ENV Variables
Create `.env` file
```
touch .env
```
Inside `.env`, set these variables. For any APIs, see group Slack channel.
```
CLOUDINARY_URL=your_own_cloudinary_url_key
```

### DB Setup
```
rails db:create
rails db:migrate
rails db:seed
```

### Run a server
```
rails s
```

## Built With
- [Rails 7](https://guides.rubyonrails.org/) - Backend / Front-end
- [Stimulus JS](https://stimulus.hotwired.dev/) - Front-end JS
- [Heroku](https://heroku.com/) - Deployment
- [PostgreSQL](https://www.postgresql.org/) - Database
- [Bootstrap](https://getbootstrap.com/) — Styling
- [Figma](https://www.figma.com) — Prototyping

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
This project is licensed under the MIT License
