local resource_autoplace = require("resource-autoplace-fix")

for _, resource in pairs(data.raw["resource"]) do
	log("processing resource: " .. resource.name)
	if resource.category then
		log("category: " .. resource.category)
	end

	if resource.autoplace and resource.name and not resource.category then
		resource.autoplace = resource_autoplace.resource_autoplace_settings({
			name = resource.name,
			order = resource.autoplace.order or "d",
			base_density = resource.autoplace.base_density or 10,
			base_spots_per_km2 = resource.autoplace.base_spots_per_km2 or 2,
			has_starting_area_placement = resource.autoplace.has_starting_area_placement or false,
			regular_rq_factor_multiplier = resource.autoplace.regular_rq_factor_multiplier or 1,
		})
	end
end
