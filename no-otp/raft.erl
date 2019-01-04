%%%
%%% @doc A Simple Implementation of Raft
%%% @end
-module(raft).

%%% API
-export([start/0, stop/0]).

%%% Callbacks
-export([init/0]).

-define(SERVER, ?MODULE).

start() ->
  spawn(?MODULE, init, []).

stop() -> 
  ?SERVER ! stop,
  ok.

%%% callback functions - not to be used by the client directly
init() ->
  register(?SERVER, self()),
  node:start(),
  timer:sleep(1000),
  client:start(),
  timer:sleep(3000),
  node:stop(),
  client:stop(),
  ok.
