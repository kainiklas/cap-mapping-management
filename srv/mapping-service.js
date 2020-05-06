const cds = require('@sap/cds');

module.exports = cds.service.impl((srv) => {

    const { Mappings } = cds.entities('my.db');

    srv.on('accept', 'Mappings', async (req) => {
        console.log(req);
    });

})