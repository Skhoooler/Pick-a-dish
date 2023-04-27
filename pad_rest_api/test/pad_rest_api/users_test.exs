defmodule PadRestApi.UsersTest do
  use PadRestApi.DataCase

  alias PadRestApi.Users

  describe "users" do
    alias PadRestApi.Users.User

    import PadRestApi.UsersFixtures

    @invalid_attrs %{email: nil, firstName: nil, hashedPass: nil, lastName: nil, middleName: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Users.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Users.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{email: "some email", firstName: "some firstName", hashedPass: "some hashedPass", lastName: "some lastName", middleName: "some middleName"}

      assert {:ok, %User{} = user} = Users.create_user(valid_attrs)
      assert user.email == "some email"
      assert user.firstName == "some firstName"
      assert user.hashedPass == "some hashedPass"
      assert user.lastName == "some lastName"
      assert user.middleName == "some middleName"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{email: "some updated email", firstName: "some updated firstName", hashedPass: "some updated hashedPass", lastName: "some updated lastName", middleName: "some updated middleName"}

      assert {:ok, %User{} = user} = Users.update_user(user, update_attrs)
      assert user.email == "some updated email"
      assert user.firstName == "some updated firstName"
      assert user.hashedPass == "some updated hashedPass"
      assert user.lastName == "some updated lastName"
      assert user.middleName == "some updated middleName"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_user(user, @invalid_attrs)
      assert user == Users.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Users.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Users.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Users.change_user(user)
    end
  end
end
