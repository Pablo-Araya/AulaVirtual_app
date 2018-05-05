class PivotAlumnoCatedra < ApplicationRecord
	t.references :student
  	t.references :catedra
end
