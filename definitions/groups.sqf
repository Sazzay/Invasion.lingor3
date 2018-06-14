/*
	Author: Markus "Sazzay" Larsson
	
	Description: Array of group configs.
*/

I_DEF_OPFOR_GROUPS = [
["MSV-EMR-SQUAD", ["rhs_msv_emr_sergeant", "rhs_msv_emr_efreitor", "rhs_msv_emr_grenadier_rpg", "rhs_msv_emr_strelok_rpg_assist", "rhs_msv_emr_machinegunner", "rhs_msv_emr_machinegunner_assistant", "rhs_msv_emr_LAT"]],
["MSV-EMR-SQUAD-MM", ["rhs_msv_emr_sergeant", "rhs_msv_emr_efreitor", "rhs_msv_emr_grenadier_rpg", "rhs_msv_emr_strelok_rpg_assist", "rhs_msv_emr_machinegunner", "rhs_msv_emr_machinegunner_assistant", "rhs_msv_emr_marksman"]],
["MSV-EMR-SQUAD-AA", ["rhs_msv_emr_sergeant", "rhs_msv_emr_efreitor", "rhs_msv_emr_aa", "rhs_msv_emr_aa", "rhs_msv_emr_machinegunner", "rhs_msv_LAT", "rhs_msv_emr_rifleman"]],
["VDV-EMR-SQUAD-SPC", ["rhs_vdv_sergeant", "rhs_vdv_efreitor", "rhs_vdv_arifleman", "rhs_vdv_arifleman", "rhs_vdv_machinegunner_assistant", "rhs_vdv_LAT", "rhs_vdv_grenadier", "rhs_vdv_machinegunner", "rhs_vdv_medic", "rhs_vdv_rifleman_asval"]],
["VDV-EMR-SQUAD-AT", ["rhs_vdv_sergeant", "rhs_vdv_efreitor","rhs_vdv_arifleman","rhs_vdv_machinegunner_assistant","rhs_vdv_LAT","rhs_vdv_grenadier","rhs_vdv_strelok_rpg_assist","rhs_vdv_at","rhs_vdv_LAT","rhs_vdv_rifleman"]],
["VDV-EMR-SQUAD-RECON", ["rhs_vdv_recon_sergeant", "rhs_vdv_recon_efreitor", "rhs_vdv_recon_arifleman", "rhs_vdv_recon_machinegunner_assistant", "rhs_vdv_recon_rifleman_lat", "rhs_vdv_recon_grenadier", "rhs_vdv_recon_marksman_vss", "rhs_vdv_recon_rifleman_ak103"]],
["VDV-EMR-SQUAD-AIRASSAULT", ["rhs_vdv_sergeant", "rhs_vdv_rifleman", "rhs_vdv_rifleman", "rhs_vdv_rifleman", "rhs_vdv_rifleman", "rhs_vdv_grenadier", "rhs_vdv_machinegunner", "rhs_vdv_junior_sergeant", "rhs_vdv_strelok_rpg_assist", "rhs_vdv_at"]],
["VMF-EMR-SQUAD-RECON", ["rhs_vmf_recon_sergeant", "rhs_vmf_recon_efreitor", "rhs_vmf_recon_arifleman", "rhs_vmf_recon_machinegunner_assistant", "rhs_vmf_recon_rifleman_lat", "rhs_vmf_recon_grenadier", "rhs_vmf_recon_medic", "rhs_vmf_recon_marksman_vss"]]
];

I_DEF_OPFOR_AA_VEHICLE_GROUPS = ["rhs_zsu234_aa", "RHS_Ural_Zu23_VDV_01", "rhs_gaz66_zu23_vdv", "RHS_ZU23_VDV"];

I_DEF_OPFOR_AA_GROUPS = [
["rhs_vdv_junior_sergeant", "rhs_vdv_aa", "rhs_vdv_aa", "rhs_vdv_aa", "rhs_vdv_rifleman"],
["rhs_msv_emr_junior_sergeant", "rhs_msv_emr_aa", "rhs_msv_emr_aa", "rhs_msv_emr_aa", "rhs_msv_emr_rifleman"]
];

I_DEF_OPFOR_INEFFICIENT_GROUPS = [
["MSV-INFANTRY-SQUAD", (configfile >> "CfgGroups" >> "East" >> "rhs_faction_msv" >> "rhs_group_rus_msv_infantry" >> "rhs_group_rus_msv_infantry_squad")],
["VDV-INFANTRY-SQUAD", (configfile >> "CfgGroups" >> "East" >> "rhs_faction_vdv" >> "rhs_group_rus_vdv_infantry_flora" >> "rhs_group_rus_vdv_infantry_flora_squad")]
];

I_DEF_LAND_AMBUSH_GROUPS = [
"MSV-INFANTRY-SQUAD", 
"VDV-INFANTRY-SQUAD"
];