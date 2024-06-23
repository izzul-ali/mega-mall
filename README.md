# Mega Mall

This Flutter application follows the Clean Architecture principles and utilizes the Bloc pattern for state management. The app fetches products list from the open source API Products, displays them, and provides the option like cart, wishlist and login credential, and save the data to a local SQLite database.

Some features in this application may not have been fully completed, such as authentication features, checkout, etc. However, I think some of the features that are available are <b>```sufficient or in accordance```</b> with the instructions given.

### Architecture Overview

The project follows the Clean Architecture principles, separating the app into different layers:

- **Presentation Layer**: Contains the Flutter widgets, Blocs, and UI-related logic.
- **Domain Layer**: Contains business logic and use cases.
- **Data Layer**: Manages data sources such as APIs and local databases.

### State Management

The app uses the Bloc pattern for state management. Blocs are responsible for managing the application's state and business logic.

### Service Locator

The `get_it` package is used as a service locator for dependency injection. It helps manage the app's dependencies in a clean and organized way.

### API Requests

Http is used for making API requests to the Products API.

### Dart Object Comparison

The `equatable` package is employed for efficient comparison of Dart objects. This is particularly useful when working with Blocs and state changes.

### Local Database

The app uses the sqflite library to interact with a local SQLite database. Cart, Wishlist, Login data can be saved to the local database for offline access.


## Features

- [x] List Product, Cart and Wishlist
- [X] Search Product
- [x] CRUD in Cart menu
- [x] Add & Remove Wishlist
- [x] Login Form Validation

## Library

1. ```go_router``` - Manage app routing
2. ```flutter_bloc``` - To integrate blocs and cubits into Flutter
3. ```sqflite``` - To access the sqlite database
4. ```equatable``` - To compare objects in Dart
5. ```http``` -  To consume HTTP resources
6. ```get_it``` -  Simplify dependency management and improve the structure Flutter applications

## Resource

[Figma Design](https://www.figma.com/community/file/1020869651724237430/e-commerce-mobile-apps?searchSessionId=lxfkfx1a-rkuz0emwqel)
<br/>
[Api Product](https://fakestoreapi.com)

## Preview

#### Product List & Search Product
  


https://github.com/izzul-ali/mega-mall/assets/110296589/4daa88e7-7237-499d-8f52-b8798250a8f1


#### CRUD - Cart </br>


https://github.com/izzul-ali/mega-mall/assets/110296589/b7d8ec85-8fef-44d3-8e13-82c9c1f3e0da



#### Add & Remove Wishlist
  

https://github.com/izzul-ali/mega-mall/assets/110296589/8e9323d4-8dd0-48fd-9cd5-da98652eb2fb



#### Login Form Validation

  

https://github.com/izzul-ali/mega-mall/assets/110296589/3a30fc98-490b-430c-b98a-08fcbfdc92c7


## Getting Started

1. Clone the repository:

   ```bash
   git clone https://github.com/izzul-ali/mega-mall.git

2. Navigate to the project directory:
    ```bash
    cd your-repo

3. Install dependencies:
   
   ```bash
   flutter pub get

4. Run the app:
   
   ```bash
   flutter run
