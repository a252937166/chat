package biz;

import java.util.UUID;

/**
 * Created by OyDn on 2016/4/6.
 */
public class User {
    String id = UUID.randomUUID().toString();
    String account = (int)((Math.random())*10000) + "用户";
    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getId() {
        return id;
    }

}
