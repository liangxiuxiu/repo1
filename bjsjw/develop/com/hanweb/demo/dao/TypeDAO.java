package com.hanweb.demo.dao;

import org.springframework.stereotype.Repository;

import com.hanweb.common.basedao.BaseJdbcDAO;
import com.hanweb.common.basedao.Query;
import com.hanweb.common.basedao.UpdateSql;
import com.hanweb.demo.constant.Tables;
import com.hanweb.demo.entity.Type;

@Repository
public class TypeDAO extends BaseJdbcDAO<Integer, Type> {
    /**
     * 查询
     * 
     * @param id
     * @return
     */
    public Type find(Integer id) {
        String sql = "select * from " + Tables.TYPE
                + " where integer_field = :integer_field";
        Query query = createQuery(sql);
        query.addParameter("integer_field", id);
        Type type = queryForEntity(query);
        return type;
    }
    
    /**
     * 修改大字段
     * 
     * @param integer_field
     *                   主键
     * @param blob
     *           大字段
     * @return true - 成功<br/>
     *         false - 失败
     */
    public boolean updateBlob(Integer integer_field, byte[] blob) {
        UpdateSql sql = new UpdateSql(Tables.TYPE);

        sql.addParam("blob_field", blob);
        sql.setWhere("integer_field = :integer_field");
        sql.addWhereParamInt("integer_field", integer_field);

        return super.update(sql);

    }
}
