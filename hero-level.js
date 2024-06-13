const heroName = "Jessica";
const heroXP = 9000;

const levels = [
    { name: "Iron", limit: 1000 },
    { name: "Bronze", limit: 2000 },
    { name: "Silver", limit: 5000 },
    { name: "Gold", limit: 7000 },
    { name: "Platinum", limit: 8000 },
    { name: "Ascendant", limit: 9000 },
    { name: "Immortal", limit: 10000 },
    { name: "Radiant", limit: Infinity }
];

let heroLevel = "Iron";
for (const level of levels) {
    if (heroXP <= level.limit) {
        heroLevel = level.name;
        break;
    }
}

console.log(`O Herói de nome ${heroName} está no nível de ${heroLevel}`);
