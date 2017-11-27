-module(beam_prometheus_app).

-behaviour(application).

%% Application callbacks
-export([start/2,
         stop/1]).

%% API

start(_StartType, _StartArgs) ->
  Dispatch = cowboy_router:compile([{'_', [{"/metrics/[:registry]", beam_metrics_handler, []}]}]),
  Port = application:get_env(beam_prometheus, port, 9101),
  {ok, _} = cowboy:start_clear(my_http_listener,
                               [{port, Port}],
                                #{env => #{dispatch => Dispatch}}),
  beam_prometheus_sup:start_link().

stop(_State) ->
  ok.
