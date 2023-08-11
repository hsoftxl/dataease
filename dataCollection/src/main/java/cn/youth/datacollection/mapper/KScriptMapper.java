package cn.youth.datacollection.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import cn.youth.datacollection.entity.KScript;

import java.util.List;
public interface KScriptMapper extends BaseMapper<KScript> {

      List<KScript> selectAll(KScript kScript);

      //KScript selectBySid(String id);

      List<KScript> taskCount();

}
