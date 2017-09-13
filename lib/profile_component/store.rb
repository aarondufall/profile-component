module ProfileComponent
  class Store
    include EntityStore

    category :profile
    entity Profile
    projection Projection
    reader MessageStore::Postgres::Read
  end
end
