package cn.youth.datacollection.core.repository;

import cn.youth.datacollection.entity.KRepository;
import org.pentaho.di.repository.AbstractRepository;

public class FileRepository implements RepositoryFactory {
    @Override
    public AbstractRepository buildRepository(KRepository lRepository) {
        return RepositoryUtil.createConnection(lRepository);
    }
}
