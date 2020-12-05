# Cooking by the Book

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description

Our goal is to create an online cookbook full of recipes. This  app will allow users to sign in and post their favorite recipes and view other recipes that other people might enjoy.

Joey Thomas, 
Edgar Reyes, 
Nick Tralongo, 
Nathan Latronica

### App Evaluation
- **Category:** *Food & Drink / Utility App*
- **Mobile:**   * This apps main focus is for  IOS mobile usage however it could definitely be just as good on a computer as a web app. Similar apps include Instagram, and Twitter.*
- **Story:**    * Create a platform were users can connect and share their favorite recipes. Users can add their own personal recipes and save some recipes from others that they want to try out.*
- **Market:** *Anyone can use the app and share what they cook.*
- **Habit:** * This app could be used multiple times a day based on how many times you want to try new recipes and or look for future recipes to try.*
- **Scope:** *Initially this is to be used as a cookbook app were you save recipes you want to try. This could evolve into a social media app in which you can follow other people to see what they are cooking.*

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* Launch Screen
* Main Screen
* Authentication
* Recipe Feed
* Profile page
* Saved posts page
* Add Recipe Page

**Optional Nice-to-have Stories**

* Commenting
* Searching Recipes
* Preparation steps

### 2. Screen Archetypes

* Main Screen
   * Presents a screen which prompts the user to either sign up or sign in to a previous account made.
* Sign In
    * Presents the user with two text boxes, username and password, prompting them to put in their credentials to log in.
* Sign Up
    * Presents the user with two text boxes, username and password, prompting them to put in their credentials to create an account to sign up with.
* Recipe Feed
    * Upon signing into their account, the user is then presented with a multiple recently posted recipes within a feed.
* Detailed Recipe View
    * Upon clicking on a recipe from the feed, profile page, or saved recipes pages. It presents the user with details about a recipe.
* Profile Page
    * Upon selecting the profile page tab the user is presented with all of the recipes that the account has posted.
* Saved Recipes Page
    * Upon selecting the saved recipes tab the user is presented with all of the recipes that the account has saved.
* Add a Recipe
    * When clicking the add recipe button the user should be prompted to add a new recipe with an image, ingredients, and preparation steps to make the food.



### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Recipe Feed
* Profile
* Saved Recipes

Optional:

* Search Recipes

**Flow Navigation** (Screen to Screen)

* Launch Screen
   * Forced Log In/Sign Up if account is not currently signed into application.
   * If signed in, Recipe Feed is shown.
* Recipe Feed
   * Profile Tab Item segues into user Profile page.
   * Saved Recipes Tab Item segues into Saved Recipes page.
   * Recipe Table Cell segues into Detailed Recipe page.
   * Add Recipe Button segues into Add Recipe Page.
* Profile
   * User Grid View Cell contains user-uploaded recipes. Tapping on Cell segues into a Detailed Recipe page for user's recipe.
   * Recipe Feed Tab Item segues into Recipe Feed page.
   * Saved Recipes Tab Item segues into Saved Recipes page.
* Saved Recipes
   * User Grid View Cell contains user-saved recipes. Tapping on Cell segues into a Detailed Recipe page for saved recipe.
   * Recipe Feed Tab Item segues into Recipe Feed page.
   * Profile Tab Item segues into user Profile page.
* Detailed Recipe
   * Recipe Feed Tab Item segues into Recipe Feed page.
   * Profile Tab Item segues into user Profile page.
   * Saved Recipes Tab Item segues into Saved Recipes page.
   * Back Button segues back into previous screen.


## Wireframes

### Digital Wireframes & Mockups
<img src="https://raw.githubusercontent.com/Cooking-by-the-Book/Cooking-by-the-Book/main/wireframe.PNG" width=600>

### [BONUS] Interactive Prototype

## Schema
### Models


#### Recipe

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | objectId      | String   | unique id for the user recipe (default field) |
   | name          | String   | name of the recipe |
   | author        | Pointer to User| recipe author |
   | image         | File     | image of recipe that user posts |
   | ingredients   | String   | ingredients required to make the recipe |
   | createdAt     | DateTime | date when recipe is created (default field) |
   | updatedAt     | DateTime | date when recipe is last updated (default field) |


   -----

   #### Author

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | objectId      | String   | unique id for the author (default field) |
   | name          | String   | name of the author |
   | password          | String   | password of the author to login |
   | savedPosts    | Array of Pointers   | array of saved recipes |
   | createdAt     | DateTime | date when post is created (default field) |
   | updatedAt     | DateTime | date when post is last updated (default field) |

### Networking
- Login
    - (Read/GET) Query to check if user with this password is in the database.
- Logout
    - (Sign-out the current user)
- Home Feed Screen
    - (Read/GET) Query all recipes by date
    - (Create/POST) Save a recipe
    - (Delete) Go in for the current user and delete the saved post from the array.


- Create Post Screen
    - (Create/POST) Create a new recipe object


- Profile Screen
    - (Read/GET) Query logged in user object
    - (Read/GET) Query all recipes created by the current user by date


- Saved Recipes Screen
    - (Read/GET) Query logged in user object
    - (Read/GET) Query all recipes saved by the user


- [Create basic snippets for each Parse network request]
    - We do not have these created now, but we will have them when we get the basic snippets for them.


- [OPTIONAL: List endpoints if using existing API such as Yelp]

### Milestones

#### Milestone 1
<img src='https://raw.githubusercontent.com/Cooking-by-the-Book/Cooking-by-the-Book/main/CbtB.gif' title='Video Walkthrough 1' width='' alt='Video Walkthrough 1' />

#### Milestone 2
<img src='https://raw.githubusercontent.com/Cooking-by-the-Book/Cooking-by-the-Book/main/CbtB2.gif' title='Video Walkthrough 2' width='' alt='Video Walkthrough 2' />
