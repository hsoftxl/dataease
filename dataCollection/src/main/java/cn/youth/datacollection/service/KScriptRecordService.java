package cn.youth.datacollection.service;

import com.baomidou.mybatisplus.extension.service.IService;
import cn.youth.datacollection.entity.KScriptRecord;
import com.github.pagehelper.PageInfo;

import java.util.List;
import java.util.Map;

public interface KScriptRecordService extends IService<KScriptRecord> {
    PageInfo<KScriptRecord> findTransRecordList(KScriptRecord kScriptRecord, Integer page, Integer rows);

    List<KScriptRecord> selectErrorList(KScriptRecord kScriptRecord);

    PageInfo<KScriptRecord> selectErrorList(KScriptRecord kScriptRecord, Integer page, Integer rows);

    List<Map> get7DayScriptRunstatusForMysql();

}
