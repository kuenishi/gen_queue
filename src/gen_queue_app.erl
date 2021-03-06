%%
%% Copyright (C) 2013-2013 UENISHI Kota
%%
%%    Licensed under the Apache License, Version 2.0 (the "License");
%%    you may not use this file except in compliance with the License.
%%    You may obtain a copy of the License at
%%
%%        http://www.apache.org/licenses/LICENSE-2.0
%%
%%    Unless required by applicable law or agreed to in writing, software
%%    distributed under the License is distributed on an "AS IS" BASIS,
%%    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%%    See the License for the specific language governing permissions and
%%    limitations under the License.
%%
-module(gen_queue_app).

-behaviour(application).

-include_lib("eunit/include/eunit.hrl").
%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    gen_queue_sup:start_link().

stop(_State) ->
    ok.

-ifdef(TEST).

app_test() ->
    ok = application:start(gen_queue),
    ok = gen_queue:push(a),
    {ok, a} = gen_queue:pop(),
    ok = application:stop(gen_queue).

-endif.
