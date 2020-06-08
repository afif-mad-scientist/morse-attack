function [] = recursive_morse_test(v,code)
    if ~isempty(code)
        w = v;
       for i =1:36
           v = w;
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
                recursive_morse_test(v, code2);
                if isempty(code2)
                export_file(v);
            end
           end
       end
        
    end
end