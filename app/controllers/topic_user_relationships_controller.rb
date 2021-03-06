#
# Submify - Dashboard of web and web activity
# Copyright (C) 2013 Vysakh Sreenivasan <support@submify.com>
#
# This file is part of Submify.
#
# Submify is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# Submify is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with Submify.  If not, see <http://www.gnu.org/licenses/>.
#
class TopicUserRelationshipsController < ApplicationController
  before_filter :signed_in_user

  def create
    @topic = Topic.find(params[:topic_user_relationship][:topic_id])
    current_user.topic_follow!(@topic)
    respond_to do |format|
      format.html { redirect_to @topic }
      format.js
    end
  end

  def destroy
    @topic = TopicUserRelationship.find(params[:id]).topic
    current_user.topic_unfollow!(@topic)
    respond_to do |format|
      format.html { redirect_to @topic }
      format.js
    end
  end
end