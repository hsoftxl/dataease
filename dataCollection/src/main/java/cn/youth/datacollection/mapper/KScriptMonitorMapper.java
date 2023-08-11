package cn.youth.datacollection.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import cn.youth.datacollection.entity.KScriptMonitor;

import java.util.List;
import java.util.Map;

public interface KScriptMonitorMapper extends BaseMapper<KScriptMonitor> {
    List<KScriptMonitor> selectAll(KScriptMonitor kScriptMonitor);
    Map countTrans();
    KScriptMonitor selectBySid(String id);

}
