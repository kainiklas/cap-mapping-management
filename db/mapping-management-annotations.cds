using {my.db as db} from './mapping-management';

annotate db.Categories with {
    ID   @title : 'Category ID';
    name @title : 'Category';
};

annotate db.Mappings with {
    ID   @title : 'Mapping ID';
    name @title : 'Mappings';
};
