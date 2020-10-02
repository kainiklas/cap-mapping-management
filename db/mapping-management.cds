namespace my.db;

using {
    managed,
    cuid,
    sap
} from '@sap/cds/common';

entity Mappings : managed, cuid {
    input_1  : String                    @(title : 'Input 1');
    input_2  : String                    @(title : 'Input 2');
    output   : String                    @(title : 'Output');
    category : Association to Categories @(title : 'Category');
    status   : Association to Status     @(title : 'Status') @Core.Immutable;
}

entity Categories : managed, sap.common.CodeList {
    key ID       : Integer;
        mappings : Association to many Mappings
                       on mappings.category = $self;
}

entity Status : managed, sap.common.CodeList {
    key ID       : Integer;
        mappings : Association to many Mappings
                       on mappings.status = $self;
}
