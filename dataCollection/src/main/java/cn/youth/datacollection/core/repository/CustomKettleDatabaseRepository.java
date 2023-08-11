/*! ******************************************************************************
 *
 * Pentaho Data Integration
 *
 * Copyright (C) 2002-2017 by Hitachi Vantara : http://www.pentaho.com
 *
 *******************************************************************************
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 ******************************************************************************/

package cn.youth.datacollection.core.repository;

import org.pentaho.di.cluster.ClusterSchema;
import org.pentaho.di.cluster.SlaveServer;
import org.pentaho.di.core.ProgressMonitorListener;
import org.pentaho.di.core.database.DatabaseMeta;
import org.pentaho.di.core.exception.KettleException;
import org.pentaho.di.core.util.Utils;
import org.pentaho.di.job.JobMeta;
import org.pentaho.di.partition.PartitionSchema;
import org.pentaho.di.repository.ObjectId;
import org.pentaho.di.repository.RepositoryElementInterface;
import org.pentaho.di.repository.RepositoryOperation;
import org.pentaho.di.repository.kdr.KettleDatabaseRepository;
import org.pentaho.di.trans.TransMeta;

/**
 * This class handles interactions with a Kettle repository.
 *
 * @author Matt Created on 31-mrt-2004
 */
public class CustomKettleDatabaseRepository extends KettleDatabaseRepository {

    public CustomKettleDatabaseRepository() {
        super();
        metaStore = null;
    }

    public void save(RepositoryElementInterface repositoryElement, String versionComment) throws KettleException {
        save(repositoryElement, versionComment, null);
    }

    public void save(RepositoryElementInterface repositoryElement, String versionComment,
                     ProgressMonitorListener monitor, boolean overwrite) throws KettleException {
        save(repositoryElement, versionComment, monitor, null, false, overwrite);
    }

    public synchronized void save(RepositoryElementInterface repositoryElement, String versionComment,
                                  ProgressMonitorListener monitor, ObjectId parentId, boolean used, boolean overwrite) throws KettleException {

        try {
            lockRepository();

            if (!Utils.isEmpty(versionComment)) {
                insertLogEntry(versionComment);
            }

            switch (repositoryElement.getRepositoryElementType()) {
                case JOB:
                    this.getSecurityProvider().validateAction(RepositoryOperation.MODIFY_JOB);
                    jobDelegate.saveJob((JobMeta) repositoryElement, versionComment, monitor, overwrite);
                    break;
                case TRANSFORMATION:
                    this.getSecurityProvider().validateAction(RepositoryOperation.MODIFY_TRANSFORMATION);
                    transDelegate.saveTransformation((TransMeta) repositoryElement, versionComment, monitor, overwrite);
                    break;
                case DATABASE:
                    this.getSecurityProvider().validateAction(RepositoryOperation.MODIFY_DATABASE);
                    databaseDelegate.saveDatabaseMeta((DatabaseMeta) repositoryElement);
                    break;
                case SLAVE_SERVER:
                    this.getSecurityProvider().validateAction(RepositoryOperation.MODIFY_SLAVE_SERVER);
                    slaveServerDelegate.saveSlaveServer((SlaveServer) repositoryElement, parentId, used, overwrite);
                    break;
                case CLUSTER_SCHEMA:
                    this.getSecurityProvider().validateAction(RepositoryOperation.MODIFY_CLUSTER_SCHEMA);
                    clusterSchemaDelegate.saveClusterSchema(
                            (ClusterSchema) repositoryElement, versionComment, parentId, used, overwrite);
                    break;
                case PARTITION_SCHEMA:
                    this.getSecurityProvider().validateAction(RepositoryOperation.MODIFY_PARTITION_SCHEMA);
                    partitionSchemaDelegate.savePartitionSchema(
                            (PartitionSchema) repositoryElement, parentId, used, overwrite);
                    break;
                default:
                    throw new KettleException("We can't save the element with type ["
                            + repositoryElement.getRepositoryElementType() + "] in the repository");
            }

            // Automatically commit changes to these elements.
            //
            commit();
        } finally {
            unlockRepository();
        }
    }

}
