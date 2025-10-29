# config management
wwsl for historical reasons ...


... go back to containers via podman at work.

## TODO

* [ ] implement bleeding edge update macro in winget
    - create a list of packages to ensure
    - install through a loop (or similar)
        - consider using `winget import` if to looks straightforward enough
    - set up a command to upgrade all installed packages to latest versions
        - consider using `winget upgrade --all` ? or is the genai nonesnse?
        - otherwise winget can output a list of upgradable packages, which can be looped through
