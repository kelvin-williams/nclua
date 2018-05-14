#include <config.h>
#include "aux-glib.h"
#include "aux-lua.h"
#include <gio/gio.h>

#include "callback.h"


/* This function returns the string "Hello" to the lua stack*/
static int helloFunc(lua_State *L){

	lua_pushstring(L,"Hello");

	printf("C module sent Hello message\n");

	return 1;
}

/* This function receives the answer from the LUA module and confirms it's arrival*/
static int listenForAnswer(lua_State *L){

	char* answer;

	answer = (char*)lua_tostring(L,1);

	printf("C module received the answer: %s\n",answer);

	return 0;
}


static const struct luaL_Reg hello_funcs[] = {
  {"_hello",helloFunc},
  {"_listen",listenForAnswer},
  {NULL, NULL}
};


int luaopen_nclua_event_hello_c(lua_State *L);

int luaopen_nclua_event_hello_c(lua_State *L){
	G_TYPE_INIT_WRAPPER ();
	lua_newtable (L);
	luax_newmetatable(L, "nclua.event.hello_c");
	luaL_setfuncs(L,hello_funcs,0);
	return 1;
}

