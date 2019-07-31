///@func save_string_file(filename,string)
///@param filename
///@param string
var filename,str,buffer;
filename=argument[0];
str=argument[1];
//Delete the existing file
if (file_exists(filename))
	file_delete(filename);
//Make a buffer with enough space to fit the string
buffer=(buffer_create(string_byte_length(str)+1,buffer_fixed,1));
//Write the string into the buffer and export to the file
buffer_write(buffer,buffer_string,str);
buffer_save(buffer,filename);
buffer_delete(buffer);