class Release < ApplicationRecord
    mount_uploader :release_art, ReleaseArtUploader
end
