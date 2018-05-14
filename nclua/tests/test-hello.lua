local tests = require ('tests')
local ASSERT = tests.ASSERT;

local hello = require ('nclua.event.hello')


ASSERT(hello.listenForHello())

