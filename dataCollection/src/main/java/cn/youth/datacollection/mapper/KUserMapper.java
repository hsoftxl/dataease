package cn.youth.datacollection.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import cn.youth.datacollection.entity.KUser;

public interface KUserMapper extends BaseMapper<KUser> {
    int deleteByPrimaryKey(String id);

    int insert(KUser record);

    int insertSelective(KUser record);

    KUser selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(KUser record);

    int updateByPrimaryKey(KUser record);
}