const cds = require('@sap/cds');
module.exports = cds.service.impl(srv => {

    const { Things } = srv.entities;

    srv.on('READ', 'Things', req => {
        console.log('READ');
    })

    srv.on('actionUnbound', async req => {
        console.log("unbound");

        const tx = cds.transaction(req);
        const n = await tx.run(
            UPDATE(Things, 1)
                .set({value : 'actionUnbound'})
        );

    })

    srv.on('actionBound', Things, async req => {
        console.log("bound");

        const tx = cds.transaction(req);
        const n = await tx.run(
            UPDATE(Things)
                .set({value : 'actionBound'})
                .where(req.query.SELECT.where)
        );
    })

    srv.on('func', req => {
        return 'func'
    })

    srv.on('funcBound', Things, req => {
        return 'funcBound'
    })

})