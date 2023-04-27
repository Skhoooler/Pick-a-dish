defmodule PadRestApiWeb.UserControllerTest do
  use PadRestApiWeb.ConnCase

  import PadRestApi.UsersFixtures

  alias PadRestApi.Users.User

  @create_attrs %{
    email: "some email",
    firstName: "some firstName",
    hashedPass: "some hashedPass",
    lastName: "some lastName",
    middleName: "some middleName"
  }
  @update_attrs %{
    email: "some updated email",
    firstName: "some updated firstName",
    hashedPass: "some updated hashedPass",
    lastName: "some updated lastName",
    middleName: "some updated middleName"
  }
  @invalid_attrs %{email: nil, firstName: nil, hashedPass: nil, lastName: nil, middleName: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all users", %{conn: conn} do
      conn = get(conn, ~p"/api/users")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create user" do
    test "renders user when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/users", user: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/users/#{id}")

      assert %{
               "id" => ^id,
               "email" => "some email",
               "firstName" => "some firstName",
               "hashedPass" => "some hashedPass",
               "lastName" => "some lastName",
               "middleName" => "some middleName"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/users", user: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update user" do
    setup [:create_user]

    test "renders user when data is valid", %{conn: conn, user: %User{id: id} = user} do
      conn = put(conn, ~p"/api/users/#{user}", user: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/users/#{id}")

      assert %{
               "id" => ^id,
               "email" => "some updated email",
               "firstName" => "some updated firstName",
               "hashedPass" => "some updated hashedPass",
               "lastName" => "some updated lastName",
               "middleName" => "some updated middleName"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn = put(conn, ~p"/api/users/#{user}", user: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete user" do
    setup [:create_user]

    test "deletes chosen user", %{conn: conn, user: user} do
      conn = delete(conn, ~p"/api/users/#{user}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/users/#{user}")
      end
    end
  end

  defp create_user(_) do
    user = user_fixture()
    %{user: user}
  end
end
