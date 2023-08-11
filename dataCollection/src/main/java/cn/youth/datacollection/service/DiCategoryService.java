package cn.youth.datacollection.service;

import cn.youth.datacollection.core.povo.TreeDTO;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.extension.service.IService;
import cn.youth.datacollection.core.povo.Result;
import cn.youth.datacollection.entity.DiCategory;
import cn.youth.datacollection.entity.DiRespository;

import java.util.List;

public interface DiCategoryService extends IService<DiCategory> {
    Result<Object> delete(String dirId, String repId) throws Exception;

    void update(JSONObject json) throws Exception;

    List<TreeDTO<String>> findDiCateryByRep(String repId) throws Exception;

    DiRespository findRepositoryById(String id);

    Result add(JSONObject json) throws Exception;

    DiRespository getEncryptionUrl(String id, int type, String scriptId);

}
