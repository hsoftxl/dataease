package cn.youth.datacollection.service.impl;

import cn.hutool.core.util.StrUtil;
import cn.youth.datacollection.core.povo.TreeDTO;
import cn.youth.datacollection.util.SecUtil;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.youth.datacollection.core.povo.Result;
import cn.youth.datacollection.core.repository.RepositoryUtil;
import cn.youth.datacollection.entity.*;
import cn.youth.datacollection.mapper.DiCategoryMapper;
import cn.youth.datacollection.mapper.DiScriptMapper;
import cn.youth.datacollection.mapper.KRepositoryMapper;
import cn.youth.datacollection.service.DiCategoryService;
import cn.youth.datacollection.util.BeanUtil;
import org.pentaho.di.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class DiCategoryServiceImpl extends ServiceImpl<DiCategoryMapper, DiCategory> implements DiCategoryService {
    @Autowired
    DiCategoryMapper diCategoryMapper;
    @Autowired
    DiScriptMapper diScriptMapper;
    @Autowired
    KRepositoryMapper kRepositoryMapper;
    @Value("${spoon.url}")
    private String REPOSITORY_URL;

    @Override
    public Result<Object> delete(String dirId, String repId) throws Exception {
        Result result = new Result();
        AbstractRepository abstractRepository = RepositoryUtil.getAbstractRepository(repId);
        RepositoryDirectoryInterface directory = abstractRepository.loadRepositoryDirectoryTree().findDirectory(RepositoryUtil.getObjectId(abstractRepository, dirId));
        List<RepositoryDirectoryInterface> children = directory.getChildren();
        if (children.size() == 0) {
            abstractRepository.deleteRepositoryDirectory(directory);
            result.setCode("0000");
            result.setMessage("删除成功！");
        } else {
            result.setCode("9999");
            result.setMessage("当前目录存在下级目录或脚本，不允许删除！");
        }
        return result;
    }

    public void update(JSONObject json) throws Exception {
        AbstractRepository abstractRepository = RepositoryUtil.getAbstractRepository(json.getString("repId"));
        RepositoryDirectoryInterface directory = abstractRepository.loadRepositoryDirectoryTree().findDirectory(RepositoryUtil.getObjectId(abstractRepository, json.getLong("dirId")));
        abstractRepository.renameRepositoryDirectory(new LongObjectId(json.getLong("dirId")), directory.getParent(), json.getString("name"));
    }

    public List<TreeDTO<String>> findDiCateryByRep(String repId) throws Exception {
        List<TreeDTO<String>> treeList = new ArrayList<>();
        AbstractRepository abstractRepository = RepositoryUtil.getAbstractRepository(repId);
        // 获取当前的路径信息
        RepositoryDirectoryInterface rdi = abstractRepository.loadRepositoryDirectoryTree().findDirectory("");
        List<TreeDTO<String>> subdirectories = RepositoryUtil.getSubdirectories(new ArrayList<>(), rdi);
        /*subdirectories.forEach(dt -> {
            try {
                treeList.addAll(RepositoryUtil.getSubdirectories(abstractRepository.loadRepositoryDirectoryTree().findDirectory(dt.getExtra())));
            } catch (KettleException e) {
                e.printStackTrace();
            }
        });*/
        treeList.addAll(subdirectories);
        //List<DiCategory> all = diCategoryMapper.findByRepIdOrderByCode(repId);
        return subdirectories;
    }

    public DiRespository findRepositoryById(String id) {
        KRepository kRepository = kRepositoryMapper.selectById(id);
        DiRespository repDto = null;
        if (kRepository != null) {
            repDto = BeanUtil.copyProperties(kRepository, DiRespository.class);
        }
        repDto.setUrl(REPOSITORY_URL);
        return repDto;
    }

    public Result add(JSONObject json) throws Exception {
        Result result = new Result();
        AbstractRepository abstractRepository = RepositoryUtil.getAbstractRepository(json.getString("repId"));
        RepositoryDirectoryInterface directory;
        if (json.containsKey("dirId") && !StrUtil.isEmpty(json.getString("dirId"))) {
            directory = abstractRepository.loadRepositoryDirectoryTree().findDirectory(RepositoryUtil.getObjectId(abstractRepository, json.get("dirId")));
        } else {
            directory = abstractRepository.getUserHomeDirectory();
        }
        RepositoryDirectoryInterface directoryChild = directory.findChild(json.getString("name"));
        if (directoryChild == null) {
            abstractRepository.createRepositoryDirectory(directory, json.getString("name"));
            result.setCode("0000");
            result.setMessage("创建成功！");
        } else {
            result.setCode("9999");
            result.setMessage("目录已存在！");
        }

        return result;
    }

    @Override
    public DiRespository getEncryptionUrl(String id, int type, String scriptId) {
        KRepository kRepository = kRepositoryMapper.selectById(id);
        DiRespository repDto = null;
        if (kRepository != null) {
            repDto = BeanUtil.copyProperties(kRepository, DiRespository.class);
        }
        String encryptionUrl = "rep="+repDto.getRepName()+"&user="+repDto.getRepUsername()+"&pass="+repDto.getRepPassword();
        if (type == 1) {
            encryptionUrl = encryptionUrl+"&trans=" + scriptId;
        } else {
            encryptionUrl = encryptionUrl+"&job=" + scriptId;
        }
        repDto.setRepPassword("");
        repDto.setRepUsername("");
        encryptionUrl = SecUtil.encrypt(encryptionUrl.trim());
        repDto.setUrl(REPOSITORY_URL+"?respoon="+encryptionUrl);
        return repDto;
    }
}
