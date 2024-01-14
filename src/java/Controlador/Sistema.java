/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import java.util.Calendar;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author Samuel
 */
public class Sistema {
    public boolean validarUsuario(Usuario u){
        boolean estatus=true;
        return estatus;
    }
    public boolean validarPago(String nomTar, String codigo, String ano, String mes, String numT){
        boolean estado = true;
        Banco b = new Banco();
        
        boolean exp1, exp2, exp3, exp4, exp5;
        
        try{
            Pattern p = Pattern.compile("^[a-zA-ZÀ-ÿ\\u00f1\\u00d1]+(\\s*[a-zA-ZÀ-ÿ\\u00f1\\u00d1]*)*[a-zA-ZÀ-ÿ\\u00f1\\u00d1]+$");
            Matcher m = p.matcher(nomTar);
            exp1 = m.find();
            p = Pattern.compile("^[0-9]{16}");
            m = p.matcher(numT);
            exp2 = m.find();
            p = Pattern.compile("^[0-9]{3}");
            m = p.matcher(codigo);
            exp3 = m.find();
            p = Pattern.compile("^(0[1-9]|1[0-2])$");
            m = p.matcher(mes);
            exp4 = m.find();
            p = Pattern.compile("^[0-9]{4}$");
            m = p.matcher(ano);
            exp5 = m.find();
            
            if (exp1==false || exp2==false || exp3==false || exp4==false || exp5==false ){
                estado=false;
            }else{
                Calendar fecha = Calendar.getInstance();
                        int anoA = fecha.get(Calendar.YEAR);
                        int mesA = fecha.get(Calendar.MONTH) + 1;
                        int mesI = Integer.parseInt(mes);
                        int anoI = Integer.parseInt(ano);
                        
                        if(mesI==mesA && anoI==anoA){
                            estado=false;
                        }else if(mesI<mesA && anoI==anoA){
                            estado=false;
                        }else if(anoI<anoA){
                            estado=false;
                        }else{
                            estado=true;
                        }
            }
        }catch(Exception e){
            System.out.println("Error en validaciones tarjeta");
        }
        
        return estado;
        
    }
}
