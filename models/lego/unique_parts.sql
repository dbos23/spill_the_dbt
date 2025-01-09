SELECT 
	P.part_num
FROM {{ source('lego', 'lego_parts') }} as P
INNER JOIN {{ source('lego', 'lego_inventory_parts') }} as IP on P.part_num = IP.part_num
INNER JOIN {{ source('lego', 'lego_inventories') }} as I on I.id = IP.inventory_id
INNER JOIN {{ source('lego', 'lego_sets') }} as S on S.set_num = I.set_num
	GROUP BY P.part_num
	HAVING COUNT(*) = 1