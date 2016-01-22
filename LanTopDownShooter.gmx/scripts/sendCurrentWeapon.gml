var t_buffer = buffer_create(256, buffer_grow, 1);
buffer_seek(t_buffer, buffer_seek_start, 0);
buffer_write( t_buffer , buffer_u16 , 6);
buffer_write( t_buffer , buffer_u16, currentWeapon);
globals.result = network_send_packet(globals.client_socket, t_buffer, buffer_tell(t_buffer));
buffer_delete(t_buffer);
