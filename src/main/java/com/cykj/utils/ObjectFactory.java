package com.cykj.utils;

public class ObjectFactory {
    public static Object newInstance(String classname){
        Object obj =null;
        try {
            Class clazz = Class.forName(classname);
            obj =clazz.newInstance();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        }
        return obj;
    }

}
