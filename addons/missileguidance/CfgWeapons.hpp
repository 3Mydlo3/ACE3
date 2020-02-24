class CfgWeapons {
    class missiles_DAGR;

    class GVAR(dagr): missiles_DAGR {
        canLock = 0;
        magazines[] = {"6Rnd_ACE_Hydra70_DAGR","12Rnd_ACE_Hydra70_DAGR","24Rnd_ACE_Hydra70_DAGR"};
        lockingTargetSound[] = {"",0,1};
        lockedTargetSound[] = {"",0,1};
    };

    class missiles_SCALPEL;

    class GVAR(TV_Missile): missiles_SCALPEL {
        displayName = "TV Missile";
        canLock = 0;
        magazines[] = {"1Rnd_ACE_TV_Missile"};
        lockingTargetSound[] = {"",0,1};
        lockedTargetSound[] = {"",0,1};
    };
};
