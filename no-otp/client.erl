%%% @doc Implementation of Raft client.
%%% Client sends messages to the node.
%%% @end
-module(client).

-export([start/0, stop/0, init/0]).

start() ->
  io:format("Client starting up...~n"),
  spawn(client, init, []).

stop() ->
  io:format("Client shutting down...~n"),
  exit(normal).

init() ->
  io:format("Sending node message now...~n"),
  node:submit(10).
