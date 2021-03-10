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

![Schema](https://github.com/jlfoxcollis/rails-engine/blob/main/schema.png)

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

*Refer to the root page for endpoints and query parameters


<!-- CONTACT -->
## Contact

James Fox-Collis - [Linkedin](https://www.linkedin.com/in/james-fox-collis/) - jlfoxcollis@gmail.com

Project Link: [Sweater Weather Repo](https://github.com/jlfoxcollis/sweater_weather)



<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements
* [Choose an Open Source License](https://choosealicense.com)
* [Font Awesome](https://fontawesome.com)
* [Best-README-Template](https://github.com/othneildrew/Best-README-Template)
