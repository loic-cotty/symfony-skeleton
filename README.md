## 🚧 My Symfony Lab 🚧

Symfony project, for my personal tech watch, around **symfony** and many other things

### Installation

First time, you must run this command to build web environment
```
make build
```

### Run
```
make up
```

### Makefile 

When option is set to yes, parameter c can be add to the command to pass options


| Command      | options | Description                               |
|--------------|---------|-------------------------------------------|
| **build**    | yes     | build containers (default : c=--no-cache) |
| **up**       | yes     | start containers in detach mode           |
| **stop**     |         | stop containers                           |
| **down**     |         | stop and remove au all containers         |
| **restart**  |         | down & build & start                      |
| **logs**     |         | tail -f on all containers logs            |
| **compose**  |         | all other commands (ps, ls...)            |
| **composer** | yes     | execute composer command                  |
| **sf**       | yes     | execute symfony console commands          |
| **symfony**  | yes     | execute symfony CLI commands              |
| **npm**      | yes     | execute npm command                       |
| **node**     | yes     | execute node command                      |


> 💡 use 'make help' for further details

### Requirement

List of tools and versions required to run the project

>
>   - PHP version 8.3 or higher
>   - Composer version 2.
>   - Symfony CLI (optional)
>   - Node.js for npm
>   - Docker


### Frameworks and libraries

>
>   - Symfony
>   - Webpack Encore
>   - Tailwindcss
