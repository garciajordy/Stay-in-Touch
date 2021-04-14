module ApplicationHelper
  def menu_link_to(link_text, link_path)
    class_name = current_page?(link_path) ? 'menu-item active' : 'menu-item'

    content_tag(:div, class: class_name) do
      link_to link_text, link_path
    end
  end

  def like_or_dislike_btn(post)
    like = Like.find_by(post: post, user: current_user)
    if like
      link_to('Dislike!', post_like_path(id: like.id, post_id: post.id), method: :delete)
    else
      link_to('Like!', post_likes_path(post_id: post.id), method: :post)
    end
  end

  def friend_or_unfriend_btn(user)
    @user = User.find(user.id)
    friend = (Friendship.where(user_id: @user.id, friend_id: current_user.id).or(Friendship.where(user_id: current_user.id, friend_id: user.id))).first
    if friend
      link_to('Cancel request', friendship_path(friend), method: :delete)
    else
      link_to('Add friend', friendships_path(user), method: :post)
    end
  end
end
