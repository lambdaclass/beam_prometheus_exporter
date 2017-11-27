-module(beam_metrics_handler).

-export([init/2,
         terminate/3]).

init(Req, Opts) ->
  case is_authorized(Req) of
    false ->
      Req1 = cowboy_req:reply(401, #{
                                <<"WWW-Authenticate">> => <<"Basic realm=\"prometheus\"">>
                               }, Req),
      {ok, Req1, Opts};
    true ->
      prometheus_cowboy2_handler:init(Req, Opts)
  end.

terminate(Reason, Req, State) ->
  prometheus_cowboy2_handler:terminate(Reason, Req, State).

%%% internal

is_authorized(Req) ->
  {ok, {Username, Password}} = application:get_env(beam_prometheus, auth),
  Auth = cowboy_req:parse_header(<<"authorization">>, Req),
  case Auth of
    {basic, Username, Password} ->
      true;
    _ ->
      false
  end.
