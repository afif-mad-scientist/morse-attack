%--------------------------------------------------------------------%
%     __  __           _   ____       _            _   _     _       %
%    |  \/  | __ _  __| | / ___|  ___(_) ___ _ __ | |_(_)___| |_     %
%    | |\/| |/ _` |/ _` | \___ \ / __| |/ _ \ '_ \| __| / __| __|    %
%    | |  | | (_| | (_| |  ___) | (__| |  __/ | | | |_| \__ \ |_     %
%    |_|  |_|\__,_|\__,_| |____/ \___|_|\___|_| |_|\__|_|___/\__|    %
%                                                                    %
%--------------------------------------------------------------------%
clear, clc
global fileID
fileID = fopen('decoded_words.txt','w');
alphabet_morse();
code = [0 1 0 0 1 0 0 0 0 0 1 0] %put here your morse code(dash:1 dot:0)
v=[];
   for i =1:36
       v=[];
       vect = num2morse(i);
       test = true;
       for k =1:length(num2morse(i))
           if length(code)>= length(vect)
               if code(k) ~= vect(k)
                    test = false;               
               end
           else
               test = false; 
           end
       end
       if (test == true)
            v = [v num2alph(i)];
            n = length(num2morse(i));
            code2 = code(n+1:end);
            recursive_morse_test(v, code(n+1:end));
            if isempty(code2)
                export_file(v);
            end
       end
       
   end
   fclose(fileID);