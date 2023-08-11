package cn.youth.datacollection.service;

import cn.youth.datacollection.core.povo.TreeDTO;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.extension.service.IService;
import cn.youth.datacollection.core.povo.Result;
import cn.youth.datacollection.entity.DiScript;

import java.util.*;

public interface DiScriptService extends IService<DiScript> {
    Result add(JSONObject json) throws Exception;

    void delete(String repId, String id, String type) throws Exception;

    void update(JSONObject jsonObject) throws Exception;

    Result<List<TreeDTO<String>>> findDiScriptByCatagoryId(String id, String repId, Integer pageNum, Integer pageSize);

    Result moveScript(JSONObject jsonObject) throws Exception;

    Map<String, Integer> findTransAndJobById(String id);
}
