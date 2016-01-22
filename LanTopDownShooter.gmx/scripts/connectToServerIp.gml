ip = argument0;
show_debug_message("Joining server: " + string(ip));
globals.ip = ip;
room=map_Cottage;

instance_create(10,10,obj_ClientHandler);
