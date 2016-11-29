-- =============================================================
-- Copyright Roaming Gamer, LLC. 2008-2016 (All Rights Reserved)
-- =============================================================
-- math.* - Extension(s)
-- =============================================================
--   Last Updated: 23 NOV 2016
-- Last Validated: 
-- =============================================================

local mDeg  = math.deg
local mRad  = math.rad
local mCos  = math.cos
local mSin  = math.sin
local mAcos = math.acos
local mAsin = math.asin
local mSqrt = math.sqrt
local mCeil = math.ceil
local mFloor = math.floor
local mAtan2 = math.atan2
local mPi = math.pi



-- ===============================================
-- ==          Caclulate Wrap Point
-- ===============================================
--[[
h ssk.components.EFM
d EFM
s ssk.components.EFM()
s * EFM - EFM
r None.
--]]

function math.normRot( toNorm )
	if( type(toNorm) == "table" ) then
		while( toNorm.rotation >= 360 ) do toNorm.rotation = toNorm.rotation - 360 end		
		while( toNorm.rotation < 0 ) do toNorm.rotation = toNorm.rotation + 360 end
		return 
	else
		while( toNorm >= 360 ) do toNorm = toNorm - 360 end
		while( toNorm < 0 ) do toNorm = toNorm + 360 end
	end
	return toNorm
end



-- Calculate the distance from one decimal lat-long position to another.
-- Distance is a multiple of R (either kilometers or miles)
-- More accurate for short distances than long.
function math.haversine_dist( lat1, lng1, lat2, lng2, R )

	--[[ haversine formula
	dlon = lon2 - lon1 
	dlat = lat2 - lat1 
	a = (sin(dlat/2))^2 + cos(lat1) * cos(lat2) * (sin(dlon/2))^2 
	c = 2 * atan2( sqrt(a), sqrt(1-a) ) 
	d = R * c (where R is the radius of the Earth;  radius of the Earth: 3961 miles and 6373 km) 
	--]]

	local R = R or 6373 -- Default radius of earth in km
	local dlng = mRad(lng2 - lng1)
	local dlat = mRad(lat2 - lat1)

	local lat1 = mRad(lat1)
	local lat2 = mRad(lat2)

	local a = (mSin(dlat/2))^2 + mCos(lat1) * mCos(lat2) * (mSin(dlng/2))^2 
	local c = 2 * mAtan2( mSqrt(a), mSqrt(1-a) ) 
	local d = R * c --(where R is the radius of the Earth)

	return d
end
--print(haversine_dist( lat1, lng1, lat2, lng2 ))


local mRand = math.random
local keySrc = "abcdefghijklmnopqrstuvwxyaABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
--local keySrc = "abcdefghijklmnopqrstuvwxyaABCDEFGHIJKLMNOPQRSTUVWXYZ"
local keyTbl = {}
for i = 1, #keySrc do
  keyTbl[i] = keySrc:sub(i,i)
end
--table.dump(keyTbl)

math.getUID = function( rlen )
  local tmp = ""
  local max = #keyTbl
  for i = 1, rlen do
    tmp = tmp .. keyTbl[mRand(1,max)]
  end
  return tmp
end
