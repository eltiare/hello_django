Hello World Through Django!
===========================

In this illustrious app, we illustrate the capabilities of Django to connect to Redis and Postgres
with the help of Docker and Docker Compose. 

Assuming that you have those two things (Docker & Compose) installed, all you have to do is clone 
this repository, change into this repository's directory, and then run `docker-compose up`. Docker 
Compose will take care of the rest! Once it's done its magic, you'll get a notification like this 
in your terminal:

    web_1       | Starting development server at http://0.0.0.0:8000/
    web_1       | Quit the server with CONTROL-C.
    
Open up a web browser and type `localhost:8000` to see the Hello World Django app. You will note
that there's a "lucky number", which stays the same for ten seconds after which it is first loaded.
If you reload before that ten seconds is up, you will get the same number. Afterwards it changes
to another random number.     

Postgres Integration
--------------------

You might note that it complains about migrations not being run. If you want to test the 
capabilities of the Postgres connection, open another terminal window and navigate to the repo 
directory if you're not already there. Then run `docker-compose exec web pipenv run ./manage.py 
migrate`. It will run the the  migrations. If you decide to stop (press `CTRL+C`) and then restart 
(`docker-compose up`) the app, you will see the warnings are gone. If you'd like to confirm that the 
database is indeed migrated in Postgres, Run  `docker-compose exec postgres psql -U postgres`. It 
will enter you into the Postgres terminal. From there you run `\c hello` to connect to the database 
and then `\d` to see that the tables in the various initial migration are present. 
