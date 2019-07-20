package com.hanweb.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanweb.demo.dao.TypeDAO;
import com.hanweb.demo.entity.Type;
import com.hanweb.demo.exception.DemoException;

@Service
public class TypeService {

    @Autowired
    private TypeDAO typeDAO;

    /**
     * 新增
     * 
     * @param type
     *            类型
     * @throws DemoException
     * @return
     */
    public boolean add(Type type) throws DemoException {
        boolean isSuccess = false;
        Integer id = typeDAO.insert(type);
        if (id > 0) {
            isSuccess = true;
        } else {
            throw new DemoException("添加失败");
        }
        return isSuccess;
    }

    /**
     * 删除
     * 
     * @param ids
     *            主键
     * @throws DemoException
     * @return
     */
    public boolean delete(String ids) throws DemoException {
        boolean isSuccess = false;
        Integer integer_field = Integer.parseInt(ids);
        isSuccess = typeDAO.deleteById(integer_field);
        if (!isSuccess) {
            throw new DemoException("删除失败");
        }
        return isSuccess;
    }

    /**
     * 修改
     * 
     * @param type
     *            类型
     * @throws DemoException
     * @return
     */
    public boolean modify(Type type) throws DemoException {
        boolean isSuccess = false;
        boolean isFirstSuccess = false;
        boolean isSecondSuccess = false;
        isFirstSuccess = typeDAO.update(type);
        if (type.getBlob_field() != null) {
            isSecondSuccess = typeDAO.updateBlob(type.getInteger_field(),
                    type.getBlob_field());
        }
        if ((isFirstSuccess == true && isSecondSuccess == true)
                || (isFirstSuccess == true && type.getBlob_field() == null)) {
            isSuccess = true;
        }
        if (!isSuccess) {
            throw new DemoException("修改失败");
        }
        return isSuccess;
    }

    /**
     * 查询
     * 
     * @param integer_field
     *            主键
     * @throws DemoException
     * @return
     */
    public Type find(Integer integer_field) throws DemoException {
        if (integer_field == null) {
            return null;
        }
        Type type = typeDAO.find(integer_field);
        if (type == null) {
            throw new DemoException("获取失败");
        }
        return type;
    }
}
