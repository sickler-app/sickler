# Sickler

A Sickle Cell Help App


## Important Dev Guides

Below are some general rules and guidelines as we develop this app. This is to ensure a clean and seamless developer experience.

- Our app will be hosted in the `Sickler` Organisation. Please create a fork from the main organisation repository.


- We have set up two branches, `main` and `dev` (development). Our development work, new features, untested and experimental code would live in the `dev` branch.


- Please endeavour to fork both branches when forking the repository by disabling the `fork main branch only` checkbox.


- The `main` branch would contain fully working, tested and complete code. Branch protection rules have been set up on the `main` branch to disable pushing directly. Please do not work directly on the `main` branch 🙏


- Work on new features e.g. `authentication` should be done by creating a branch from the `dev` branch on your own fork of the repository. Once the feature is completed, create a Pull Request to merge into `dev`. 


- We would periodically Merge working code from `dev` into `main`, probably after a set milestone. 


- For PRs, a simple CI pipeline would be setup to build and test the code before merging.


- If you can, please endeavour to write tests for your code. Basic unit tests that pass are enough for the time being. No need to get too complicated


- Please follow the linting guidelines, and rules as well. Just run `dart fix --apply` to fix all linting issues 😉  

All of this is in an effort to always have good working code in our `main` branch and to keep a clean and simple commit history. Feel free to play around with your own fork of the repository, and have as many commits as you need. Commits would be squash-merged when PRs are created into a single meaningful commit.



## Brief Overview of Project Structure

Here's a brief overview of the project structure. Our project would have this basic structure and directories within the `lib` directory.

### `core`
- This holds some general stuff needed across the entire app, e.g. constants, theming, custom exceptions/errors, extension methods, translations etc.

### `models` 
- `example_model.dart`

  This holds our models and custom classes

### `providers`
- `example_provider.dart`

  Each provider can be placed in its own directory if need be. (for example if is has multiple files relating to that provider)
  

### `repositories`
- `example_repository.dart`

    Each repository can be placed in its own directory if need be (for example if is has multiple files relating to that repository)

### `services`
- `example_service.dart`

    This would contain our services, e.g. code that mainly just gets data, e.g. auth logic, database storage logic, api client code etc.
 

### `screens`
  - `example_screen`

    All code related to a particular screen/UI would live in this directory. It has the following subdirectories.
    - `components`
    
        This directory would hold all the widgets created for this particular screen
    - `example_screen.dart`
    
        This is the actual dart file for this screen


## Contributors
- Nuibim Lewin
- Ngumih Fien
- Nuikweh Lewis
- Alouzeh Brandone

Thank you guys, for your understanding, and adherence to these guidelines.