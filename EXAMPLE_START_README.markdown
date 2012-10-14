# Example Start README

These are the steps taken to reproduce the example_start application.

## Rails

Use 1.8.7 version of Ruby at this point to maintain compatibility. Install the latest version of Rails and generate a new application.

```
rvm use ree-1.8.7-2011.03@example_start --create
gem install rails
rails new example_start
```

## Git

We initialize the git repo and add everything right away. This helps us immediately see what changes we're making even on a fresh app.

```
cd example_start
git init .
git add .
```

## Start Rails

```
rails s
```

Read the getting started there. Make sure to remove public/index.html.

## Changes

These are the files which have been changed. Look within for comments starting with CHANGES to see what's been added. When possible additions are to the end of the file.

1. .rvmrc
2. Gemfile
3. `rails g active_admin:install`:

```
    invoke  devise
    generate    devise:install
      create    config/initializers/devise.rb
      create    config/locales/devise.en.yml
  ===============================================================================

Some setup you must do manually if you haven't yet:

  1. Ensure you have defined default url options in your environments files. Here 
     is an example of default_url_options appropriate for a development environment 
     in config/environments/development.rb:

       config.action_mailer.default_url_options = { :host => 'localhost:3000' }

     In production, :host should be set to the actual host of your application.

  2. Ensure you have defined root_url to *something* in your config/routes.rb.
     For example:

       root :to => "home#index"

  3. Ensure you have flash messages in app/views/layouts/application.html.erb.
     For example:

       <p class="notice"><%= notice %></p>
       <p class="alert"><%= alert %></p>

  4. If you are deploying Rails 3.1 on Heroku, you may want to set:

       config.assets.initialize_on_precompile = false

     On config/application.rb forcing your application to not access the DB
     or load models when precompiling your assets.

  ===============================================================================
      invoke    active_record
      create      db/migrate/20121002131914_devise_create_admin_users.rb
      create      app/models/admin_user.rb
      invoke      test_unit
      create        test/unit/admin_user_test.rb
      create        test/fixtures/admin_users.yml
      insert      app/models/admin_user.rb
       route    devise_for :admin_users
        gsub    app/models/admin_user.rb
        gsub    config/routes.rb
      insert    db/migrate/20121002131914_devise_create_admin_users.rb
      create  config/initializers/active_admin.rb
      create  app/admin
      create  app/admin/dashboards.rb
       route  ActiveAdmin.routes(self)
    generate  active_admin:assets
      create  app/assets/javascripts/active_admin.js
      create  app/assets/stylesheets/active_admin.css.scss
      create  db/migrate/20121002091917_create_admin_notes.rb
      create  db/migrate/20121002091918_move_admin_notes_to_comments.rb

```

4. `capify .`

```
[add] writing './Capfile'
[add] writing './config/deploy.rb'
[done] capified!
```

5. `rails g formtastic:install`

```
create  config/initializers/formtastic.rb
create  lib/templates/erb/scaffold/_form.html.erb
```

See installation instructions if you want to add stylesheets:
https://github.com/justinfrench/formtastic

6. test/test_helper.rb
7. `bundle exec guard init test`
8. `bundle exec guard init livereload`
9. Guardfile: I like to place tests and livereload in separate groups to run from different terminal windows. Use the guard -g option to start different groups.


## First tests

1. At this point you may want to run `bundle exec guard -g tests`
2. Create test/integration/images_test.rb and assert that the root path and the images index page has a particular heading. Run the failing test.
3. Change fixture in test/fixtures/admin_users.yml so there is no error about non-unique email address.
4. Add images route to config/routes.rb
5. Create ImagesController at app/controllers/images_controller.rb. `bundle exec rails g controller images index`

```
      create  app/controllers/images_controller.rb
       route  get "images/index"
      invoke  erb
      create    app/views/images
      create    app/views/images/index.html.erb
      invoke  test_unit
      create    test/functional/images_controller_test.rb
      invoke  helper
      create    app/helpers/images_helper.rb
      invoke    test_unit
      create      test/unit/helpers/images_helper_test.rb
      invoke  assets
      invoke    coffee
      create      app/assets/javascripts/images.js.coffee
      invoke    scss
      create      app/assets/stylesheets/images.css.scss

```
  Comment out the get route created. 

6. Heading tests should now pass. If you start rails you should see an h1 with the content "Images#index" at the root path.
7. Add a test for display of an image title on the images index page to test/integration/images_test.rb.
8. Generate an image model that has the single attribute of a title: `bundle exec rails g model image title:string`
```
      invoke  active_record
      create    db/migrate/20121002142351_create_images.rb
      create    app/models/image.rb
      invoke    test_unit
      create      test/unit/image_test.rb
      create      test/fixtures/images.yml
```

9. Migrate the database. `bundle exec rake db:migrate` and for tests `RAILS_ENV=test rake db:migrate`
10. Change test/fixtures/images.yml to include the title we are looking for in our test.
11. Add a unit test that the first image has the title we are looking for in our integration test. 
12. Add a test that the images controller assigns a variable @images 
13. Update the ImagesController so that the index action queries the database for images. Functional test should now pass.
14. Update the view in ap/views/images/index.html.erb so that the image titles are displayed on the page. All tests should now pass.

## Adding an admin interface to images

Doing integration testing on an admin interface takes some extra scaffolding which I won't cover here.

1. In a browser you can get to the admin interface by visiting http://localhost:3000/admin with username/password admin@example.com/password. There is currently no admin interface for images. 
2. `bundle exec rails g active_admin:resource Image` to create an admin interface for images.
3. Load fixtures into the development database with `bundle exec rake db:fixtures:load`. (You may need to log back in).
4. You ought now be able to CRUD images within this interface.


## 2nd session: adding some associations

Add some new fields to Image.

```
rails g migration add_new_fields_to_images filename:string description:text selected:boolean
```

Update the fixtures to include these fields.
```
rake db:fixtures:load
```







