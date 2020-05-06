using my.db as db from '../db/schema';

service MappingService {

    entity Mappings as projection on db.Mappings
    actions {
        action accept();
        action reject();
    };

    entity Categories as projection on db.Categories;
    
}
