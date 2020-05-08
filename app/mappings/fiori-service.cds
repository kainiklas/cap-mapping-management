using MappingService from '../../srv/mapping-service';

annotate MappingService.Mappings with @odata.draft.enabled;

// TABLE
annotate MappingService.Mappings with @(UI : {
    Identification  : [{Value : name}],
    SelectionFields : [category_ID],
    LineItem        : [
    {Value : input_1},
    {Value : input_2},
    {Value : output},
    {Value : category.name},
    {Value : status.name},
    {
        $Type              : 'UI.DataFieldForAction',
        Label              : 'Approve',
        Action             : 'MappingService.approve',
        InvocationGrouping : #isolated
    },
    {
        $Type              : 'UI.DataFieldForAction',
        Label              : 'Reject',
        Action             : 'MappingService.reject',
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
    {Value : category_ID},
    {Value : status.name}
    ]},

    FieldGroup #Admin   : {Data : [
    {Value : createdBy},
    {Value : createdAt},
    {Value : modifiedBy},
    {Value : modifiedAt}
    ]}
}

);
