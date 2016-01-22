var t_buffer = buffer_create(256, buffer_grow, 1);
buffer_seek(t_buffer, buffer_seek_start, 0);
buffer_write( t_buffer , buffer_u16 , 5);
buffer_write( t_buffer , buffer_u16, round(player.x));
buffer_write( t_buffer , buffer_u16, round(player.y));
buffer_write( t_buffer , buffer_u16, round(player.image_angle));
globals.result = network_send_packet(globals.client_socket, t_buffer, buffer_tell(t_buffer));
buffer_delete(t_buffer);
