package cn.youth.datacollection.core.repository;

import cn.youth.datacollection.entity.KRepository;
import org.pentaho.di.repository.AbstractRepository;

public interface RepositoryFactory {
    AbstractRepository buildRepository(KRepository lRepository);
}
