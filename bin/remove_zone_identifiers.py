#!/usr/bin/env python3

# recursively remove all zone.identifier files in the current directory and child directories
import os


def remove_zone_identifiers():
    for root, dirs, files in os.walk("."):
        for file in files:
            if "Zone.Identifier" in file:
                os.remove(os.path.join(root, file))


if __name__ == "__main__":
    remove_zone_identifiers()
