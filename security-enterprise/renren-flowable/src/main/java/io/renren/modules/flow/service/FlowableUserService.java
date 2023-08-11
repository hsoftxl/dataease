package io.renren.modules.flow.service;

import io.renren.modules.flow.dao.FlowableUserDao;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class FlowableUserService {
    private final FlowableUserDao flowableUserDao;

    public List<String> getRealNameList(List<Long> ids) {
        return flowableUserDao.getRealNameList(ids);
    }

    public List<String> getRoleNameList(List<Long> ids) {
        return flowableUserDao.getRoleNameList(ids);
    }
    
}
