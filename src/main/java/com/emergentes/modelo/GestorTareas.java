package com.emergentes.modelo;

import java.util.ArrayList;
import java.util.Iterator;

public class GestorTareas {
    private ArrayList<Tarea> lista;

    public GestorTareas() {
        lista = new ArrayList<Tarea>();
    }

    public ArrayList<Tarea> getLista() {
        return lista;
    }

    public void setLista(ArrayList<Tarea> lista) {
        this.lista = lista;
    }
    
    public void InsertarTarea(Tarea item){
        lista.add(item);
    }
    
    public void ModificarTarea(int pos, Tarea item){
        lista.set(pos, item);
    }
    
    public void EliminarTarea(int pos){
        lista.remove(pos);
    }
    
    public int ObtenerId(){
        int idAux = 0;
        
        for(Tarea item : lista){
            idAux = item.getId();
        }
        return idAux + 1;
    }
    
    public int UbicarTarea(int id){
        int pos = -1;
        Iterator<Tarea> it = lista.iterator();
        
        while(it.hasNext()){
            ++pos;
            Tarea aux = it.next();
            if(aux.getId() == id){
                break;
            }
        }
        return pos;
    }
}
