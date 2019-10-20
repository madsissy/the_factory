# CLEAN DB
Job.destroy_all
Clothe.destroy_all

# JOBS
Job.create(name: 'Maid', will_needed: 50, sub_skill_needed: 30)
Job.create(name: 'Prostitute', will_needed: 30, sub_skill_needed: 10)

# CLOTHES
Clothe.create(name: 'Pink sneakers', feminity_needed: 10, modifier: 20, kind: 'shoes')
Clothe.create(name: 'High heels', feminity_needed: 60, modifier: 50, kind: 'shoes')
Clothe.create(name: 'Casual outfit', feminity_needed: 0, modifier: 0, kind: 'outfit')
Clothe.create(name: 'Maid outfit', feminity_needed: 30, sub_skill_needed: 30, modifier: 50, kind: 'outfit')
Clothe.create(name: 'Slutty outfit', feminity_needed: 50, sub_skill_needed: 10, modifier: 50, kind: 'outfit')
