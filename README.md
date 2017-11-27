# BEAM prometheus exporter

A Cowboy 2 application that just exposes the `/metrics` handler of
[prometheus-cowboy](https://github.com/deadtrickster/prometheus-cowboy).
Intended to quickly enable metrics on a project by adding a dependency.

## Usage

add depedency

add to application resource file

add configuration to app environment:

port 9101

basic auth: {auth, Username, Password}
