///@func load_string_file(filename)
///@param filename
var filename,buffer,str,json;
filename=argument[0];
//Make a data buffer from the file and put it in a string
buffer=buffer_load(filename);
str=buffer_read(buffer,buffer_string);
buffer_delete(buffer);
//Decode the string and return it
json=json_decode(str);
return(json);