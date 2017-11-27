-module(beam_prometheus_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% API

start(_StartType, _StartArgs) ->
  Dispatch = [{'_', [{"/metrics/[:registry]", prometheus_cowboy2_handler, []}]}],
  {ok, _} = cowboy:start_tls(my_http_listener,
                             [{port, config(port)},
                              {certfile, config(certfile)},
                              {keyfile, config(keyfile)}],
                             #{env => #{dispatch => Dispatch}}
                            ),
  beam_prometheus_sup:start_link().

stop(_State) ->
  ok.

%% Internal functions
config(Key) ->
  {ok, Value} = application:get_env(example, Key),
  Value.
