   var buffer = argument[ 0 ];
   var msgid = buffer_read( buffer , buffer_u8 );
   switch( msgid ) {
      case 1:
        var textMessage = buffer_read( buffer , buffer_string);
        with(clientHandler){
        chatListAdd(textMessage);
        }
      break;
      case 2:
        var playerid = buffer_read( buffer, buffer_u8);
        var recX = buffer_read( buffer, buffer_u16);
        var recY = buffer_read( buffer, buffer_u16);
        var recAngle = buffer_read( buffer, buffer_u16);
        var inst = ds_map_find_value(playerMap,playerid);
        inst.x = recX;
        inst.y = recY;
        inst.image_angle = recAngle;
      break;
      case 3:
        var joinLeave = buffer_read( buffer, buffer_bool);
        var playerid = buffer_read( buffer, buffer_u8);
        if(joinLeave==1){
            show_debug_message("Player joined: " + string(playerid));
            ds_map_add(playerMap,playerid,instance_create(0,0,oPlayerOther));
        }else{
            show_debug_message("Player left: " + string(playerid));
            var inst = ds_map_find_value(playerMap,playerid);
            with(inst){
            instance_destroy();
            }
            ds_map_delete(playerMap,playerid);
        }
      break;
   }
