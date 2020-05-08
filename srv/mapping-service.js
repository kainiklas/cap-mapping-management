const cds = require('@sap/cds');

module.exports = cds.service.impl(async (srv) => {

    const { Mappings } = srv.entities

    srv.on('approve', Mappings, async (req) => {

        const tx = cds.transaction(req);
        const id = req.query.SELECT.where[2].val

        const n = await tx.run(
            UPDATE(Mappings)
                .with({status_id : 2})
                .where({ID : id})
        );

        console.log(n); 

    });

    srv.on('reject', Mappings, async req => {
        const tx = cds.transaction(req);
        const id = req.query.SELECT.where[2].val

        const n = await tx.run(
            UPDATE(Mappings)
                .with({status_id : 3})
                .where({ID : id})
        );

        console.log(n); 
    })

}) 