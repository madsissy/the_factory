# CLEAN DB
Job.destroy_all

# JOBS
Job.create(name: 'Maid', will_needed: 50, sub_skill_needed: 30)
Job.create(name: 'Prostitute', will_needed: 30, sub_skill_needed: 10)
