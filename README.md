# GitHub Repositories Viewer

GitHub Repositories Viewer is a Flutter application that fetches and displays popular GitHub repositories using the GitHub GraphQL API. Users can filter repositories by programming languages and view repository details such as name, description, and star count. The app uses BLoC (Business Logic Component) for state management and `graphql_flutter` to interact with the GitHub GraphQL API.

## Features

- Fetch popular repositories from GitHub on app startup.
- Filter repositories by programming languages using a dropdown list.
- Display repository details such as name, description, and star count.
- Handle errors during data fetching and UI rendering.

## Requirements

- A GitHub Personal Access Token with the required permissions to access the GitHub GraphQL API.

## Getting Started

### Prerequisites

- Flutter SDK installed on your machine.
- A GitHub Personal Access Token. You can generate one from [GitHub Settings](https://github.com/settings/tokens).

### Installation

#### 1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/github-repositories-viewer.git
   cd github-repositories-viewer
```

#### 2. Install dependencies:

```bash
flutter pub get
```


#### 3. Create a .env file in the root directory and add your GitHub Personal Access Token:

```
GITHUB_PERSONAL_ACCESS_TOKEN=your_personal_access_token
```