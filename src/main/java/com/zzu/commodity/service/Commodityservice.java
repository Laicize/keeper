package com.zzu.commodity.service;

import com.zzu.commodity.dao.ICommodityDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Commodityservice implements ICommodityService {

    @Autowired
    ICommodityDao commodityDao;

    @Override
    public Object[] paging(int pageNo) {

        int pageSize =7;
        int position = (pageNo-1)*pageSize;
        Object [] datas = new Object[2];
        int count = commodityDao.getCount();
        datas[0]=count%pageSize==0?count/pageSize:count/pageSize+1;
        datas[1]=commodityDao.paging(position,pageSize);
        return datas;
    }

    @Override
    public boolean commodityDelete(String id) {
        return commodityDao.commodityDelete(id);
    }
}
