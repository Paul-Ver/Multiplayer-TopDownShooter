   var buffer = argument[ 0 ];
   var socket = argument[ 1 ];
   var resocket;
   var msgid = buffer_read( buffer , buffer_u8 );
   
   switch( msgid ) {
      case 2://Location/rotation replication
        var recX = buffer_read( buffer, buffer_u16 );
        var recY = buffer_read( buffer, buffer_u16 );
        var recAngle = buffer_read( buffer, buffer_u16);
        
        buffer_seek( server_buffer , buffer_seek_start , 0 );
        buffer_write( server_buffer , buffer_u8 , 2);
        buffer_write( server_buffer , buffer_u8 , socket);
        buffer_write( server_buffer , buffer_u16 , recX );
        buffer_write( server_buffer , buffer_u16 , recY );
        buffer_write( server_buffer , buffer_u16 , recAngle);
        sendToOtherClients(socket);
      break;
      case 3://Text messages
        var textMessage = buffer_read(buffer,buffer_string);
        show_debug_message(textMessage);
        
        buffer_seek( server_buffer , buffer_seek_start , 0 );
        buffer_write( server_buffer , buffer_u8 , 1);
        buffer_write( server_buffer , buffer_string , textMessage);
        sendToOtherClients(socket);
   }
