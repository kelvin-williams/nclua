local hello_c = require('nclua.event.hello_c');

local AUX = {}
-- Função do ciclo "Hello" "I'm here"
function listenForHello()

	local hello = hello_c._hello()	

	if (hello == "Hello") then

		print("Lua module received:", hello, ", answering...")
		local respond = hello_c._listen("I'm here")
		return 1
	else
		return nil
	end
end

AUX.listenForHello = listenForHello

return AUX
