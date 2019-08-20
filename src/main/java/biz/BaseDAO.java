package biz;

import javabean.FrontUser;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public interface BaseDAO {

    public boolean insert(String username, String password, String emall, String sex, String occ, String edu) throws  Exception;

    public FrontUser select(String username) throws  Exception;

    public boolean delete(String username) throws  Exception;

    public List up_select(String username) throws  Exception;

    public boolean update(String username, String password, String emall) throws  Exception;
}
