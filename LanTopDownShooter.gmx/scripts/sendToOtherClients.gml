var socket = argument[0];

var i = 0;
var length = ds_list_size(server_socketlist);

repeat(length)
{
    var resocket = ds_list_find_value(server_socketlist, i);
    if(resocket != socket){
        network_send_packet(resocket , server_buffer , buffer_tell( server_buffer ) );
    }
    i++;
}
