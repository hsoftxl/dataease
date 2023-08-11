package cn.youth.datacollection.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import cn.youth.datacollection.entity.KQuartz;

/**
 * 定时任务管理业务逻辑层
 *
 * @author lyf
 */
public interface KQuartzService extends IService<KQuartz> {
    Page<KQuartz> findListByPage(KQuartz quartz, Integer page, Integer rows);
}
