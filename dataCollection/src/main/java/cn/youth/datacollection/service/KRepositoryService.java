package cn.youth.datacollection.service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.extension.service.IService;
import cn.youth.datacollection.core.povo.TreeDTO;
import cn.youth.datacollection.entity.KRepository;
import com.github.pagehelper.PageInfo;
import org.pentaho.di.repository.RepositoryObjectType;

import java.util.List;

public interface KRepositoryService extends IService<KRepository> {

    void add(KRepository repository);

    void delete(String id);

    void deleteBatch(List<String> ids);

    void update(KRepository repository);

    PageInfo<KRepository> findRepListByPage(KRepository repository, Integer page, Integer rows);

    KRepository getRepositoryDetail(String id);

    List<KRepository> findRepList();

    TreeDTO<String> findRepTreeById(String id, RepositoryObjectType objectType) throws Exception;


    List<TreeDTO<String>> findTransRepTreegridById(String id, String dirPath) throws Exception;

    void testConnection(KRepository repository);

    List<TreeDTO<String>> initTransRep(String id, String dirPath) throws Exception;
    /*public KRepository getByRepName(String repName);*/

    JSONArray getDatabasesByRepId(String id) throws Exception;

    List<String> selectAllRep();

    String createRepository(JSONObject jsonObject) throws Exception;
}
