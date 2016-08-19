package biz;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;

/**
 * Created by OyDn on 2016/4/9.
 */
public class XMLTest {
    public static void add(String username,String message,String date) throws Exception {
        // 创建saxReader对象
        SAXReader reader = new SAXReader();
        // 通过read方法读取一个文件 转换成Document对象
        Document document = reader.read(new File("data.xml"));
        //获取根节点元素对象
        Element node = document.getRootElement();
        // 获取history元素节点中，子节点名称为用户昵称节点。
        Element user= node.element(username);
        //如果以前没有此用户，新建一个此用户的节点
        if (user==null) {
            user = node.addElement(username);
        }
//        //获取element的id属性节点对象
//        Attribute attr = element.attribute("id");
//        //删除属性
//        element.remove(attr);
        //新建一个message节点
        Element msg = user.addElement("message");
        //添加时间属性
        msg.addAttribute("date", date);
        //向message标签中写入聊天内容
        msg.setText(message);
        writer(document);
    }
    /**
     * 把document对象写入新的文件
     *
     * @param document
     * @throws Exception
     */
    public static void writer(Document document) throws Exception {
        // 紧凑的格式
        // OutputFormat format = OutputFormat.createCompactFormat();
        // 排版缩进的格式
        OutputFormat format = OutputFormat.createPrettyPrint();
        // 设置编码
        format.setEncoding("UTF-8");
        // 创建XMLWriter对象,指定了写出文件及编码格式
        // XMLWriter writer = new XMLWriter(new FileWriter(new
        // File("src//a.xml")),format);
        XMLWriter writer = new XMLWriter(new OutputStreamWriter(
                new FileOutputStream(new File("data.xml")), "UTF-8"), format);
        // 写入
        writer.write(document);
        // 立即写入
        writer.flush();
        // 关闭操作
        writer.close();
    }
}
