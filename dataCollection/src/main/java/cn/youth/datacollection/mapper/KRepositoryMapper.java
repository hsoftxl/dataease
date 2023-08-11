package cn.youth.datacollection.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import cn.youth.datacollection.entity.KRepository;

import java.util.List;

public interface KRepositoryMapper extends BaseMapper<KRepository> {

    List<String> selectAllRep();
}
