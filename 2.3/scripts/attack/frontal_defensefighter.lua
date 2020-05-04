--===========================================================================
-- Stance supported AttackStyle for formations
-- gbx_cole
--===========================================================================

function DegToRad(angle)
	return angle * ((2.0 * 3.141592653589) / 360.0)
end

AttackStyleName = FaceTarget

Data = {
	-- when approaching the target use this method to split the formation and transition in to the attack style
	howToBreakFormation = StraightAndScatter,
	--	Once past this amount * the weapon range the ship will stop and face the target
	inRangeFactor = 0.85,
	inRangeFactorAg = 0.85,
	inRangeFactorEv = 0.99,
	-- once in range and facing the target we will slide around maintaining heading until we are more
	-- then this multiplied by our range from the target, then we will fly normally to catch up
	slideDistanceMultiplier = 1.0,
	tooSlowSpeed = 3.0,
	tooFastMultiplier = 1.4,
	facingAngle = 0,
	-- when facing faster targets we will start moving after they have been out of range for this long
	tooLongOutOfRange = 0.5,
	-- when doing a move attack we will break off if after we get further than this multipled by our max weapon range from the target.
	moveAttackMaxDistanceMultiplier = 1.2,
	tryToMatchHeight = 0,
	tryToGetAboveTarget = 0,
	-- delays for the things the attack style can do (in seconds)
	flyToTargetBecauseItsFarOutOfRangeDelay = 0.5,
	flyToTargetBecauseItsMovingAwayDelay = 0.1,
	stopAndFaceTheTargetDelay = 0.1,
	flyToAboveTheTargetDelay = 2.0,
	safeDistanceFromTargetToDoActions = 500.0,
	safeDistanceFromTargetToDoActionsAg = 500.0,
	safeDistanceFromTargetToDoActionsEv = 200.0,
	--	Make sure strike group members face their flight direction while following the leader rather than face their target as the follow
	strikeGroupFaceFlightDir = 1,
	-- done at the end of every strafing run
	RandomActions = {
		{
			Type = PickNewTarget,
			Weighting = 5
		},
		{
			Type = NoAction,
			Weighting = 50,
			stance = "Ev"
		},
		{
			Type = NoAction,
			Weighting = 100,
			stance = "Ag"
		},
		{
			Type = InterpolateTarget,
			Weighting = 10,
			-- interpolate for 3 seconds, no variation
			minParam = 3,
			maxParam = 3,
			heatCost = 5,
			heatThresh = 0
		},
		{
			Type = MoveRoundTarget,
			minParam = DegToRad(10),
			maxParam = DegToRad(30),
			heatCost = 3,
 			heatThresh = 0,
			stance = "Ag,Pa",
			Weighting = 30,
		},
	},
	BeingAttackedActions = {
		{
			Type = NoAction,
			Weighting = 25,
			stance = "Ag,Pa"
		},
		{
			Type = MoveRoundTarget,
			minParam = DegToRad(10),
			maxParam = DegToRad(30),
			heatCost = 3,
 			heatThresh = 0,
			stance = "Ag,Pa",
			Weighting = 30,
		},
		{
			Type = PickNewTarget,
			Weighting = 9
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "RollCCW_Evasive_Static",
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "DodgeRoll_Right_Static_Evasive",
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "DodgeRoll_Left_Static_Evasive",
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "Dodge_Evasive_Static",
			stance = "Ev"
		},
		{
			Type = InterpolateTarget,
			Weighting = 10,
			-- interpolate for 3 seconds, no variation
			minParam = 3,
			maxParam = 3,
			heatCost = 5,
			heatThresh = 0
		}
	},
	FiringActions = {
		{
			Type = NoAction,
			Weighting = 25,
			stance = "Ag,Pa"
		},
		{
			Type = NoAction,
			Weighting = 5,
			stance = "Ev"
		},
		{
			Type = MoveRoundTarget,
			minParam = DegToRad(10),
			maxParam = DegToRad(30),
			heatCost = 3,
 			heatThresh = 0,
			stance = "Ag,Pa",
			Weighting = 30,
		},
		{
			Type = MoveRoundTarget,
			minParam = DegToRad(20),
			maxParam = DegToRad(40),
			heatCost = 3,
 			heatThresh = 0,
			stance = "Ag,Pa",
			Weighting = 30,
		},
		{
			Type = InterpolateTarget,
			Weighting = 1,
			-- interpolate for 3 seconds, no variation
			minParam = 3,
			maxParam = 3,
			stance = "Ag"
		},
		{
			Type = InterpolateTarget,
			Weighting = 1,
			-- interpolate for 3 seconds, no variation
			minParam = 3,
			maxParam = 6,
			stance = "Ev"
		},
		{
			Type = NoAction,
			Weighting = 40,
			stance = "Ag"
		},
		{
			Type = NoAction,
			Weighting = 20,
			stance = "Ev"
		},
		{
			Type = PickNewTarget,
			Weighting = 10,
			stance = "Ag"
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "RollCCW_Evasive_Static",
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "DodgeRoll_Right_Static_Evasive",
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "DodgeRoll_Left_Static_Evasive",
			stance = "Ev"
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "Dodge_Evasive_Static",
			stance = "Ev"
		}
	}
}
