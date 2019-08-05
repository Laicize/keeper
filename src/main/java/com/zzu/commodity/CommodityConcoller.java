package com.zzu.commodity;

import com.zzu.commodity.service.ICommodityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
@RequestMapping("/commodity")
public class CommodityConcoller {

    @Autowired
    ICommodityService commodityService;

    public void getModle(int pageNo, Map<String ,Object> map){
        map.put("pageTotal",commodityService.paging(pageNo)[0]);
        map.put("commodities",commodityService.paging(pageNo)[1]);
    }

    @RequestMapping("/commodityView.do")
    public String commodityView(Map<String ,Object> map){
        getModle(1,map);
        return "commodity/commodityView";
    }

    @RequestMapping("commodityViewFrag.do")
    public String commodityViewFrag(int pageNo,Map<String ,Object> map){
        getModle(pageNo, map);
        return "commodity/commodityViewFrag";
    }

    @ResponseBody
    @RequestMapping("/commodityDelete.do")
    public boolean employeeDelete(String id){

        return commodityService.commodityDelete(id);
    }

}
