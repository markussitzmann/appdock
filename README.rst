APPDOCK - a Docker base enviroment for Python/Django based applications
=======================================================================

**APPDOCK** is in a very early development stage. This is some initial documentation. APPDOCK allows for the creation of a series of
Docker images which can be brought up as a set of Docker containers, or Docker Compose services, respectively. They are roped together
in a virtual Docker network and provide a basic infrastructure for Python/Django-based applications.

Requirements
------------

Please have at least `Docker CE 17.09 <https://docs.docker.com/engine/installation/>`_ and `Docker Compose 1.17 <https://docs.docker.com/compose/install/>`_ installed on your system.


Installation
------------

Clone this repository::

    https://github.com/markussitzmann/appdock.git appdock

go into directory::

    cd appdock/

and edit the file ``.env`` to appropriate settings, in particular, variable ``APPDOCK_HOME`` to a file directory location where the user
running the build in the next is allowed to create a directory. If the directory specified in ``APPDOCK_HOME`` does not exist, it will be
created during start up of the Docker container. It will be mounted as volume in all containers.

Start the Docker build of the system by::

    docker-compose build

which will build all Docker image files for the APPDOCK.



