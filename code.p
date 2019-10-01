using Npgsql.* .

define variable conn as NpgsqlConnection.
define variable cmd as NpgsqlCommand.
define variable updateString as character  no-undo init ?.

define variable cQuery as character  no-undo init ?.








assign conn = new NpgsqlConnection("Server=localhost;User Id=postgres; " +
               "Password=dothedew;Database=storageDB;").
conn:Open().

cQuery = "copy (Select catalog_id, file_id, name,(select url from storage_device where storage_device.storage_device_id = catalog.storage_device_id)" + 
         " as device from catalog where (not is_dir) and delete_version = 0) " +
         " to 'C:/testing/mydata1.csv' delimiter ',' CSV HEADER;".
         
cmd = new NpgsqlCommand(cQuery, conn).
cmd:ExecuteNonQuery().



message 11
    view-as alert-box information.

