package cn.youth.datacollection.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.youth.datacollection.entity.KDatabaseType;
import cn.youth.datacollection.mapper.KDatabaseTypeMapper;
import cn.youth.datacollection.service.KDatabaseTypeService;
import org.springframework.stereotype.Service;

@Service
public class KDatabaseTypeServiceImpl extends ServiceImpl<KDatabaseTypeMapper, KDatabaseType> implements KDatabaseTypeService {
}
