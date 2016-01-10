var socket = argument[0];

var i = 0;
var length = ds_list_size(serverHandler.SocketList);

repeat(length)
{
    var resocket = ds_list_find_value(serverHandler.SocketList, i);
    if(resocket != socket){
        network_send_packet(resocket , Buffer , buffer_tell( Buffer ) );
    }
    i++;
}
