function y = predecirSegunTarea(probabilities,tipo)
    clases=["amarillo","cien","cincuenta","doscientos","internet","lenta","rojo"];
    
    if tipo==1
        clasesAClasificar=[5,6];%frase
    end
    if tipo==2
        clasesAClasificar=[2,3,4];%numeros
    end
    if tipo==3
        clasesAClasificar=[1,7];%colores
    end
    probabilities(clasesAClasificar)=probabilities(clasesAClasificar)+1;
    [maximo, ind]=max(probabilities);
    clase_pred=clases(ind)
    y=clase_pred

end