%% -*- coding: utf-8 -*-
%% Automatically generated, do not edit
%% Generated by gpb_compile version 4.1.3
-module(common_pb).

-export([encode_msg/1, encode_msg/2]).
-export([decode_msg/2, decode_msg/3]).
-export([merge_msgs/2, merge_msgs/3]).
-export([verify_msg/1, verify_msg/2]).
-export([get_msg_defs/0]).
-export([get_msg_names/0]).
-export([get_group_names/0]).
-export([get_msg_or_group_names/0]).
-export([get_enum_names/0]).
-export([find_msg_def/1, fetch_msg_def/1]).
-export([find_enum_def/1, fetch_enum_def/1]).
-export([enum_symbol_by_value/2, enum_value_by_symbol/2]).
-export([get_service_names/0]).
-export([get_service_def/1]).
-export([get_rpc_names/1]).
-export([find_rpc_def/2, fetch_rpc_def/2]).
-export([get_package_name/0]).
-export([gpb_version_as_string/0, gpb_version_as_list/0]).

-include("common_pb.hrl").
-include("gpb.hrl").

%% enumerated types

-export_type([]).

%% message types
-type worldResp() :: #worldResp{}.
-type helloReq() :: #helloReq{}.
-export_type(['worldResp'/0, 'helloReq'/0]).

