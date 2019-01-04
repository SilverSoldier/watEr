%%%
%%% @doc Implementation of a Raft Node
%%% @end

-module(node).

%%% API
-export([start/0, stop/0, submit/1]).

-export([init/0]).

-define(SERVER, ?MODULE).

start() ->
  io:format("Node starting up...~n"),
  spawn(?MODULE, init, []).

submit(Value) ->
  ?SERVER ! {submit, Value},
  ok.

stop() -> 
  io:format("Node shutting down...~n"),
  ?SERVER ! stop,
  ok.

init() ->
  register(?SERVER, self()),
  loop([]).

loop(Values) ->
  receive
    {submit, Value} ->
      io:format("Inserting ~tp~n", [Value]),
      NewValues = lists:append(Values, [Value]),
      loop(NewValues);
    stop ->
      unregister(?SERVER)
  end.
