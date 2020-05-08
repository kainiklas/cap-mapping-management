using { simple } from './simple';

annotate simple.Things with {
    id    @(
        title       : 'ID',
        description : 'Identificator of the Thing'
    );

    value @(
        title       : 'Value',
        description : 'Value of the Thing'
    );

};


using SimpleService from '../srv/simple-service';

// TABLE
annotate SimpleService.Things with @(UI : {
    Identification  : [{Value : id}],
    SelectionFields : [
    id,
    value
    ],
    LineItem        : [
    {Value : id},
    {Value : value},
    {
        $Type              : 'UI.DataFieldForAction',
        Label              : 'ActionBound',
        Action             : 'SimpleService.actionBound',
        InvocationGrouping : #isolated
    }
    ],
    HeaderInfo      : {
        TypeName       : 'Thing',
        TypeNamePlural : 'Things',
        Title          : {Value : value}
    },
    HiddenFilter    : [ID]
});

// DETAIL PAGE
annotate SimpleService.Things with @(

UI : {
    Facets              : [{
        $Type  : 'UI.ReferenceFacet',
        Label  : 'General',
        Target : '@UI.FieldGroup#General'
    }],

    FieldGroup #General : {Data : [{Value : value}]} 
}

);
