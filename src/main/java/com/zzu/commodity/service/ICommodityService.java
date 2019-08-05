package com.zzu.commodity.service;

public interface ICommodityService {

    Object[] paging(int pageNo);

    boolean commodityDelete(String id);
}
