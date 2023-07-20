# Meals App

This is a Flutter-based mobile application designed for self-learning purposes.
The application allows users to browse through various meal categories,
view detailed information about meals, apply filters, and mark meals as favorites.

<img src="https://github.com/NetanelVinter/meals_app/assets/118343887/0210121f-8fe6-4284-be25-7e9b8fe1da8b" width="500">

## Project Structure

The project is structured into several key directories:

- `main.dart`: This is the entry point of the Flutter application.

- `models/`: This directory contains classes that define the data structure of the objects used in the app. Current models include `Category` and `Meal`.

- `screens/`: This directory contains the different screens/pages of the app. Current screens include `HomeScreen`, `CategoryScreen`, `CategoryMealsScreen`, `DetailScreen`, `FavoriteMealsScreen`, `FiltersScreen`, and `LoginScreen`.

- `widgets/`: This directory contains reusable widget classes. Current widgets include `CategoryItem`, `MealItem`, `MealItemTrait`, `DrawerItem`, and `EmptyMeals`.

- `providers/`: This directory contains the app's state management code using the Provider package. Current providers include `FavoriteMealsProvider`, `CategoryMealsProvider`, and `FilterProvider`.

- `data/`: This directory may contain data that the app uses.

- `constant/`: This directory contains file(s) that define constant values used across the app.

<img src="https://github.com/NetanelVinter/meals_app/assets/118343887/0cec8c04-7bc5-409d-9a93-81bc0b030842" width="500">

## State Management

This project uses the Provider package for state management. The application's state is managed by several providers located in the `providers/` directory:

- `FavoriteMealsProvider`: Manages the state of meals marked as favorites by the user.
- `CategoryMealsProvider`: Manages the state of meals within a specific category.
- `FilterProvider`: Manages the state of the meal filters applied by the user.

Each provider is responsible for managing a specific part of the application's state, and widgets throughout the app can access and manipulate this state as needed.

## Installation

Since this is a self-learning project, there isn't a publicly available installation method. However, an APK file was built for personal testing.

## Dependencies

The project uses the following dependencies:

- Flutter SDK
- Dart
- Flutter Riverpod for state management
- Google Fonts for typography

## Usage

Open the app to view a list of meal categories. You can click on a category to view the meals within that category. Each meal can be clicked on to view its detailed information. You can also mark meals as favorites and apply filters based on your preferences.

<img src="https://github.com/NetanelVinter/meals_app/assets/118343887/e2de6911-ee66-4ff1-ae36-f6259609ffda" width="500">

Please note that the actual functionality may vary as this description is based on the project's code structure.

## Screenshots

Here are some additional screenshots of the application:

<img src="https://github.com/NetanelVinter/meals_app/assets/118343887/3cf67cf6-30dc-447d-b564-29bc9af5ad02" width="500">

## Contributing

As this is a personal, self-learning project, contributions will not be accepted.
