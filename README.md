# BEAM prometheus exporter

A Cowboy 2 application that just exposes the `/metrics` handler of
[prometheus-cowboy](https://github.com/deadtrickster/prometheus-cowboy).

Most of the real work is done by [prometheus.erl](https://github.com/deadtrickster/prometheus.erl/). However we wanted something easy to add quickly to our release. This projects quickly exposes BEAM metrics to prometheus.

## Usage

- Add the depedency to rebar.config

- Add the depencendy to the application resource file so it gets started with the build

- Add (optional) configuration to app environment:
```
{port, 9101}
{auth, {Username, Password}}
```

