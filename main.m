disp('Prueba de correlacion')
Reconocimiento_voz

% disp(corrrojo)
% disp(corrazul)
% disp(corramarillo)

%Audios de colores

% if(corrazul>corrrojo & corrazul>corramarillo)
%     disp('La palabra mencionada es azul')
% end
% 
% if(corrrojo>corrazul & corrrojo>corramarillo)
%     disp('La palabra mencionada es rojo')
% end
% 
% if(corramarillo>corrazul & corramarillo>corrrojo)
%     disp('La palabra mencionada es amarillo')
% end



%Audios de si o no

% disp(corrsi)
% disp(corrno)

% if (corrsi>corrno)
%     disp('La palabra mencionada es si')
% end
% if (corrno>corrsi)
%     disp('La palabra mencionada es no')
% end


%Audios de numeros

disp(corrcuarenta)
disp(corrochenta)
disp(corrcien)

if(corrcuarenta>corrochenta & corrcuarenta>corrcien)
    disp('La palabra mencionada es cuarenta')
end

if(corrochenta>corrcuarenta & corrochenta>corrcien)
    disp('La palabra mencionada es ochenta')
end

if(corrcien>corrcuarenta & corrcien>corrochenta)
    disp('La palabra mencionada es cien')
end
