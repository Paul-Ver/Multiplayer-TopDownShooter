var socket = argument [0];
var buffer = ds_map_find_value(async_load, "buffer");

var msgid = buffer_read( buffer , buffer_u16 );
//Server should relay the messages to other clients. (if necessary)
switch( msgid ){
    //case 2 / 3 = connect/disconnect
    case 4://Text messages
        var text = buffer_read( buffer, buffer_string);
        buffer_seek( server_buffer , buffer_seek_start , 0 );
        buffer_write( server_buffer , buffer_u16 , 4);
        buffer_write( server_buffer , buffer_u8 , socket);
        buffer_write( server_buffer , buffer_string, text);
        sendToOtherClients(socket);
    break;
    case 5://Location replication.
        var recX = buffer_read( buffer, buffer_u16 );
        var recY = buffer_read( buffer, buffer_u16 );
        var recAngle = buffer_read( buffer, buffer_u16);
        
        buffer_seek( server_buffer , buffer_seek_start , 0 );
        buffer_write( server_buffer , buffer_u16 , 5);
        buffer_write( server_buffer , buffer_u8 , socket);
        buffer_write( server_buffer , buffer_u16 , recX );
        buffer_write( server_buffer , buffer_u16 , recY );
        buffer_write( server_buffer , buffer_u16 , recAngle);
        sendToOtherClients(socket);
    break;
    case 6:
        var recWeapon = buffer_read( buffer, buffer_u16);
        buffer_seek( server_buffer , buffer_seek_start , 0 );
        buffer_write( server_buffer , buffer_u16 , 6);
        buffer_write( server_buffer , buffer_u8 , socket);
        buffer_write( server_buffer , buffer_u16 , recWeapon );
        sendToOtherClients(socket);
        
}
