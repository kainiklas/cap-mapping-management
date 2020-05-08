using MappingService from '../../srv/mapping-service';

annotate MappingService.Categories with @odata.draft.enabled;

annotate MappingService.Categories with @(

UI : {
    Identification      : [{Value : name}],
    SelectionFields     : [name],
    LineItem            : [{Value : name}],
    HeaderInfo          : {
        TypeName       : 'Category',
        TypeNamePlural : 'Categories',
        Title          : {Value : name}
    },
    HiddenFilter        : [ID],
    Facets              : [{
        $Type  : 'UI.ReferenceFacet',
        Label  : 'General',
        Target : '@UI.FieldGroup#General'
    }],

    FieldGroup #General : {Data : [{Value : name}]}
    
});