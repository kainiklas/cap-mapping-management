using MappingService from '../../srv/mapping-service';

// TABLE
annotate MappingService.Mappings with @(UI : {
    Identification  : [
    {Value : name},
    {
        $Type              : 'UI.DataFieldForAction',
        Label              : 'Accept',
        Action             : 'my.db.MappingService.Mappings.MappingService.accept',
        InvocationGrouping : #isolated
    }
    ],
    SelectionFields : [category_ID],
    LineItem        : [
    {Value : ID},
    {Value : input_1},
    {Value : input_2},
    {Value : output},
    {Value : category.name},
    {
        $Type              : 'UI.DataFieldForAction',
        Label              : 'Accept',
        Action             : 'accept',
        InvocationGrouping : #isolated
    },
    ],
    HeaderInfo      : {
        TypeName       : 'Mapping',
        TypeNamePlural : 'Mappings',
        Title          : {Value : ID}
    },
    HiddenFilter    : [ID]
}) {
    category @Common : {Text : category.name};
};


// DETAIL PAGE
annotate MappingService.Mappings with @(

UI : {
    Facets              : [
    {
        $Type  : 'UI.ReferenceFacet',
        Label  : 'General',
        Target : '@UI.FieldGroup#General'
    },
    {
        $Type  : 'UI.ReferenceFacet',
        Label  : 'Admin',
        Target : '@UI.FieldGroup#Admin'
    },
    ],

    FieldGroup #General : {Data : [
    {Value : input_1},
    {Value : input_2},
    {Value : output},
    {Value : category_ID}
    ]},

    FieldGroup #Admin   : {Data : [
    {Value : createdBy},
    {Value : createdAt},
    {Value : modifiedBy},
    {Value : modifiedAt}
    ]}
}

);

annotate MappingService.Mappings with @odata.draft.enabled;
