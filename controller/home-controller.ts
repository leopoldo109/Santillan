module.exports = {
    home: function (_req: any, res: any) {
        res.render("home");
    },
    crear: function (_req: any, res: any) {
        res.render("crear-herramienta");
    },
    sala: function (_req: any, res: any) {
        res.render("sala");
    },
};
