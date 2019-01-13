# Raft Implementation in Erlang

WIP


## no-otp

`no-otp` is a simple one node, one client implementation without using otp.

To run, open erl

```

> c(raft).
> raft:start().

```

### TODO
- [ ] State Machine at each node
  - [ ] Replicate
  - [ ] Log
- [ ] Leader
  - [ ] Each node has a state
  - [ ] Leader election
  - [ ] server holds currentTerm, votedFor
- [ ] Timeouts
- [ ] RPC
  - [ ] requestVote
  - [ ] appendEntries

## monolith

Code from some university's programming assignment.

For correct compilation,

```
sudo apt-get install erlang-edoc erlang-eunit erlang-xmerl
```

# Learnings
## eunit
For tests in the same module:

To run a single unit test,

```
eunit:test(raft:get_log_1_test_()).
```

## ets: Erlang Term Storage
- Built-in storage.
- Tables which can store tuples
- Usage:
  ```
  ets:new(<name>, [named_table]).
  ```
- Need to understand the different options completely.
