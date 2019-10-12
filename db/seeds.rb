# CLEAN DB
Job.destroy_all

# JOBS
Job.create(name: 'Maid', will_needed: 50, sub_skill_needed: 70)
