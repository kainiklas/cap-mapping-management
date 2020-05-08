using my.db as db from '../db/mapping-management';

service MappingService {

    entity Mappings as projection on db.Mappings actions {
        action approve();
        action reject();
    };

    entity Categories as projection on db.Categories;
}
