function [] = export_file(v)
    global fileID
    fprintf(fileID,'%s \n',v);
end