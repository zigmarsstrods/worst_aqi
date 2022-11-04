desc "DB refresh"
task db_update: :environment do
    Station.destroy_all
    st = StationService.new
    st.results
end