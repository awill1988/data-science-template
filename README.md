# Python Scratch Template

This is a description of the project you are working on.

## Quick Start

Open a terminal at the root of this project and ensure you have Python 3.10 installed with:

`python3 --version`

The output should look close to `Python 3.10`.

Now, build and start the project with one command:

`make start`

## Developing

The project uses a classic program for building software artifacts [GNU Make](https://www.gnu.org/software/make/).

If using Unix/MacOS environment, you don't need to install anything except perhaps Python 3.10.

### Build

Open a terminal at the root of this project and run the following command:

```bash
make
```

### Code Quality

#### Linting & Formatting

The project will enforce code styling rules to promote consistency.

To conduct a check for proper adherence to the style rules, run the following command:

```bash
make lint
```

##### Dealing with errors

You may see errors upon linting the code, for example:

```bash
.venv3.10/bin/python3 -m flake8 src src/tests
src/lib/echo.py:3:1: E302 expected 2 blank lines, found 1
def echo(*args: Iterable[AnyStr]) -> None:
^
make: *** [lint-python] Error 1
```

**Note** Linting utilities will sometimes format simple fixes *and* check correctness. This will not do that.

To format the library source code so that it can pass linting checks, you can run:

```bash
make format
```

Using the example from above, the output of `make format` would be:

```bash
.venv3.10/bin/python3 -m black --exclude \(\.venv.\*\)\|\(.eggs\) src src/tests
reformatted src/lib/echo.py

All done! ✨ 🍰 ✨
1 file reformatted, 5 files left unchanged.
```

#### Testing & Code Coverage

This project is setup to use `pytest` and will enforce code coverage of 80 percent.

Open a terminal at the root of this project and run the following command:

```bash
make test
```

### Jupyter Notebooks

The code in this project is organized to allow contributors to abstract functionality into a python library and immediately use it to support
the data science type of work found in the `notebooks/` directory.

An example Jupyter Notebook is provided `notebooks/Echo.ipynb`.

Open a terminal at the root of this project and run the following command:

```bash
make run
```

## Contributing

Contributing is a **opt-in** process and can be registered conveniently using a single command only once.

### Add `git hooks` for contributing

From a development perspective, you will need `pre-commit` installed which is *not* required for building
but required for contributing.

`NO_CONTRIB=0 make`

Upon the first stable release, all are encouraged to contribute to this software regardless of team, skill, or job title via Pull Requests.

All that is required for proposals is that they provide a proponderance of evidence that the changes proposed are grounded in accomplishing business objectives, to tackle technical debt, etc.

### Remove `git hooks` for contributing

`make pre-commit-clean`