-spec encode_msg(#worldResp{} | #helloReq{}) -> binary().
encode_msg(Msg) -> encode_msg(Msg, []).


-spec encode_msg(#worldResp{} | #helloReq{}, list()) -> binary().
encode_msg(Msg, Opts) ->
    case proplists:get_bool(verify, Opts) of
      true -> verify_msg(Msg, Opts);
      false -> ok
    end,
    TrUserData = proplists:get_value(user_data, Opts),
    case Msg of
      #worldResp{} -> e_msg_worldResp(Msg, TrUserData);
      #helloReq{} -> e_msg_helloReq(Msg, TrUserData)
    end.



e_msg_worldResp(Msg, TrUserData) ->
    e_msg_worldResp(Msg, <<>>, TrUserData).


e_msg_worldResp(#worldResp{msg = F1}, Bin,
		TrUserData) ->
    if F1 == undefined -> Bin;
       true ->
	   begin
	     TrF1 = id(F1, TrUserData),
	     e_type_string(TrF1, <<Bin/binary, 10>>)
	   end
    end.

e_msg_helloReq(Msg, TrUserData) ->
    e_msg_helloReq(Msg, <<>>, TrUserData).


e_msg_helloReq(#helloReq{msg = F1}, Bin, TrUserData) ->
    if F1 == undefined -> Bin;
       true ->
	   begin
	     TrF1 = id(F1, TrUserData),
	     e_type_string(TrF1, <<Bin/binary, 10>>)
	   end
    end.

e_type_string(S, Bin) ->
    Utf8 = unicode:characters_to_binary(S),
    Bin2 = e_varint(byte_size(Utf8), Bin),
    <<Bin2/binary, Utf8/binary>>.

e_varint(N, Bin) when N =< 127 -> <<Bin/binary, N>>;
e_varint(N, Bin) ->
    Bin2 = <<Bin/binary, (N band 127 bor 128)>>,
    e_varint(N bsr 7, Bin2).


decode_msg(Bin, MsgName) when is_binary(Bin) ->
    decode_msg(Bin, MsgName, []).

decode_msg(Bin, MsgName, Opts) when is_binary(Bin) ->
    TrUserData = proplists:get_value(user_data, Opts),
    case MsgName of
      worldResp ->
	  try d_msg_worldResp(Bin, TrUserData) catch
	    Class:Reason ->
		StackTrace = erlang:get_stacktrace(),
		error({gpb_error,
		       {decoding_failure,
			{Bin, worldResp, {Class, Reason, StackTrace}}}})
	  end;
      helloReq ->
	  try d_msg_helloReq(Bin, TrUserData) catch
	    Class:Reason ->
		StackTrace = erlang:get_stacktrace(),
		error({gpb_error,
		       {decoding_failure,
			{Bin, helloReq, {Class, Reason, StackTrace}}}})
	  end
    end.



d_msg_worldResp(Bin, TrUserData) ->
    dfp_read_field_def_worldResp(Bin, 0, 0,
				 id(undefined, TrUserData), TrUserData).

dfp_read_field_def_worldResp(<<10, Rest/binary>>, Z1,
			     Z2, F@_1, TrUserData) ->
    d_field_worldResp_msg(Rest, Z1, Z2, F@_1, TrUserData);
dfp_read_field_def_worldResp(<<>>, 0, 0, F@_1, _) ->
    #worldResp{msg = F@_1};
dfp_read_field_def_worldResp(Other, Z1, Z2, F@_1,
			     TrUserData) ->
    dg_read_field_def_worldResp(Other, Z1, Z2, F@_1,
				TrUserData).

dg_read_field_def_worldResp(<<1:1, X:7, Rest/binary>>,
			    N, Acc, F@_1, TrUserData)
    when N < 32 - 7 ->
    dg_read_field_def_worldResp(Rest, N + 7, X bsl N + Acc,
				F@_1, TrUserData);
dg_read_field_def_worldResp(<<0:1, X:7, Rest/binary>>,
			    N, Acc, F@_1, TrUserData) ->
    Key = X bsl N + Acc,
    case Key of
      10 ->
	  d_field_worldResp_msg(Rest, 0, 0, F@_1, TrUserData);
      _ ->
	  case Key band 7 of
	    0 ->
		skip_varint_worldResp(Rest, 0, 0, F@_1, TrUserData);
	    1 -> skip_64_worldResp(Rest, 0, 0, F@_1, TrUserData);
	    2 ->
		skip_length_delimited_worldResp(Rest, 0, 0, F@_1,
						TrUserData);
	    3 ->
		skip_group_worldResp(Rest, Key bsr 3, 0, F@_1,
				     TrUserData);
	    5 -> skip_32_worldResp(Rest, 0, 0, F@_1, TrUserData)
	  end
    end;
dg_read_field_def_worldResp(<<>>, 0, 0, F@_1, _) ->
    #worldResp{msg = F@_1}.

d_field_worldResp_msg(<<1:1, X:7, Rest/binary>>, N, Acc,
		      F@_1, TrUserData)
    when N < 57 ->
    d_field_worldResp_msg(Rest, N + 7, X bsl N + Acc, F@_1,
			  TrUserData);
d_field_worldResp_msg(<<0:1, X:7, Rest/binary>>, N, Acc,
		      _, TrUserData) ->
    {NewFValue, RestF} = begin
			   Len = X bsl N + Acc,
			   <<Bytes:Len/binary, Rest2/binary>> = Rest,
			   {binary:copy(Bytes), Rest2}
			 end,
    dfp_read_field_def_worldResp(RestF, 0, 0, NewFValue,
				 TrUserData).

skip_varint_worldResp(<<1:1, _:7, Rest/binary>>, Z1, Z2,
		      F@_1, TrUserData) ->
    skip_varint_worldResp(Rest, Z1, Z2, F@_1, TrUserData);
skip_varint_worldResp(<<0:1, _:7, Rest/binary>>, Z1, Z2,
		      F@_1, TrUserData) ->
    dfp_read_field_def_worldResp(Rest, Z1, Z2, F@_1,
				 TrUserData).

skip_length_delimited_worldResp(<<1:1, X:7,
				  Rest/binary>>,
				N, Acc, F@_1, TrUserData)
    when N < 57 ->
    skip_length_delimited_worldResp(Rest, N + 7,
				    X bsl N + Acc, F@_1, TrUserData);
skip_length_delimited_worldResp(<<0:1, X:7,
				  Rest/binary>>,
				N, Acc, F@_1, TrUserData) ->
    Length = X bsl N + Acc,
    <<_:Length/binary, Rest2/binary>> = Rest,
    dfp_read_field_def_worldResp(Rest2, 0, 0, F@_1,
				 TrUserData).

skip_group_worldResp(Bin, FNum, Z2, F@_1, TrUserData) ->
    {_, Rest} = read_group(Bin, FNum),
    dfp_read_field_def_worldResp(Rest, 0, Z2, F@_1,
				 TrUserData).

skip_32_worldResp(<<_:32, Rest/binary>>, Z1, Z2, F@_1,
		  TrUserData) ->
    dfp_read_field_def_worldResp(Rest, Z1, Z2, F@_1,
				 TrUserData).

skip_64_worldResp(<<_:64, Rest/binary>>, Z1, Z2, F@_1,
		  TrUserData) ->
    dfp_read_field_def_worldResp(Rest, Z1, Z2, F@_1,
				 TrUserData).

d_msg_helloReq(Bin, TrUserData) ->
    dfp_read_field_def_helloReq(Bin, 0, 0,
				id(undefined, TrUserData), TrUserData).

dfp_read_field_def_helloReq(<<10, Rest/binary>>, Z1, Z2,
			    F@_1, TrUserData) ->
    d_field_helloReq_msg(Rest, Z1, Z2, F@_1, TrUserData);
dfp_read_field_def_helloReq(<<>>, 0, 0, F@_1, _) ->
    #helloReq{msg = F@_1};
dfp_read_field_def_helloReq(Other, Z1, Z2, F@_1,
			    TrUserData) ->
    dg_read_field_def_helloReq(Other, Z1, Z2, F@_1,
			       TrUserData).

dg_read_field_def_helloReq(<<1:1, X:7, Rest/binary>>, N,
			   Acc, F@_1, TrUserData)
    when N < 32 - 7 ->
    dg_read_field_def_helloReq(Rest, N + 7, X bsl N + Acc,
			       F@_1, TrUserData);
dg_read_field_def_helloReq(<<0:1, X:7, Rest/binary>>, N,
			   Acc, F@_1, TrUserData) ->
    Key = X bsl N + Acc,
    case Key of
      10 ->
	  d_field_helloReq_msg(Rest, 0, 0, F@_1, TrUserData);
      _ ->
	  case Key band 7 of
	    0 -> skip_varint_helloReq(Rest, 0, 0, F@_1, TrUserData);
	    1 -> skip_64_helloReq(Rest, 0, 0, F@_1, TrUserData);
	    2 ->
		skip_length_delimited_helloReq(Rest, 0, 0, F@_1,
					       TrUserData);
	    3 ->
		skip_group_helloReq(Rest, Key bsr 3, 0, F@_1,
				    TrUserData);
	    5 -> skip_32_helloReq(Rest, 0, 0, F@_1, TrUserData)
	  end
    end;
dg_read_field_def_helloReq(<<>>, 0, 0, F@_1, _) ->
    #helloReq{msg = F@_1}.

d_field_helloReq_msg(<<1:1, X:7, Rest/binary>>, N, Acc,
		     F@_1, TrUserData)
    when N < 57 ->
    d_field_helloReq_msg(Rest, N + 7, X bsl N + Acc, F@_1,
			 TrUserData);
d_field_helloReq_msg(<<0:1, X:7, Rest/binary>>, N, Acc,
		     _, TrUserData) ->
    {NewFValue, RestF} = begin
			   Len = X bsl N + Acc,
			   <<Bytes:Len/binary, Rest2/binary>> = Rest,
			   {binary:copy(Bytes), Rest2}
			 end,
    dfp_read_field_def_helloReq(RestF, 0, 0, NewFValue,
				TrUserData).

skip_varint_helloReq(<<1:1, _:7, Rest/binary>>, Z1, Z2,
		     F@_1, TrUserData) ->
    skip_varint_helloReq(Rest, Z1, Z2, F@_1, TrUserData);
skip_varint_helloReq(<<0:1, _:7, Rest/binary>>, Z1, Z2,
		     F@_1, TrUserData) ->
    dfp_read_field_def_helloReq(Rest, Z1, Z2, F@_1,
				TrUserData).

skip_length_delimited_helloReq(<<1:1, X:7,
				 Rest/binary>>,
			       N, Acc, F@_1, TrUserData)
    when N < 57 ->
    skip_length_delimited_helloReq(Rest, N + 7,
				   X bsl N + Acc, F@_1, TrUserData);
skip_length_delimited_helloReq(<<0:1, X:7,
				 Rest/binary>>,
			       N, Acc, F@_1, TrUserData) ->
    Length = X bsl N + Acc,
    <<_:Length/binary, Rest2/binary>> = Rest,
    dfp_read_field_def_helloReq(Rest2, 0, 0, F@_1,
				TrUserData).

skip_group_helloReq(Bin, FNum, Z2, F@_1, TrUserData) ->
    {_, Rest} = read_group(Bin, FNum),
    dfp_read_field_def_helloReq(Rest, 0, Z2, F@_1,
				TrUserData).

skip_32_helloReq(<<_:32, Rest/binary>>, Z1, Z2, F@_1,
		 TrUserData) ->
    dfp_read_field_def_helloReq(Rest, Z1, Z2, F@_1,
				TrUserData).

skip_64_helloReq(<<_:64, Rest/binary>>, Z1, Z2, F@_1,
		 TrUserData) ->
    dfp_read_field_def_helloReq(Rest, Z1, Z2, F@_1,
				TrUserData).

read_group(Bin, FieldNum) ->
    {NumBytes, EndTagLen} = read_gr_b(Bin, 0, 0, 0, 0, FieldNum),
    <<Group:NumBytes/binary, _:EndTagLen/binary, Rest/binary>> = Bin,
    {Group, Rest}.

%% Like skipping over fields, but record the total length,
%% Each field is <(FieldNum bsl 3) bor FieldType> ++ <FieldValue>
%% Record the length because varints may be non-optimally encoded.
%%
%% Groups can be nested, but assume the same FieldNum cannot be nested
%% because group field numbers are shared with the rest of the fields
%% numbers. Thus we can search just for an group-end with the same
%% field number.
%%
%% (The only time the same group field number could occur would
%% be in a nested sub message, but then it would be inside a
%% length-delimited entry, which we skip-read by length.)
read_gr_b(<<1:1, X:7, Tl/binary>>, N, Acc, NumBytes, TagLen, FieldNum)
  when N < (32-7) ->
    read_gr_b(Tl, N+7, X bsl N + Acc, NumBytes, TagLen+1, FieldNum);
read_gr_b(<<0:1, X:7, Tl/binary>>, N, Acc, NumBytes, TagLen,
          FieldNum) ->
    Key = X bsl N + Acc,
    TagLen1 = TagLen + 1,
    case {Key bsr 3, Key band 7} of
        {FieldNum, 4} -> % 4 = group_end
            {NumBytes, TagLen1};
        {_, 0} -> % 0 = varint
            read_gr_vi(Tl, 0, NumBytes + TagLen1, FieldNum);
        {_, 1} -> % 1 = bits64
            <<_:64, Tl2/binary>> = Tl,
            read_gr_b(Tl2, 0, 0, NumBytes + TagLen1 + 8, 0, FieldNum);
        {_, 2} -> % 2 = length_delimited
            read_gr_ld(Tl, 0, 0, NumBytes + TagLen1, FieldNum);
        {_, 3} -> % 3 = group_start
            read_gr_b(Tl, 0, 0, NumBytes + TagLen1, 0, FieldNum);
        {_, 4} -> % 4 = group_end
            read_gr_b(Tl, 0, 0, NumBytes + TagLen1, 0, FieldNum);
        {_, 5} -> % 5 = bits32
            <<_:32, Tl2/binary>> = Tl,
            read_gr_b(Tl2, 0, 0, NumBytes + TagLen1 + 4, 0, FieldNum)
    end.

read_gr_vi(<<1:1, _:7, Tl/binary>>, N, NumBytes, FieldNum)
  when N < (64-7) ->
    read_gr_vi(Tl, N+7, NumBytes+1, FieldNum);
read_gr_vi(<<0:1, _:7, Tl/binary>>, _, NumBytes, FieldNum) ->
    read_gr_b(Tl, 0, 0, NumBytes+1, 0, FieldNum).

read_gr_ld(<<1:1, X:7, Tl/binary>>, N, Acc, NumBytes, FieldNum)
  when N < (64-7) ->
    read_gr_ld(Tl, N+7, X bsl N + Acc, NumBytes+1, FieldNum);
read_gr_ld(<<0:1, X:7, Tl/binary>>, N, Acc, NumBytes, FieldNum) ->
    Len = X bsl N + Acc,
    NumBytes1 = NumBytes + 1,
    <<_:Len/binary, Tl2/binary>> = Tl,
    read_gr_b(Tl2, 0, 0, NumBytes1 + Len, 0, FieldNum).

merge_msgs(Prev, New) -> merge_msgs(Prev, New, []).

merge_msgs(Prev, New, Opts)
    when element(1, Prev) =:= element(1, New) ->
    TrUserData = proplists:get_value(user_data, Opts),
    case Prev of
      #worldResp{} ->
	  merge_msg_worldResp(Prev, New, TrUserData);
      #helloReq{} -> merge_msg_helloReq(Prev, New, TrUserData)
    end.

merge_msg_worldResp(#worldResp{msg = PFmsg},
		    #worldResp{msg = NFmsg}, _) ->
    #worldResp{msg =
		   if NFmsg =:= undefined -> PFmsg;
		      true -> NFmsg
		   end}.

merge_msg_helloReq(#helloReq{msg = PFmsg},
		   #helloReq{msg = NFmsg}, _) ->
    #helloReq{msg =
		  if NFmsg =:= undefined -> PFmsg;
		     true -> NFmsg
		  end}.


verify_msg(Msg) -> verify_msg(Msg, []).

verify_msg(Msg, Opts) ->
    TrUserData = proplists:get_value(user_data, Opts),
    case Msg of
      #worldResp{} ->
	  v_msg_worldResp(Msg, [worldResp], TrUserData);
      #helloReq{} ->
	  v_msg_helloReq(Msg, [helloReq], TrUserData);
      _ -> mk_type_error(not_a_known_message, Msg, [])
    end.


-dialyzer({nowarn_function,v_msg_worldResp/3}).
v_msg_worldResp(#worldResp{msg = F1}, Path, _) ->
    if F1 == undefined -> ok;
       true -> v_type_string(F1, [msg | Path])
    end,
    ok.

-dialyzer({nowarn_function,v_msg_helloReq/3}).
v_msg_helloReq(#helloReq{msg = F1}, Path, _) ->
    if F1 == undefined -> ok;
       true -> v_type_string(F1, [msg | Path])
    end,
    ok.

-dialyzer({nowarn_function,v_type_string/2}).
v_type_string(S, Path) when is_list(S); is_binary(S) ->
    try unicode:characters_to_binary(S) of
      B when is_binary(B) -> ok;
      {error, _, _} ->
	  mk_type_error(bad_unicode_string, S, Path)
    catch
      error:badarg ->
	  mk_type_error(bad_unicode_string, S, Path)
    end;
v_type_string(X, Path) ->
    mk_type_error(bad_unicode_string, X, Path).

-spec mk_type_error(_, _, list()) -> no_return().
mk_type_error(Error, ValueSeen, Path) ->
    Path2 = prettify_path(Path),
    erlang:error({gpb_type_error,
		  {Error, [{value, ValueSeen}, {path, Path2}]}}).


-dialyzer({nowarn_function,prettify_path/1}).
prettify_path([]) -> top_level;
prettify_path(PathR) ->
    list_to_atom(lists:append(lists:join(".",
					 lists:map(fun atom_to_list/1,
						   lists:reverse(PathR))))).


-compile({inline,id/2}).
id(X, _TrUserData) -> X.


get_msg_defs() ->
    [{{msg, worldResp},
      [#field{name = msg, fnum = 1, rnum = 2, type = string,
	      occurrence = optional, opts = []}]},
     {{msg, helloReq},
      [#field{name = msg, fnum = 1, rnum = 2, type = string,
	      occurrence = optional, opts = []}]}].


get_msg_names() -> [worldResp, helloReq].


get_group_names() -> [].


get_msg_or_group_names() -> [worldResp, helloReq].


get_enum_names() -> [].


fetch_msg_def(MsgName) ->
    case find_msg_def(MsgName) of
      Fs when is_list(Fs) -> Fs;
      error -> erlang:error({no_such_msg, MsgName})
    end.


-spec fetch_enum_def(_) -> no_return().
fetch_enum_def(EnumName) ->
    erlang:error({no_such_enum, EnumName}).


find_msg_def(worldResp) ->
    [#field{name = msg, fnum = 1, rnum = 2, type = string,
	    occurrence = optional, opts = []}];
find_msg_def(helloReq) ->
    [#field{name = msg, fnum = 1, rnum = 2, type = string,
	    occurrence = optional, opts = []}];
find_msg_def(_) -> error.


find_enum_def(_) -> error.


-spec enum_symbol_by_value(_, _) -> no_return().
enum_symbol_by_value(E, V) ->
    erlang:error({no_enum_defs, E, V}).


-spec enum_value_by_symbol(_, _) -> no_return().
enum_value_by_symbol(E, V) ->
    erlang:error({no_enum_defs, E, V}).



get_service_names() -> [].


get_service_def(_) -> error.


get_rpc_names(_) -> error.


find_rpc_def(_, _) -> error.



-spec fetch_rpc_def(_, _) -> no_return().
fetch_rpc_def(ServiceName, RpcName) ->
    erlang:error({no_such_rpc, ServiceName, RpcName}).


get_package_name() -> undefined.



gpb_version_as_string() ->
    "4.1.3".

gpb_version_as_list() ->
    [4,1,3].
