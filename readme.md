This project is a simple web application built using the Rack framework in Ruby. This app is still in development, so some features might not work properly yet (especially the ones regarding the users, since it they were added recently).

1. **Purpose**:

   - It's a demontration of a small-scale application showcasing basic CRUD (Create, Read, Update, Delete) operations for managing expenditures and users.
   - It's a part of a college project related to web development and database management.
   - It's supposed to let me gather better understanding of underlying components of the Ruby on Rails framework.

2. **Main Technologies**:

   - **Language**: Ruby
   - **Framework**: Rack (a minimalistic web framework for Ruby)
   - **Database**: SQLite database based on the `data.db` file which should be located in the root directory.
   - **Frontend**: HTML with embedded Ruby (ERB) for views/templates.

3. **Directory Structure**:

   - **`app/`**: Contains the main application logic.
     - **`controller/`**: Contains controllers for handling different routes.
     - **`db/`**: Contains database-related files.
       - **`migrations/`**: Database migration files for setting up the database schema.
       - **`operations/`**: Contains classes for common database operations.
     - **`model/`**: Contains model classes representing database tables.
     - **`views/`**: Contains HTML templates for rendering views.
   - **`application.rb`**: Main application file where the Rack application is defined.
   - **`data.db`**: SQLite database file.
   - **`rack_server.ru`**: Rackup file to run the Rack application.

4. **Code Organization**:

   - **Controllers**: Responsible for handling HTTP requests and responses.
   - **Models**: Represent the data structure of the application.
   - **Views**: Contains HTML templates for rendering different views like index, new, show, etc.
   - **Database Migrations**: Used for managing changes to the database schema over time.
   - **Router**: Defines the how specific routes should be mapped to the appropriate controller actions.

5. **Usage**:

   To get started with the application, you need to perform a few steps to ensure everything is set up correctly.

   - **Running Migrations**:
     For demonstration purposes there is data.db file attached, but if you want to run migrations, you shoud delete it. Next in the root directory of the project, execute the following command:

     ```
      ruby app/db/migrations/0_create_database.rb

      ruby app/db/migrations/1_create_expenditure.rb

      ruby app/db/migrations/2_create_user.rb
     ```

     This commands will execute specific migrations, setting up your database.

   - **Starting the Application**:
     Once the database is ready, you can start the application server. In the root directory of the project, execute the following command:

     ```
      rackup rack_server.ru
     ```

     This command starts the Rack server, making the application accessible. By default, the application will be available at `http://localhost:9292`. You can now open this URL in your web browser to interact with the application.
