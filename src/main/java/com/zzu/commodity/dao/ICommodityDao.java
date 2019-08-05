package com.zzu.commodity.dao;

import com.zzu.vo.Commodity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
*
*
*
*@author 王文重
*/
public interface ICommodityDao {

    /**
    *
    *
    *
    *@author 王文重
    */
    int getCount();

    /**
    *
    *
    *
    *@author 王文重
    */
    List<Commodity> paging(@Param("position") int position, @Param("pageSize") int pageSize);

    boolean commodityDelete(String id);
}
