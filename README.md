# PICO-8 Examples

A set of examples using Lexaloffe's [PICO-8](https://www.lexaloffle.com/pico-8.php). This is mainly aimed at friends who are learning. As a result I'm going to try and keep all the examples as clear as possible. I hope to keep expanding on it over the next few weeks.

## Getting Started

These instructions will get you up and running with the examples.

### Prerequisites

* Lexaloffe's [PICO-8](https://www.lexaloffe.com/pico-8.php).
* Git [Git](https://git-scm.com/).

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
pico8 -home . -desktop .
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
* 

### The Examples

#### score.p8

Demonstrates a simple method of calculating and displaying arbitary precision integers in PICO-8, which can be used for game scores greater than 32767. While there are other methods of implementing similar mathematics in PICO-8 that may or may not be faster, they are all more complex to implement and understand. I believe this is the simplest solution that takes advantage of the PICO-8 Lua dialect.

* Added: 2019-01-19
* Updated: 2019-01-19

## Authors

**Alanna Kelly** - https://www.twitter.com/alannakelly_ie

## License

This project is licensed under the MIT License - see the LICENSE.md file for details

## Acknowlegements
