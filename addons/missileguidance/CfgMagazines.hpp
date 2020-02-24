class CfgMagazines {
    class 12Rnd_PG_missiles;

    class 6Rnd_ACE_Hydra70_DAGR : 12Rnd_PG_missiles {
        ammo = "ACE_Hydra70_DAGR";
        count = 12;
        displayName = "6 Round DAGR";
        displayNameShort = "6 Round DAGR";
        descriptionShort = "6 Round DAGR";
        weight = 36;

    };
    class 12Rnd_ACE_Hydra70_DAGR : 6Rnd_ACE_Hydra70_DAGR {
        count = 12;
        displayName = "16 Round DAGR";
        displayNameShort = "16 Round DAGR";
        descriptionShort = "16 Round DAGR";
        weight = 72;
    };
    class 24Rnd_ACE_Hydra70_DAGR : 6Rnd_ACE_Hydra70_DAGR {
        count = 24;
        displayName = "24 Round DAGR";
        displayNameShort = "24 Round DAGR";
        descriptionShort = "24 Round DAGR";
        weight = 72;
    };

    class PylonMissile_1Rnd_LG_scalpel;
    class 1Rnd_ACE_TV_Missile: PylonMissile_1Rnd_LG_scalpel {
        ammo = "ACE_TV_Missile";
        count = 1;
        displayName = "1 Round TV Missile";
        displayNameShort = "1 Round TV Missile";
        descriptionShort = "1 Round TV Missile";
        pylonWeapon = QGVAR(TV_Missile);
        weight = 400;
    };
};
