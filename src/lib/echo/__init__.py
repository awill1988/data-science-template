from typing import AnyStr, Iterable


def echo(*args: Iterable[AnyStr]) -> None:
    for arg in args:
        print(arg)
