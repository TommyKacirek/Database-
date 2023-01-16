# DatabaseApplication
Project application linked to the database

DB app with GUI
## To build and run
Entre these commands in project root directory to build.
```shell
$ mvn clean install
```
The next step is to launch this project
```shell
$ java -jar .\target\Library-1.0.0.jar
```

You can also start an extra project with `application.properties`
```shell
$ java -jar .\target\Library-1.0.0.jar "./etc/application.properties"
```
Sign-in instructions:
- Username: `Mirabalar@seznam.cz`
- Password: `heslo`

Used dependencies are stored on the git in a folder "dependencies"
You can also get them by typing 
```shell
$ mvn project-info-reports:dependencies
```

