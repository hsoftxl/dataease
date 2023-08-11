package cn.youth.datacollection.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import cn.youth.datacollection.entity.KCategory;
import cn.youth.datacollection.entity.KScript;

public interface KCategoryService extends IService<KCategory> {

    Page<KCategory> findCategoryListByPage(KCategory category, Integer page, Integer rows);

    Page<KScript> findListByPageSimple(String cid, String name, Integer pageNum, Integer pageSize, Integer type);
}
