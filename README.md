# DHSC Coding Principles

See the principles *[HERE](https://mattm-dhsc.github.io/coding_principles_book/)*.

## What is this?
This repository contains a set of R markdown documents which, when rendered produce a bookdown site.

The site contains a set of 10 principles, targeted at the DHSC analytical community, with the aim of raising coding standards across the department. These are based on the [MOJ prinicples](https://github.com/moj-analytical-services/our-coding-standards).

## Publishing Process
The code contains [build](_build.sh) and [deploy](_deploy.sh) scripts which are run by [travis](https://travis-ci.org/mattm-dhsc/coding_principles_book).

These scripts render the book, and push the rendered files to a `gh-pages` branch which is then displayed using [github pages](https://mattm-dhsc.github.io/coding_principles_book/).

The scripts adapted from the example scripts provided in the [bookdown example](https://bookdown.org/yihui/bookdown/github.html).

This process means that the book hosted on github pages is kept in sync with the code which produces it without manual intervention.

## Ownership
The DHSC Coding Principles are maintained by the Data Science Hub, who sit within the Office of the Chief Analyst Directorate.