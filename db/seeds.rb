# CLEAN DB
Job.destroy_all
Clothe.destroy_all

# JOBS
Job.create(name: 'Maid', will_needed: 50, sub_skill_needed: 30)
Job.create(name: 'Prostitute', will_needed: 30, sub_skill_needed: 10)

# CLOTHES
Clothe.create(name: 'Pink sneakers', will_needed: 0, feminity_needed: 10, modifier: 20, kind: 'shoes', price: 200)
Clothe.create(name: 'High heels', will_needed: 0, feminity_needed: 60, modifier: 50, kind: 'shoes', price: 500)
Clothe.create(name: 'Maid outfit', will_needed: 0, feminity_needed: 30, sub_skill_needed: 30, modifier: 50, kind: 'outfit', price: 1000)
Clothe.create(name: 'Slutty outfit', will_needed: 0, feminity_needed: 50, sub_skill_needed: 10, modifier: 50, kind: 'outfit', price: 1000)
