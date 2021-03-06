# PICO-8 Examples

A set of examples using Lexaloffe's [PICO-8](https://www.lexaloffle.com/pico-8.php). This is mainly aimed at friends who are learning. As a result I'm going to try and keep all the examples as clear as possible. I hope to keep expanding on it over the next few weeks.

## Getting Started

These instructions will get you up and running with the examples.

### Prerequisites

* Lexaloffe's [PICO-8](https://www.lexaloffe.com/pico-8.php).
* [Git](https://git-scm.com/).

### Installing

These instructions are for the CLI on Linux/Windows/mac OS. The assumption is made that PICO-8 and git are on the system path.


#### Cloning the GitHub repository
Clone the repository to your local machine using Git.

```
git clone https://github.com/alannakelly/pico8.git
```

#### Running the Examples

Navigate into the cloned repository.
```
cd pico8
```

Start PICO-8 in the current directory
```
pico8 -home ./home -desktop ./desktop
```

Load an example in pico-8.
```
load score/score.p8
```

### Contributing

Pull requests with bugfixes, modifications, documentation improvements and new examples are very welcome. As this collection is intended to be educational examples it is expected that any contributions are clear and well documented.

#### Rules
* All new contributions must be under the MIT License.
* Examples are each in their own directory.
* Examples must have a README.md file in their directory.
* An optimized version of an existing example must be in its own directory. Optimisations are to be clearly explained in the README.md file.
* Add yourself to the Authors & Contributors section (If you like).

### The Examples

* [score](home/carts/score/README.md) - An example of using large numbers in PICO-8.
* [clock](home/carts/clock/README.md) - A analogue clock implemented in PICO-8.
* [mouse](home/carts/mouse/README.md) - How to use mouse input in PICO-8.
* [hextiles](home/carts/hextiles/README.md) - How to render hexagonal tiles using sprites.
* [raycast](home/carts/raycast/README.md) - An implementation of a classic raycaster 3D engine.
* [iso](home/carts/iso/README.md) - A demonstration of videogame style isometic projection.

## Authors & Contributors

**Alanna Kelly** - https://www.twitter.com/alannakelly_ie

## License

This project is licensed under the MIT License - see the LICENSE file for details

## Acknowlegements
