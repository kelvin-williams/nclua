

local tests = require ('tests');
local ASSERT = tests.ASSERT;

--Testing function bit32.band
--And of ...011 and ...001, that results in ...001 (1)
ASSERT(bit32.band(3,1) == (1 % 2^32));

--Testing function bit32.bnot
--Negating ...0001, that results in ...1110 (-2)
ASSERT(bit32.bnot(1) == (-2 % 2^32));

--Testing function bit32.btest
--And of ...011 and ...001, equals ...001 (1)
ASSERT(bit32.btest(3,1));
--And of ...011 and ...100, equals ...000 (0), Expected false
--ASSERT(bit32.btest(3,4))

