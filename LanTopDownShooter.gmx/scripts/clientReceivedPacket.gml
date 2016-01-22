var socket = argument[0];
var buffer = ds_map_find_value(async_load, "buffer");
var msgid = buffer_read( buffer , buffer_u16 );
switch( msgid ) {
    case 2:
        //Player join
        var sock = buffer_read(buffer, buffer_u8);
        chatListAdd("> Player: " + string(sock) + " has joined.");
        var inst = instance_create(-100,-100,oPlayerOther);
        ds_map_add(clients,sock,inst);
    break;
    case 3:
        //Player leave
        var sock = buffer_read(buffer, buffer_u8);
        chatListAdd("> Player: " + string(sock) + " has left.");
        var inst = ds_map_find_value(clients,sock);
        with(inst){
            instance_destroy();
        }
        ds_map_delete(clients,sock);
    break;
    case 4:
        //Text message.
        var textMessage = buffer_read( buffer , buffer_string);
        chatListAdd(textMessage);
    break;
    case 5:
        //Position/rotation replication.
        var playerid = buffer_read( buffer, buffer_u8);
        var recX = buffer_read( buffer, buffer_u16);
        var recY = buffer_read( buffer, buffer_u16);
        var recAngle = buffer_read( buffer, buffer_u16);
        var inst = ds_map_find_value(clients,playerid);
        with(inst){
            inst.x = recX;
            inst.y = recY;
            inst.image_angle = recAngle;
        }
    break;
    case 6:
        var playerid = buffer_read( buffer, buffer_u8);
        var weapon = buffer_read( buffer, buffer_u16);
        var inst= ds_map_find_value(clients,playerid);
        with(inst){
            inst.currentWeapon = weapon;
        }
    break;
}
