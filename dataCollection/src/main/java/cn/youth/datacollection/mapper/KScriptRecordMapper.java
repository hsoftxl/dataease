package cn.youth.datacollection.mapper;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import cn.youth.datacollection.entity.KScriptRecord;

import java.util.List;
import java.util.Map;

public interface KScriptRecordMapper extends BaseMapper<KScriptRecord> {
    List<KScriptRecord> selectAllBySid(KScriptRecord kScriptRecord);

    List<KScriptRecord> selectErrorList(KScriptRecord kScriptRecord);

    List<Map> get7DayScriptRunstatusForMysql();

    JSON get7DayScriptRunstatusForOracle();

}
