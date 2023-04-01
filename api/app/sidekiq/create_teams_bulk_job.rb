class CreateTeamsBulkJob
  include Sidekiq::Job

  def perform(*args)
    json = args.first
    data = JSON.parse json
    tbh = TeamBulkHandler.new data

    tbh.call
  end
end
