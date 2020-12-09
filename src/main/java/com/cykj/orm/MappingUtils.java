package com.cykj.orm;


import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import java.io.File;
import java.lang.reflect.Field;

public class MappingUtils {
    public static Element fetchXml(){
        File file = new File("src/main/resources/TestInfo.xml");
        SAXReader reader = new SAXReader();
        try {
            Document document=  reader.read(file);
            //获取到根节点
            Element root =document.getRootElement();
            return  root;
        } catch (DocumentException e) {
            e.printStackTrace();
        }
        return null;
    }
    public static  String fetchInsertSql(String  bean){
        try {
            Class clz = Class.forName(bean);
            String  clzStr = clz.toString();
            String  beanName = clzStr.substring(clzStr.lastIndexOf(".")+1).toLowerCase();
            Field[] fields =clz.getDeclaredFields();
            StringBuffer sb = null;
            String fileNames ="";
            for (Field field : fields){
                fileNames+=","+field.getName();
                if (sb==null){
                    sb = new StringBuffer();
                    sb.append("?");
                }else{
                    sb.append(" , ?");
                }
            }
            return  "insert into "+beanName+"("+fileNames.substring(1)+") values ("+sb.toString()+")";
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }
}
