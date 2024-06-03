# University Browser App

This is a university browser app built using VIPER architecture in Swift. The app all universities in http://universities.hipolabs.com and displays them as a list. Users can select a university to view its details.

## Features

- Fetches universities data from hipolabs API.
- Allows users to select a university to view its details.
- Browse offline cached universites.

## Architecture

The app follows the VIPER (View, Interactor, Presenter, Entity, Router) architecture pattern. Here's a brief overview of each component:

- **View**: Responsible for displaying the user interface and receiving user input. It communicates with the presenter to update the UI and respond to user actions.
- **Interactor**: Contains the logistics of the app. It communicates with the presenter to provide data fetched from the hipolabs API or cached info.
- **Presenter**: Contains the business logic of the app. It receives data from the interactor and formats it for display in the view. It also handles user actions from the view and communicates them to the interactor.
- **Entity**: Represents the data models used in the app. It defines the structure of the university objects fetched from the hipolabs API.
- **Router**: Handles navigation between different screens of the app. It determines which view to present and how to pass data between them.

## Installation

To run the app locally, follow these steps:

1. Clone the repository to your local machine.
2. Open the project in Xcode.
3. Build and run the project on a simulator or your physical iOS device.

## Contributing

If you would like to contribute to this project, you can follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Make your changes and commit them with descriptive commit messages.
4. Push your changes to your fork.
5. Create a pull request to the original repository.

Please ensure that your code follows the existing code style and conventions. Also, consider writing tests for any new features or bug fixes.

## License

This project is licensed under the [MIT License](LICENSE). Feel free to use and modify the code as per your requirements.

---

Thank you for using the University Browser App!
