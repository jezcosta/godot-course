function rankedCalc(victories, defeats) {
    const totalVictories = victories - defeats;

    const lvls = [
        { limit: 10, name: "Ferro" },
        { limit: 20, name: "Bronze" },
        { limit: 50, name: "Prata" },
        { limit: 80, name: "Ouro" },
        { limit: 90, name: "Diamante" },
        { limit: 100, name: "Lendário" },
        { limit: Infinity, name: "Imortal" }
    ];

    const lvl = lvls.find(lvl => victories <= lvl.limit).name;

    return `O Herói tem de saldo de ${totalVictories} está no nível de ${lvl}`;
}

const result = rankedCalc(95, 20);
console.log(result);
