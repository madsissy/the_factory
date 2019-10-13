module Sissy::CreateOrUpdateJob

  def create_or_update_job job_name
    job = Job.find_by(name: job_name)
    @sissy.sissy_jobs.update_all(current_job: false)

    if has_required_stats? job
      if @sissy.jobs.where(name: job_name).empty?
        @sissy.sissy_jobs.create(job: job, experience: 0, current_job: true)
      else
        @sissy.sissy_jobs.find_by(job_id: job.id).update(current_job: true)
      end
      true
    else
      false
    end

  end

  private

  def has_required_stats? job
    (@sissy.will <= job.will_needed) || (@sissy.sub_skill >= job.sub_skill_needed)
  end
end
