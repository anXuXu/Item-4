package biz;

import javabean.FrontUser;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface WyDao {
    public boolean insert(Object objectA, Object objectB, Object objectC) throws  Exception;

    public Map select(Object objectA) throws  Exception;

    public boolean delete(Object objectA) throws  Exception;

    public List up_select(Object objectA) throws  Exception;

    public boolean update(Object objectA, Object objectB, Object objectC) throws  Exception;

}
