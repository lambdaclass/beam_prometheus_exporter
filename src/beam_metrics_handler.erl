-module(beam_metrics_handler).

-export([init/2,
         terminate/3]).

init(Req, Opts) ->
  prometheus_cowboy2_handler:init(Req, Opts).

terminate(Reason, Req, State) ->
  prometheus_cowboy2_handler:terminate(Reason, Req, State).
