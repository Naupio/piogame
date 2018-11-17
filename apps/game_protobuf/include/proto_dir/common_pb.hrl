%% -*- coding: utf-8 -*-
%% Automatically generated, do not edit
%% Generated by gpb_compile version 4.2.0

-ifndef(common_pb).
-define(common_pb, true).

-define(common_pb_gpb_version, "4.2.0").

-ifndef('LOGINREQ_PB_H').
-define('LOGINREQ_PB_H', true).
-record(loginReq,
        {cookie                 :: iodata()         % = 1
        }).
-endif.

-ifndef('LOGINRESP_PB_H').
-define('LOGINRESP_PB_H', true).
-record(loginResp,
        {result                 :: 'SUCCEEDED' | 'FAILED' | 'NOTFOUND' | integer(), % = 1, enum LOGINMSG
         user_id                :: non_neg_integer() | undefined, % = 2, 32 bits
         user_name              :: iodata() | undefined % = 3
        }).
-endif.

-ifndef('HELLOREQ_PB_H').
-define('HELLOREQ_PB_H', true).
-record(helloReq,
        {msg                    :: iodata() | undefined % = 1
        }).
-endif.

-ifndef('WORLDRESP_PB_H').
-define('WORLDRESP_PB_H', true).
-record(worldResp,
        {msg                    :: iodata() | undefined % = 1
        }).
-endif.

-ifndef('HEARTBEATREQ_PB_H').
-define('HEARTBEATREQ_PB_H', true).
-record(heartbeatReq,
        {
        }).
-endif.

-ifndef('HEARTBEATRESP_PB_H').
-define('HEARTBEATRESP_PB_H', true).
-record(heartbeatResp,
        {unixtime               :: non_neg_integer() | undefined % = 1, 32 bits
        }).
-endif.

-endif.
