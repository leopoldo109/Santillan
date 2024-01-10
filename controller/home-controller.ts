module.exports = {
    home: function (_req: any, res: any) {
        res.render("home");
    },
    crear: function (_req: any, res: any) {
        res.render("crear-herramienta");
    },
    anotarAdelanto: function (req: any, res: any) {
        const id = req.params.id;
        console.log(id);
        res.render("anotar-adelanto", { id_personal: id });
    },
};
