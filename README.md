# together

A new Flutter project.

## Getting Started
## 0. Features
1. Discovery Page displaying items from a mock API.
2. Pagination support for loading more items as the user scrolls.
3. Graceful error handling for network failures or API errors.
4. Visually appealing UI design with gradient backgrounds for each card.
5. Smooth animations and transitions for loading and scrolling.
6. Implementation of Flutter best practices and adherence to the Flutter style guide.
7. Testing for various scenarios including edge cases.
8. Comprehensive documentation including code comments, development choices, and instructions for running the app.

## 1.Development Choices:
Random Colors Scheme and Dark Light mode:
Chose a random color scheme to create a visually appealing UI.
Used MaterialColor to define various shades of pink for consistent theming.
API Integration:
Implemented API integration using the http package for fetching discovery data.
Utilized the jsonDecode function to parse JSON data returned by the API.
Handled potential errors gracefully by catching exceptions during API requests.
Pagination Logic:
Implemented pagination logic to load more items as the user scrolls.
Detected when the user reaches the bottom of the list to trigger loading of additional items.
Stopped loading items when the API returns an empty response indicating the end of the list.
UI/UX Design:
Designed the discovery page with a ListView of ListTile widgets to display discovery items.
Applied smooth animations and transitions, including loading indicators during data fetching.

## 2. Screenshots:

<img width="408" alt="Screenshot 2024-02-17 at 10 09 11 PM" src="https://github.com/deveshksh/together/assets/98409295/ec82a523-0422-47c8-ab82-80c8ea96480f">
<img width="408" alt="Screenshot 2024-02-17 at 10 25 08 PM" src="https://github.com/deveshksh/together/assets/98409295/71e73a79-e909-48fc-ae78-2d19fed0d85c">

## 3. Instructions for Running the App:
Clone the project repository from GitHub.
Open the project in your preferred IDE (e.g., Visual Studio Code).
Ensure Flutter SDK is installed and configured.
Run flutter pub get to install dependencies.
Connect a device or start an emulator.
Run the app using flutter run.

## 4. Additional Information:
This Flutter app is a simple discovery page that fetches data from a mock API.
It demonstrates pagination, error handling, and UI/UX design principles.
Feel free to explore and modify the code to suit your needs!

## Conclusion:
By documenting your Flutter app in this way, you provide valuable insights into the development process, showcase the app's features with screenshots, and offer clear instructions for running the app, ensuring a smooth experience for users and developers alike.
