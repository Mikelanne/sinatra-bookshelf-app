# Sinatra App Plan

## Pre-Coding
- What do you want to build?
    I am going to build an app that keeps track of all the books on my to-read list. These are books I own, sitting on my bookshelf, unopened. I will be able to add books to the list as I buy more, and I will be able to remove books/check them off maybe? as I read them.
- Wireframing & User Stories
    - Models, their attributes, their associations
        - User model --> username, password. --> A user has many books
        - Book model --> title, author, genre, bio --> A book belongs to a user
- MVP
    - The basic app - User class, book model, description above
- Stretch Goals
    - Another class for books worthy of a reread!
        Reread Class --> title, author, genre, why reread? More investigation? Just plain old fun?
    - Style specific to book lovers - quotes by famous authors as footnotes if I can do that, maybe some images of libraries, etc.

## Time to Code

- Build models
    - Migrations - DONE
    - Model Classes - DONE
    - Associations and Validations - DONE

- Test your models and associations in the controller
    - create some seed data - DONE
    - adjust migrations as needed - N/A

## Controllers and views

- Start with your ApplicationController helpers - #logged_in? and #current_user
    - add your login/signup/signout routes

- Build out controller routes for other models (add controller for each model)

- Build views and controller actions based on the flow of your app, one step at a time, testing as you go.

## CRUD functionality -> Book class

# Create
## New
- displays the form to make the new Book
- get /books/new
- new.erb

## Create
- processes the form and it actually makes and saves the Book
- post /books
- no view, redirects to show for that thing or index
- Book.create

# Read
## Index
- show all of the things
- get /books
- index.erb
- Book.all

## Show
- details on one of the things
- get /books/:id
- show.erb
- Book.find_by(id: params[:id])

# Update
## Edit
- displays the form to change one thing
- get /books/:id/edit
- edit.erb
- Book.find_by(id: params[:id])

## Update
- proccesses the form and makes the change
- patch /books/:id
- no view, redirects to show
- instance = Book.find_by(id: params[:id])
- instance.update(params[:key])


# Delete
## destroy
- process the form and destroys the thing
- delete /artists/:id
- no view, redirect to index
- instance = Model.find_by(id: params[:id])
- instance.destroy