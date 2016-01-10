sg = argument0
var ip;

if(sg==-1){
    show_debug_message("None selected.");
}else{
    //SG = ID of server in map
    //ip is the key
    var iterator = ds_map_find_first(global.gamesMap);
    for (var i = 0; i < ds_map_size(global.gamesMap); i++;)
    {
        if(i == sg){
            ip = iterator;
        }
        iterator = ds_map_find_next(global.gamesMap, iterator);
    }
    connectToServerIp(ip);
}