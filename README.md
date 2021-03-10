<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgements">Acknowledgements</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

Sweater Weather is a rails backend API, built with the purpose of letting a front end application consume endpoints to build out a travel application.  This allows a consumer to check current/future weather forecasts in their location.  Plan trips, and see the expected weather upon arrival.  A consumer is able to create an account, and in the future they can hopefully save trips and weather forecasts.


### Built With

This project was built on the Rails framework and tested with rspec and Brakeman for security vulnerabilities.

* [Rails](https://rubyonrails.org/)
* [Ruby](https://www.ruby-lang.org/en/)
* [Brakeman](https://github.com/presidentbeef/brakeman)
* [fast_jsonapi](https://github.com/Netflix/fast_jsonapi)



<!-- GETTING STARTED -->
## Getting Started

This project is currently not deployed with any online platforms.  So in order to utilize these data endpoints you will have to Fork/clone and test the endpoints locally.

### Prerequisites

* Ruby 2.5.3
* Rails 5.2.4.3
* Postgresql (Most recent version)

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/jlfoxcollis/sweater_weather.git
   ```
3. Install dependencies
   ```sh
   bundle install
   ```
4. create DB and seed
  ```sh
  rake db:{drop,create,migrate}
  ```
5. Launch local server
  ```sh
  rails s
  ```




<!-- USAGE EXAMPLES -->
## Usage
### These are the approved endpoints and allowed parameters
### The Content-Type: and Accept: must both be application/json
[![Run in Postman](https://run.pstmn.io/button.svg)](https://god.postman.co/run-collection/5eca6f1ea028f2e85d10)
```
GET /api/v1/forecast
params: location=Denver,CO
location must be city and state separated by a comma, no spaces.
```
Expected response:
```
{
  "data": {
    "id": null,
    "type": "forecast",
    "attributes": {
      "current_weather": {
        "datetime": "2020-09-30 13:27:03 -0600",
        "temperature": 79.4,
        etc
      },
      "daily_weather": [
        {
          "date": "2020-10-01",
          "sunrise": "2020-10-01 06:10:43 -0600",
          etc
        },
        {...} etc
      ],
      "hourly_weather": [
        {
          "time": "14:00:00",
          "conditions": "cloudy with a chance of meatballs",
          etc
        },
        {...} etc
      ]
    }
  }
}
```

```
GET /api/v1/backgrounds
params: location=Denver,CO
location must be city and state separated by a comma, no spaces.
```
Expected Response
```
{
  "data": {
    "type": "image",
    "id": null,
    "attributes": {
      "image": {
        "location": "denver,co",
        "image_url": "https://pixabay.com/get/54e6d4444f50a814f1dc8460962930761c38d6ed534c704c7c2878dd954dc451_640.jpg",
        "description": "sample description by the pictures author",
        "credit": {
          "source": "pixabay.com",
          "author": "quinntheislander",
        }
      }
    }
  }
}
```

```
POST /api/v1/users
JSON payload must be in the following structure:
  { "users": {
    "email": "admin@example.com",
    "password": "example",
    "password_confirmation": "example"
    }
  }
```
Expected Response
```
{
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
  }
}
```

```
POST /api/v1/sessions
JSON payload must be in the following structure:
  { "users": {
    "email": "admin@example.com",
    "password": "example",
    }
  }
```
Expected Response
```
{
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
  }
}
```

```
POST /api/v1/road_trip
JSON payload must be in the following structure:
  { "road_trip": {
    "origin": "Denver,CO",
    "destination": "Anchorage,AK",
    "api_key": "your_user_api_key"
    }
  }
To get an api_key, you must first create an account outlined above.
origin and destination must be city and state separated by a comma, no spaces.
```
Expected Response
- Note that if the route provided has any road closures, the route will be considered impossible.
```
{
  "data": {
    "id": null,
    "type": "roadtrip",
    "attributes": {
      "start_city": "Denver, CO",
      "end_city": "Estes Park, CO",
      "travel_time": "2 hours, 13 minutes"
      "weather_at_eta": {
        "temperature": 59.4,
        "conditions": "partly cloudy with a chance of meatballs"
      }
    }
  }
}
```
<!-- CONTACT -->
## Contact

James Fox-Collis - [Linkedin](https://www.linkedin.com/in/james-fox-collis/) - jlfoxcollis@gmail.com

Project Link: [Sweater Weather Repo](https://github.com/jlfoxcollis/sweater_weather)



<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements
* [Choose an Open Source License](https://choosealicense.com)
* [Font Awesome](https://fontawesome.com)
* [Best-README-Template](https://github.com/othneildrew/Best-README-Template)
