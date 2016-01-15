docker-apache2
================

Base docker image to run web applications on Apache. This image was created based on the image tutum/apache-php.


Building the base image
-----------------------

To create the base image `mmorejon/apache2`, execute the following command on the docker-apache2 folder:

    docker build -t mmorejon/apache2 .


Running your Apache docker image
------------------------------------

Start your image binding the external ports 80 in all interfaces to your container:

    docker run -d -p 80:80 mmorejon/apache2

Test your deployment:

    curl http://localhost/


Enable .htaccess files
------------------------------------

If you app uses .htaccess files you need to pass the ALLOW_OVERRIDE environment variable

    docker run -d -p 80:80 -e ALLOW_OVERRIDE=true mmorejon/apache2


Loading your custom web application
-----------------------------------

This image can be used as a base image for your web application. Create a new `Dockerfile` in your web application folder with the following contents:

    FROM mmorejon/apache2

After that, build the new `Dockerfile`:

    docker build -t username/my-php-app .

And test it:

    docker run -d -p 80:80 username/my-php-app

Test your deployment:

    curl http://localhost/

That's it!


Loading your custom web application.
--------------------------------------------------------------

Create a Dockerfile like the following:

    FROM mmorejon/apache2
    RUN rm -fr /app
    ADD . /app

- Add your web application to `/app`

